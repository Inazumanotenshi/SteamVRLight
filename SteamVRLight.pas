unit SteamVRLight;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IOUtils, Vcl.Buttons, ShellAPI,
  Vcl.ExtCtrls, Vcl.ExtDlgs, System.Notification, Vcl.Imaging.pngimage, System.Zip, //System.rar ,
  Vcl.ComCtrls,

  VRConfig;

type
  TSteamVRLightWindow = class(TForm)
    BtnSelectPath: TButton;
    EditSteamVRPath: TEdit;
    CheckBoxIsDefaultInstallation: TCheckBox;
    OpenDialogSelectPath: TFileOpenDialog;
    BitBtnReinstall: TBitBtn;
    BitBtnClose: TBitBtn;
    OpenDialogCopy: TOpenDialog;
    OpenPictureDialogLoadPicturePreview: TOpenPictureDialog;
    ImagePreview: TImage;
    BitBtnInstall: TBitBtn;
    NotificationCenter1: TNotificationCenter;
    MemoLog: TMemo;
    StatusBarInstallation: TProgressBar;
    StatusBar1: TStatusBar;
    CheckBoxStart: TCheckBox;
    SelectPack: TComboBox;
    FileOpenDialog1: TFileOpenDialog;
    ButtonImportPack: TButton;
    Timer1: TTimer;
    ButtonDeletePack: TButton;
    BitBtnIssue: TBitBtn;
    procedure CheckBoxIsDefaultInstallationClick(Sender: TObject);
    procedure BtnSelectPathClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnReinstallClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtnInstallClick(Sender: TObject);
    procedure SelectPackChange(Sender: TObject);
    procedure ButtonImportPackClick(Sender: TObject);
    procedure ButtonDeletePackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    ItemsPacks: TListbox;
    ListFileDir, Files: TSTringList;
  public

  end;

var
  SteamVRLightWindow: TSteamVRLightWindow;

implementation

{$R *.dfm}

function GetFilenames(const Path: string; const FileList: TStringList ): Boolean;
var
  SR: TSearchRec;
begin
  Assert(Assigned(FileList));      // Make sure it was created and passed in
  FileList.Clear;                  // Remove any previous names
  if FindFirst(Path+'*.zip', faAnyFile, SR) = 0 then
  repeat
    FileList.Add(SR.Name);
  until FindNext(SR) <> 0;
  FindClose(SR);
  Result := FileList.Count > 0;  // Return true if we have found any files
end;

procedure ExecuteSteamVR(Path: string);
var
 SEInfo: TShellExecuteInfo;
 ExitCode: DWORD;
 ExecuteFile, ParamString, StartInString: string;
begin
 ExecuteFile:='steam://run/250820';

 FillChar(SEInfo, SizeOf(SEInfo), 0) ;
 SEInfo.cbSize := SizeOf(TShellExecuteInfo) ;
 with SEInfo do
 begin
   fMask := SEE_MASK_NOCLOSEPROCESS;
   Wnd := Application.Handle;
   lpFile := PChar(ExecuteFile) ;
      {
      ParamString can contain the
      application parameters.
      }
      // lpParameters := PChar(ParamString) ;
      {
      StartInString specifies the
      name of the working directory.
      If ommited, the current directory is used.
      }
      // lpDirectory := PChar(StartInString) ;
  nShow := SW_SHOWNORMAL;
 end;
 if ShellExecuteEx(@SEInfo) then
 begin
   repeat
   Application.ProcessMessages;
   GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
   until (ExitCode <> STILL_ACTIVE) or
   Application.Terminated;
   ShowMessage('SteamVR wird gestartet') ;
   end
 else ShowMessage('SteamVR konnte nicht gestartet werden!') ;
end;

procedure TSteamVRLightWindow.BitBtnCloseClick(Sender: TObject);
begin
  var Alert := NotificationCenter1.CreateNotification;
  Alert.Name := 'Message';
  Alert.Title := 'Stopping progress';
  Alert.AlertBody := 'Good Bye!';
  NotificationCenter1.PresentNotification(Alert);
  close;
end;


