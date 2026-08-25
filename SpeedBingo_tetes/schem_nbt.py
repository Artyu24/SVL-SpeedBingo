import base64, copy, gzip, json, struct, sys

T_END=0; T_BYTE=1; T_SHORT=2; T_INT=3; T_LONG=4; T_FLOAT=5; T_DOUBLE=6; T_BYTES=7; T_STRING=8; T_LIST=9; T_COMPOUND=10; T_INTS=11; T_LONGS=12

def read_n(s, n):
    b=s.read(n)
    if len(b)!=n: raise EOFError
    return b

def u16(s): return struct.unpack('>H', read_n(s,2))[0]
def string(s): return read_n(s,u16(s)).decode('utf-8')
def payload(s,t):
    if t==T_BYTE: return struct.unpack('>b',read_n(s,1))[0]
    if t==T_SHORT: return struct.unpack('>h',read_n(s,2))[0]
    if t==T_INT: return struct.unpack('>i',read_n(s,4))[0]
    if t==T_LONG: return struct.unpack('>q',read_n(s,8))[0]
    if t==T_FLOAT: return struct.unpack('>f',read_n(s,4))[0]
    if t==T_DOUBLE: return struct.unpack('>d',read_n(s,8))[0]
    if t==T_BYTES: return read_n(s,struct.unpack('>i',read_n(s,4))[0])
    if t==T_STRING: return string(s)
    if t==T_LIST:
        et=struct.unpack('>B',read_n(s,1))[0]; n=struct.unpack('>i',read_n(s,4))[0]
        return ('list',et,[payload(s,et) for _ in range(n)])
    if t==T_COMPOUND:
        out=[]
        while True:
            et=struct.unpack('>B',read_n(s,1))[0]
            if et==T_END: break
            out.append([et,string(s),payload(s,et)])
        return ('compound',out)
    if t==T_INTS:
        n=struct.unpack('>i',read_n(s,4))[0]; return list(struct.unpack('>'+str(n)+'i',read_n(s,4*n)))
    if t==T_LONGS:
        n=struct.unpack('>i',read_n(s,4))[0]; return list(struct.unpack('>'+str(n)+'q',read_n(s,8*n)))
    raise ValueError(t)

def write_string(s,v):
    b=v.encode(); s.write(struct.pack('>H',len(b))); s.write(b)
def write_payload(s,t,v):
    if t==T_BYTE: s.write(struct.pack('>b',v))
    elif t==T_SHORT: s.write(struct.pack('>h',v))
    elif t==T_INT: s.write(struct.pack('>i',v))
    elif t==T_LONG: s.write(struct.pack('>q',v))
    elif t==T_FLOAT: s.write(struct.pack('>f',v))
    elif t==T_DOUBLE: s.write(struct.pack('>d',v))
    elif t==T_BYTES: s.write(struct.pack('>i',len(v))); s.write(v)
    elif t==T_STRING: write_string(s,v)
    elif t==T_LIST:
        _,et,a=v; s.write(struct.pack('>Bi',et,len(a)))
        for x in a: write_payload(s,et,x)
    elif t==T_COMPOUND:
        for et,n,x in v[1]: s.write(struct.pack('>B',et)); write_string(s,n); write_payload(s,et,x)
        s.write(b'\0')
    elif t==T_INTS:
        s.write(struct.pack('>i',len(v))); s.write(struct.pack('>'+str(len(v))+'i',*v))
    elif t==T_LONGS:
        s.write(struct.pack('>i',len(v))); s.write(struct.pack('>'+str(len(v))+'q',*v))

def load(path):
    with gzip.open(path,'rb') as s:
        t=struct.unpack('>B',read_n(s,1))[0]; n=string(s); return t,n,payload(s,t)
def save(path,root):
    with gzip.GzipFile(path,'wb',mtime=0) as s:
        t,n,v=root; s.write(struct.pack('>B',t)); write_string(s,n); write_payload(s,t,v)

def walk(v,path=''):
    if isinstance(v,tuple) and v[0]=='compound':
        for e in v[1]:
            p=path+'/'+e[1]
            if e[1] in ('Command','Pos','Id','id'): print(p,repr(e[2]))
            walk(e[2],p)
    elif isinstance(v,tuple) and v[0]=='list':
        for i,x in enumerate(v[2]): walk(x,path+f'[{i}]')

def field(comp,name,default=None):
    if isinstance(comp,tuple) and comp[0]=='compound':
        for _,n,v in comp[1]:
            if n==name: return v
    return default

def varints(data):
    out=[]; value=shift=0
    for raw in data:
        value |= (raw & 127) << shift
        if raw & 128: shift += 7
        else: out.append(value); value=shift=0
    return out

def encode_varints(values):
    out=bytearray()
    for value in values:
        while True:
            b=value & 127; value >>= 7
            out.append(b | (128 if value else 0))
            if not value: break
    return bytes(out)

def set_field(comp,name,value):
    for e in comp[1]:
        if e[1]==name: e[2]=value; return
    raise KeyError(name)

