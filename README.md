# SEALs Config

![alt text](/doc/images/SEALs_configs.png)

This is the repository of SEALs configs modules. If you looking for the main project head over here [SEAls](https://github.com/strangerism/SEALs)

This repos contain my own contribution to the SEALs mod with several configuration module. Each can be installed indipendently.

## Configs Modules

Here is the list of modules:

- **Anomaly**: Applies Anomaly seals to all weapons from the base game (this is a static prefab configuration).

- **3DSS**: Applies 3DSS seals to all weapons that support this kind of scopes (this is a blank prefab configuration ready to be compiled with data).

- **GAMMA**: Applies seals to all available GAMMA weapons, such weapons are present in loadouts and can drop in game (this is a blank prefab configuration ready to be compiled with data).

- **BaS**: Applies seals to all weapons that have been updated/added in the in the Boomsticks and Sharpsticks mod [BaS](https://www.moddb.com/mods/stalker-anomaly/addons/boomsticks-and-sharpsticks). Use it only if you have **BaS** installed.

- **ATHI**: Applies seals to all weapons that are made or re-packaged by ATHI. You need to have **all** ATHI mods for this to be effective. For instance it could tag a VANILLA weapon regardless if you have the ATHI repackage of that weapoon. Do not use if you don't have ATHI full armory installed. 

- **RWAP**: Applies seals to all weapons that are made or re-packaged in Retrogue's mod [RWAP](https://www.moddb.com/mods/stalker-anomaly/addons/rwap). Use it only if you have **RWAP** installed.

- **manufacturers**: applies manufacturers seals to guns (this is an example config, it only contains few manufacturers)

- **mods**: applies mods related seals (this is an example for static configurations)

Most of the configs are static apart for GAMMA and 3DSS which needs the SEALs CLI to be populated with modlist data.

> static configuration are mainly manually edited (e.g. guns added manually to a list) in contrast to the modlist based configs that are populated dynamically by scanning the modlist at launch.

## How to build the modules

By launching the powershell `build.ps1` file in a windows terminal will build all the modules as above.

```shell
./build.ps1
```

## How to install the modules

![config_install](/doc/images/config_install.png)

Install the archives in MO2 as usual, put them along side the main module. Order is not important.

You need to install **CLI** as well if you want to use **GAMMA** and **3DSS** config modules.

## How to contribute

You can clone the repository and share your own contribution if you whish. 

The rules for contribution are the following:

- add your changes or new config to a branch

- do not use textures that are covered under copyright laws (especially from gun manufactorers)

- push your contribution branch for review and merge

## Credits and disclaimers

All icons and SEALs images for this project have been generated using ai tools

# Safe journey all

![alt text](/doc/images/SEALs_goodbye.png)