procedure TSteamVRLightWindow.BitBtnInstallClick(Sender: TObject);
begin
  //TODO: Installation ausführen
  if EditSteamVRPath.Text = '' then
  begin
     var Alert := NotificationCenter1.CreateNotification;
      Alert.Name := 'Error!';
      Alert.Title := 'SteamVRLight has found an issue!';
      Alert.AlertBody := 'There was no SteamVR-Path selected!';
      NotificationCenter1.PresentNotification(Alert);
  end
    else
  begin
     MemoLog.Lines.Add('Searching for Installation-path:');
     if TDirectory.Exists(EditSteamVRPath.Text) then
     begin
      MemoLog.Lines.Add('Founded!');
      StatusBarInstallation.Position := 5;
      MemoLog.Lines.Add('Searching for SteamVR-pack:');
      if TDirectory.Exists('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Text, '')) then
      begin
        MemoLog.Lines.Add('Founded!');
        StatusBarInstallation.Position := StatusBarInstallation.Position + 5;
        MemoLog.Lines.Add('Installation started!');
        //ToDo: Copy SteamVR to SteamVR-Directory
        tDirectory.Copy('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Text, ''), EditSteamVRPath.Text);MemoLog.Lines.Add('Test if Files are complete');
        StatusBarInstallation.Position := StatusBarInstallation.Position + 5;
        MemoLog.Lines.Add('Complete!');
        StatusBarInstallation.Position := StatusBarInstallation.Position + 5;
        MemoLog.Lines.Add('Installation Finished');
        StatusBarInstallation.Position := StatusBarInstallation.Position + 5;
        var Alert := NotificationCenter1.CreateNotification;
        Alert.Name := 'Finished!';
        Alert.Title := 'SteamVRLight has finished the installation!';
        Alert.AlertBody := 'You are done!';
        NotificationCenter1.PresentNotification(Alert);
        StatusBarInstallation.Position := 100;
        if CheckBoxStart.Checked then
        begin
          MemoLog.Lines.Add('running program...');
          //Start des Programms
          ExecuteSteamVR(EditSteamVRPath.Text);
        end;
      end
        else
      begin
        MemoLog.Lines.Add('Path not founded!');
        StatusBarInstallation.Position := 100;
      end;
     end
      else
     begin
       MemoLog.Lines.Add('Path not found!');
       StatusBarInstallation.Position := 100;
     end;
     TDirectory.Delete('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Text, ''), true);
  end;
end;

procedure TSteamVRLightWindow.BitBtnReinstallClick(Sender: TObject);
var Pr: string;
    Status: integer;
begin
  MemoLog.Clear;
  MemoLog.Lines.Add('Looking for directories...');
  if TDirectory.Exists('.\SteamVR-Original') then
    begin
      Status := 0;
      for Status := 0 to 50 do
      begin
        Pr:= IntToStr(Status)+'%';
        StatusBarInstallation.Position := Status;
        //Status := Status + 1;
      end;
      //ToDo: Copy Files from SteamVR-Original
      MemoLog.Lines.Add('Installation started!');
      tDirectory.Copy('.\SteamVR-Original\', EditSteamVRPath.Text);
      MemoLog.Lines.Add('Test if Files are complete');
      StatusBarInstallation.Position := StatusBarInstallation.Position + 5;
      MemoLog.Lines.Add('Complete!');
      StatusBarInstallation.Position := StatusBarInstallation.Position + 5;
      MemoLog.Lines.Add('Installation Finished');
      StatusBarInstallation.Position := StatusBarInstallation.Position + 5;
        var Alert := NotificationCenter1.CreateNotification;
        Alert.Name := 'Finished!';
        Alert.Title := 'SteamVRLight has finished the installation!';
        Alert.AlertBody := 'You are done!';
        NotificationCenter1.PresentNotification(Alert);
      StatusBarInstallation.Position := 100;
      if CheckBoxStart.Checked then
        begin
          MemoLog.Lines.Add('running program...');
          ExecuteSteamVR(EditSteamVRPath.Text);
          MemoLog.Lines.Add('Checking if everything works...');
          MemoLog.Lines.Add('Done. SteamVR has started!');
        end;
    end
      else
    begin
      StatusBarInstallation.BarColor := clRed;
      StatusBarInstallation.Position := 100;
      MemoLog.Lines.Add('Directory ./SteamVR-Original not found!');
      var Alert := NotificationCenter1.CreateNotification;
        Alert.Name := 'Warning';
        Alert.Title := 'There was an issue while installing the pack!';
        Alert.AlertBody := 'Please look for the SteamVR-Original-folder and put it in the folder where this application is or do a "Steam-Reset"!';
        NotificationCenter1.PresentNotification(Alert);
        Showmessage('Originales SteamVR nicht gefunden!' +#13#10+ 'Befolge diese Schritte:' +#13#10+ '1. Öffne deine Bibliothek in Steam' +#13#10+ '2. Suche nach SteamVR und klicke auf Eigenschaften' +#13#10+ '3. Gehe auf Lokale Dateien' +#13#10+ '4. Wähle Werkzeugdateien auf Fehler überprüfen');
    end;
end;

procedure TSteamVRLightWindow.BtnSelectPathClick(Sender: TObject);
var SteamVRPath: string;
begin
  OpenDialogSelectPath.Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
  if OpenDialogSelectPath.Execute then
    begin
      var FolderName:= ExtractFileName(OpenDialogSelectPath.FileName);
      if FolderName = 'SteamVR' then
      begin
        EditSteamVRPath.Text := OpenDialogSelectPath.FileName;
        var Alert := NotificationCenter1.CreateNotification;
        Alert.Name := 'Message';
        Alert.Title := 'SteamVR founded';
        Alert.AlertBody := 'Now press install to get icons or reset your SteamVR!';
        NotificationCenter1.PresentNotification(Alert);
      end
        else
      begin
        //Showmessage('Es wurde kein SteamVR-Verzeichnis gefunden. Bitte überprüfe, ob du das richtige Verzeichnis ausgewählt hast!');
        var Alert := NotificationCenter1.CreateNotification;
          Alert.Name := 'Warning';
          Alert.Title := 'There was an issue while installing the pack!';
          Alert.AlertBody := 'The SteamVR-path could not found. Please check for the right installation-path and retry again!';
          NotificationCenter1.PresentNotification(Alert);
      end;
    end
      else
    begin
      Showmessage('Vorgang abgebrochen!');
    end;
end;

procedure TSteamVRLightWindow.ButtonDeletePackClick(Sender: TObject);
begin
  if FileExists('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + SelectPack.Text) then
  begin
    TDirectory.Delete('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + SelectPack.Text);
  end;
end;

procedure TSteamVRLightWindow.ButtonImportPackClick(Sender: TObject);
begin
  OpenDialogCopy.Filter := 'Datei | *.zip;|ZIP-Dateien|*.zip';;
  if OpenDialogSelectPath.Execute then
  begin

  end;

end;

procedure TSteamVRLightWindow.CheckBoxIsDefaultInstallationClick(Sender: TObject);
begin
  if CheckBoxIsDefaultInstallation.Checked then
    begin
      EditSteamVRPath.Text := 'C:\Program Files (x86)\Steam\steamapps\common\SteamVR';
      BtnSelectPath.Enabled := false;
      var Alert := NotificationCenter1.CreateNotification;
        Alert.Name := 'Message';
        Alert.Title := 'Choose normal path';
        Alert.AlertBody := 'Is your SteamVR there? Okay, go on!';
        NotificationCenter1.PresentNotification(Alert);
    end
      else
    begin
      EditSteamVRPath.Clear;
      BtnSelectPath.Enabled := true;
      var Alert := NotificationCenter1.CreateNotification;
      Alert.Name := 'Message';
      Alert.Title := 'Choose custom path';
      Alert.AlertBody := 'Is your SteamVR not there? Okay, go on!';
      NotificationCenter1.PresentNotification(Alert);
    end;
end;


procedure TSteamVRLightWindow.FormActivate(Sender: TObject);
var
  i: integer;
  FilePath: string;
begin
  MemoLog.Clear;
  ListFileDir := TStringList.Create;
  FilePath := 'C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\';
  try
    if DirectoryExists('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\') then
    begin
      if GetFilenames(FilePath, ListFileDir) then
      begin
        // Process files here
        for i := 0 to ListFileDir.Count - 1 do
        begin
          SelectPack.Items.Add(ListFileDir[i]);
          MemoLog.Lines.Add('Füge ' + ListFileDir[i] + ' hinzu...');
        end;
      end;
    end
      else
    begin
      //Directory erstellen
    end;
  finally
    ListFileDir.Free;
  end;
end;

procedure TSteamVRLightWindow.FormCreate(Sender: TObject);
begin
  BitBtnIssue.Caption := '';
  BitBtnIssue.Visible := false;
end;

procedure TSteamVRLightWindow.SelectPackChange(Sender: TObject);
var KeyManager: string;
     ZipFile : TZipFile;
begin
  try
    for var I := SelectPack.Items.Count -1 downto 0 do
    begin
      if (DirectoryExists('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Items[i], '')) and not(ChangeFileExt(SelectPack.Items[i], '') = '')) then
      begin
       TDirectory.Delete('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Items[i], ''), true);
      end;
    end;

  finally

  end;


  ZipFile := TZipFile.Create;

  if FileExists('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + SelectPack.Text) then
    ZipFile.ExtractZipFile('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + SelectPack.Text, 'C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\');


  Timer1.Interval := 50000;
  Timer1.Enabled := true;


  try
    if FileExists('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Text, '') + '\Example.png') then
      ImagePreview.Picture.LoadFromFile('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Text, '') + '\Example.png');

    if TFile.Exists('C:\Program Files (x86)\Steam\steamapps\common\SteamVRLight\Packs\' + ChangeFileExt(SelectPack.Text, '') + '\Reference.permission') then
    begin
      KeyManager := InputBox('Key required','SteamVR-Light is using a key for this pack. Please insert the key:','');
      if not (KeyManager = 'DKMFIV') then //DelphiKeyManagerFile is Valid
      begin
        Showmessage('Wrong key!');
        close;
      end
        else
      begin
        StatusBar1.Panels[0].Text := 'Key: ' + KeyManager;
      end;
    end;
  finally
    Timer1.Free;
    ZipFile.Free;
  end;
end;

end.
