
function BuildConfigs {
    param (
        [string]$target,
        [string]$tag
    )

    $targetPath = "build/SEALs Config - " + $target
    Write-Host Building $target $tag

    if (Test-Path $targetPath){
        Remove-Item -Force -Recurse -Path $targetPath
    }
    New-Item -Path $targetPath -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\$target\gamedata" -Destination $targetPath -Exclude .gitignore

    if($tag -eq ""){
        $archive = "SEALs_Config-$target.zip"
    }else{
        $archive = "SEALs_Config-$target-$tag.zip"
    }


    $compress = @{
        Path = "$targetPath/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/$archive"
    }
    Compress-Archive @compress -Force    
}

function BuildConfigsAllInOne {

    $targetPath = "build/SEALs Config - AllInOne"
    Write-Host Building $targetPath

    New-Item -Path $targetPath -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\Anomaly\gamedata" -Destination $targetPath -Exclude .gitignore
    Copy-Item -Recurse -Force -Path ".\Module\GAMMA\gamedata" -Destination $targetPath -Exclude .gitignore
    Copy-Item -Recurse -Force -Path ".\Module\3DSS\gamedata" -Destination $targetPath -Exclude .gitignore
    Copy-Item -Recurse -Force -Path ".\Module\RWAP\gamedata" -Destination $targetPath -Exclude .gitignore
    Copy-Item -Recurse -Force -Path ".\Module\ATHI\gamedata" -Destination $targetPath -Exclude .gitignore
    Copy-Item -Recurse -Force -Path ".\Module\BaS\gamedata" -Destination $targetPath -Exclude .gitignore
    Copy-Item -Recurse -Force -Path ".\Module\Zona\gamedata" -Destination $targetPath -Exclude .gitignore

    $compress = @{
        Path = "$targetPath/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs_Config-AllInOne.zip"
    }
    Compress-Archive @compress -Force    
}

function BuildGAMMAConfigs {

    $target = "build/SEALs Config - GAMMA"
    Write-Host Building $target
    New-Item -Path $target -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\GAMMA\gamedata" -Destination $target -Exclude seals_group_gamma.ltx,.gitignore
    New-Item -Path "$target\gamedata\configs\custom_seal_layers\groups\seals_group_gamma.ltx" | Out-Null

    $compress = @{
        Path = "$target/*" 
        CompressionLevel = "Fastest"
        DestinationPath = "release/SEALs_Config-GAMMA.zip"
    }
    Compress-Archive @compress -Force     
}

function Build3DSSConfigs {

    $target = "build/SEALs Config - 3DSS"
    Write-Host Building $target
    New-Item -Path $target -ItemType Directory | Out-Null

    Copy-Item -Recurse -Force -Path ".\Module\3DSS\gamedata" -Destination $target -Exclude seals_group_3dss.ltx,.gitignore
    New-Item -Path "$target\gamedata\configs\custom_seal_layers\groups\seals_group_3dss.ltx" | Out-Null

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
BuildConfigs "GAMMA" "0.9.4"
BuildConfigs "3DSS" "3.11"
BuildConfigs "RWAP"
BuildConfigs "ATHI"
BuildConfigs "BaS"
BuildConfigs "Zona"
BuildConfigs "EXP Redux"
BuildConfigsAllInOne

Remove-Item -Force -Recurse -Path "./build"