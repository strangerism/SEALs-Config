
function BuildConfigs {
    param (
        [string]$target
    )

    $targetPath = "build/SEALs Config - " + $target

    New-Item -Path $targetPath -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\$target\gamedata" -Destination $targetPath -Exclude .bak

    $compress = @{
        Path = "$targetPath/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs_Config-$target.zip"
    }
    Compress-Archive @compress -Force    
}

function BuildConfigsAllInOne {

    $targetPath = "build/SEALs Config - AllInOne"

    New-Item -Path $targetPath -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\Anomaly\gamedata" -Destination $targetPath -Exclude .bak
    Copy-Item -Recurse -Force -Path ".\Module\GAMMA\gamedata" -Destination $targetPath -Exclude .bak
    Copy-Item -Recurse -Force -Path ".\Module\3DSS\gamedata" -Destination $targetPath -Exclude .bak
    Copy-Item -Recurse -Force -Path ".\Module\RWAP\gamedata" -Destination $targetPath -Exclude .bak
    Copy-Item -Recurse -Force -Path ".\Module\ATHI\gamedata" -Destination $targetPath -Exclude .bak
    Copy-Item -Recurse -Force -Path ".\Module\BaS\gamedata" -Destination $targetPath -Exclude .bak
    Copy-Item -Recurse -Force -Path ".\Module\Zona\gamedata" -Destination $targetPath -Exclude .bak

    $compress = @{
        Path = "$targetPath/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs_Config-AllInOne.zip"
    }
    Compress-Archive @compress -Force    
}

function BuildGAMMAConfigs {

    $target = "build/SEALs Config - GAMMA"

    New-Item -Path $target -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\GAMMA\gamedata" -Destination $target -Exclude .bak

    $compress = @{
        Path = "$target/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs_Config-GAMMA.zip"
    }
    Compress-Archive @compress -Force     
}

function Build3DSSConfigs {

    $target = "build/SEALs Config - 3DSS"

    New-Item -Path $target -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\3DSS\gamedata" -Destination $target -Exclude .bak

    $compress = @{
        Path = "$target/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs_Config-3DSS.zip"
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
BuildConfigs "Zona"
BuildConfigsAllInOne

Remove-Item -Force -Recurse -Path "./build"