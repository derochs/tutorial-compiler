tsc
Copy-Item -Force -Recurse -Path $PSScriptRoot\engine\parser.def -Destination $PSScriptRoot\build\engine\parser.def
Copy-Item -Force -Recurse -Path $PSScriptRoot\..\tutorials -Destination $PSScriptRoot\build\playbooks
Copy-Item -Force -Recurse -Path $PSScriptRoot\environments\ -Destination $PSScriptRoot\build
Copy-Item -Force -Recurse -Path $PSScriptRoot\runners\ -Destination $PSScriptRoot\build
npm test
if(-not $?) { throw 'tests failed' } 
node $PSScriptRoot\build\engine\run.js