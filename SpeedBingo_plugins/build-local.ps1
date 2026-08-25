$ErrorActionPreference = 'Stop'

$serverLibraries = 'C:\Users\vauch\Documents\server\libraries'
$paperApi = Join-Path $serverLibraries 'io\papermc\paper\paper-api\1.21.11-R0.1-SNAPSHOT\paper-api-1.21.11-R0.1-SNAPSHOT.jar'
$adventureApi = Join-Path $serverLibraries 'net\kyori\adventure-api\4.26.1\adventure-api-4.26.1.jar'
$adventureKey = Join-Path $serverLibraries 'net\kyori\adventure-key\4.26.1\adventure-key-4.26.1.jar'
$examinationApi = Join-Path $serverLibraries 'net\kyori\examination-api\1.3.0\examination-api-1.3.0.jar'
$examinationString = Join-Path $serverLibraries 'net\kyori\examination-string\1.3.0\examination-string-1.3.0.jar'
$bungeeChat = Join-Path $serverLibraries 'net\md-5\bungeecord-chat\1.21-R0.2-deprecated+build.21\bungeecord-chat-1.21-R0.2-deprecated+build.21.jar'
$annotations = 'C:\Users\vauch\.gradle\caches\modules-2\files-2.1\org.jetbrains\annotations\26.0.2\c7ce3cdeda3d18909368dfe5977332dfad326c6d\annotations-26.0.2.jar'
$guava = Join-Path $serverLibraries 'com\google\guava\guava\33.6.0-jre\guava-33.6.0-jre.jar'
$classpath = @($paperApi, $adventureApi, $adventureKey, $examinationApi, $examinationString, $bungeeChat, $annotations, $guava) -join ';'

$buildRoot = Join-Path $PSScriptRoot 'build'
$classes = Join-Path $buildRoot 'classes'
$resources = Join-Path $buildRoot 'resources'
$libs = Join-Path $buildRoot 'libs'

New-Item -ItemType Directory -Force -Path $classes, $resources, $libs | Out-Null
$sources = Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot 'src\main\java') -Recurse -Filter '*.java'
javac --release 21 -encoding UTF-8 -cp $classpath -d $classes $sources.FullName
if ($LASTEXITCODE -ne 0) { throw 'Échec de la compilation Java.' }

$pluginYml = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'src\main\resources\plugin.yml') -Raw
$pluginYml.Replace('${version}', '1.0.0') | Set-Content -LiteralPath (Join-Path $resources 'plugin.yml') -Encoding UTF8
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'src\main\resources\config.yml') -Destination (Join-Path $resources 'config.yml') -Force

$jarPath = Join-Path $libs 'speed-bingo-simon-1.0.0.jar'
jar --create --file $jarPath -C $classes . -C $resources .
if ($LASTEXITCODE -ne 0) { throw 'Échec de la création du JAR.' }
Write-Output $jarPath

$mastermindResources = Join-Path $buildRoot 'mastermind-resources'
New-Item -ItemType Directory -Force -Path $mastermindResources | Out-Null
$mastermindYml = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'src\mastermind\resources\plugin.yml') -Raw
$mastermindYml.Replace('${version}', '1.0.0') | Set-Content -LiteralPath (Join-Path $mastermindResources 'plugin.yml') -Encoding UTF8
$mastermindJarPath = Join-Path $libs 'speed-bingo-mastermind-1.0.0.jar'
jar --create --file $mastermindJarPath -C $classes . -C $mastermindResources .
if ($LASTEXITCODE -ne 0) { throw 'Échec de la création du JAR Mastermind.' }
Write-Output $mastermindJarPath