def replace_commands(root,out_path):
    commands={
        (14,0,9): 'scoreboard objectives add mymy2_actif dummy',
        (14,1,9): 'scoreboard objectives add mymy2_timer dummy',
        (14,0,10): 'fill 117 108 554 117 115 581 air',
        (14,0,11): 'scoreboard players set #salle1 mymy2_timer 0',
        (14,0,12): 'scoreboard players set #salle1 mymy2_actif 1',
        (14,0,13): 'experience add @p[x=118,y=108,z=554,dx=12,dy=10,dz=29] 10 levels',
        (14,0,15): 'execute if score #salle1 mymy2_actif matches 1 run scoreboard players add #salle1 mymy2_timer 1',
        (14,0,16): 'execute if score #salle1 mymy2_timer matches 400 run fill 117 108 554 117 115 581 black_concrete',
        (14,0,17): '''execute if data block 128 108 582 Items[{id:"minecraft:paper",components:{"minecraft:custom_name":'{"text":"16"}'}}] run tellraw @p[x=128,y=108,z=582,distance=..8] {"text":"BONNE RÉPONSE !","color":"green","bold":true}''',
        (14,0,18): '''execute if data block 128 108 582 Items[{id:"minecraft:paper"}] unless data block 128 108 582 Items[{id:"minecraft:paper",components:{"minecraft:custom_name":'{"text":"16"}'}}] run tellraw @p[x=128,y=108,z=582,distance=..8] {"text":"MAUVAISE RÉPONSE !","color":"red","bold":true}''',
        (14,0,19): 'execute if data block 128 108 582 Items[{id:"minecraft:paper"}] run data remove block 128 108 582 Items[{id:"minecraft:paper"}]',
    }
    bes=field(root,'BlockEntities')[2]
    template=None; found=set()
    for be in bes:
        if field(be,'Id')=='minecraft:command_block':
            pos=tuple(field(be,'Pos')); template=template or be
            if pos in commands: set_field(be,'Command',commands[pos]); found.add(pos)
    w,h,l=(field(root,x) for x in ('Width','Height','Length'))
    palette=field(root,'Palette')
    types={
        (14,1,9): 'minecraft:command_block[conditional=false,facing=down]',
        (14,0,15): 'minecraft:repeating_command_block[conditional=false,facing=south]',
    }
    chain='minecraft:chain_command_block[conditional=false,facing=south]'
    def palette_id(block):
        entry=next((e for e in palette[1] if e[1]==block),None)
        if entry is not None: return entry[2]
        pid=field(root,'PaletteMax'); palette[1].append([T_INT,block,pid]); set_field(root,'PaletteMax',pid+1); return pid
    blocks=varints(field(root,'BlockData'))
    for pos in commands.keys()-found:
        x,y,z=pos; blocks[x+z*w+y*w*l]=palette_id(types.get(pos,chain))
        if template is None:
            be=('compound',[
                [T_BYTE,'conditionMet',1], [T_BYTE,'auto',0 if pos==(14,1,9) else 1],
                [T_BYTE,'powered',0], [T_STRING,'Command',commands[pos]], [T_LONG,'LastExecution',0],
                [T_STRING,'Id','minecraft:command_block'], [T_INT,'SuccessCount',0],
                [T_BYTE,'TrackOutput',1], [T_BYTE,'UpdateLastExecution',1], [T_INTS,'Pos',list(pos)]
            ])
        else:
            be=copy.deepcopy(template); set_field(be,'Pos',list(pos)); set_field(be,'Command',commands[pos])
            set_field(be,'auto',0 if pos==(14,1,9) else 1)
        bes.append(be)
    set_field(root,'BlockData',encode_varints(blocks))
    # Met également le panneau visible en cohérence avec les 20 secondes.
    def replace_text(v):
        if isinstance(v,str): return v.replace('30 secondes', '20 secondes')
        if isinstance(v,tuple):
            seq=v[1] if v[0]=='compound' else v[2]
            for e in seq:
                if v[0]=='compound': e[2]=replace_text(e[2])
                else:
                    i=seq.index(e); seq[i]=replace_text(e)
        return v
    replace_text(root)
    save(out_path,(T_COMPOUND,'Schematic',root))

def inspect(root):
    w,h,l=(field(root,x) for x in ('Width','Height','Length'))
    pal=field(root,'Palette'); reverse={v:n for _,n,v in pal[1]}
    blocks=varints(field(root,'BlockData'))
    print('DIMENSIONS',w,h,l,'OFFSET',field(root,'Offset'))
    for be in field(root,'BlockEntities')[2]:
        pos=field(be,'Pos'); x,y,z=pos; block=reverse[blocks[x+z*w+y*w*l]]
        if field(be,'Id')=='minecraft:skull':
            profile=field(be,'profile'); props=field(profile,'properties')[2]
            textures=next(p for p in props if field(p,'name')=='textures')
            value=field(textures,'value'); url=json.loads(base64.b64decode(value))['textures']['SKIN']['url']
            print('HEAD',pos,block,url.rsplit('/',1)[-1])
        elif field(be,'Id')=='minecraft:command_block': print('CB',pos,block,field(be,'Command'))
        elif field(be,'Id') in ('minecraft:barrel','minecraft:chest'): print('CONTAINER',pos,block)

if __name__=='__main__':
    root=load(sys.argv[1])
    if len(sys.argv)>2: replace_commands(root[2],sys.argv[2])
    else: inspect(root[2])
