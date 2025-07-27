
function BuildConfigs {
    param (
        [string]$target
    )

    $targetPath = "build/SEALs Config - " + $target

    New-Item -Path $targetPath -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Modules\$target\gamedata" -Destination $targetPath -Exclude .bak

    $compress = @{
        Path = "$targetPath/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs Config - $target.zip"
    }
    Compress-Archive @compress -Force    
}

function BuildGAMMAConfigs {

    $target = "build/SEALs Config - GAMMA"

    New-Item -Path $target -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Modules\GAMMA\gamedata" -Destination $target -Exclude .bak

    $compress = @{
        Path = "$target/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs Config - GAMMA.zip"
    }
    Compress-Archive @compress -Force     
}

function Build3DSSConfigs {

    $target = "build/SEALs Config - 3DSS"

    New-Item -Path $target -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Modules\3DSS\gamedata" -Destination $target -Exclude .bak

    $compress = @{
        Path = "$target/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs Config - 3DSS.zip"
    }
    Compress-Archive @compress -Force         
}


BuildGAMMAConfigs
Build3DSSConfigs

# BuildConfigs "demo"
BuildConfigs "manufacturers"
# BuildConfigs "mods"
BuildConfigs "Anomaly"
BuildConfigs "RWAP"
BuildConfigs "ATHI"
BuildConfigs "BaS"


Remove-Item -Force -Recurse -Path "./build"