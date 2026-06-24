; ============================================================
; installer.iss  —  Inno Setup Script
; Generates Windows installer PreDiligenceLab_Setup.exe
; ============================================================

#define MyAppName "Pre-Diligence Lab"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "PreDiligenceLab"
#define MyAppExeName "PreDiligenceLab.exe"

[Setup]
AppId={{59F79FCE-ECBD-4C84-AA49-1092217EA03D}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=dist
OutputBaseFilename=PreDiligenceLab_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
; Uncomment if icon is available:
; SetupIconFile=assets\icon.ico
; UninstallDisplayIcon={app}\{#MyAppExeName}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional icons:"; Flags: checkedonce

[Files]
; PyInstaller output: dist\PreDiligenceLab\
; ├─ PreDiligenceLab.exe
; └─ _internal\   (PyQt6/.pyd/.dll etc.)
Source: "dist\PreDiligenceLab\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}";          Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}";    Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
