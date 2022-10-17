# Project Setup 

## Description

This tool provides a way to create a default maya project with an empty group named after the asset.

Asset name can be set in Environment Variables or using the PowerShell alias located at etc/aliases.ps1

## Arguements

- `--root_path`: This sets the root project path. Maya file will be created in *root_path*/asset/**asset_name**/maya/scenes/**asset_name**. Current directory will be used if the arguement not provided.

- `--file_name`: This sets the Maya project name. Maya file will be created in *root_path*/asset/**asset_name**/maya/scenes/*file_name*. Asset environment variable will be used as file_name if the arguement not provided.

## Additional Instructions

To Install aliases in Powershell use the **Import-Module etc/aliases.ps1** command.

To set the asset name use the *asset* alias.

***For Example:*** 

    Import-Module .\etc\aliases.ps1
    asset -AssetName "RubberToy" 

**Note:** To permanently install the alias copy the commands in aliases.ps1 to $PROFILE for use in Powershell.   

## Examples 
1.

    asset -AssetName "RubberToy"

    mayapy main.py --root_path "C:\Users\Divyansh Mishra\Desktop\Projects" 

The above command will generate the below:

    C:\Users\Divyansh Mishra\Desktop\Projects\assets\RubberToy\maya\scenes\RubberToy.ma 


2.

    asset -AssetName "PigHead"

    mayapy main.py --root_path "C:\Users\Divyansh Mishra\Desktop\Projects" --file_name "MayaTest" 

The above command will generate the below:

    C:\Users\Divyansh Mishra\Desktop\Projects\assets\PigHead\maya\scenes\MayaTest.ma 




