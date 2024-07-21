unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.Win.Registry,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    EditSteamVRPath: TEdit;
    ButtonSelectPath: TButton;
    BitBtnConfirmPath: TBitBtn;
    Label1: TLabel;
    CheckBoxAutoDetectPath: TCheckBox;
    ActionList1: TActionList;
    Image1: TImage;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    procedure CheckBoxAutoDetectPathClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CheckBoxAutoDetectPathClick(Sender: TObject);

  function GetSteamVRPath: string;
  var
    Reg: TRegistry;
  begin
    Result := '';
    Reg := TRegistry.Create(KEY_READ);
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      // Check for the SteamVR path in the registry
      if Reg.OpenKey('\Software\Valve\Steam\Apps\250820', False) then
      begin
        Result := Reg.ReadString('InstallDir');
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
    end;
    if Result = '' then
      Result := 'C:\Program Files (x86)\Steam\steamapps\common\SteamVR\';
  end;

begin
  if CheckBoxAutoDetectPath.Checked then
  begin
    ButtonSelectPath.Enabled := false;
    BitBtnConfirmPath.Enabled := false;
    EditSteamVRPath.Text := GetSteamVRPath;

  end;

end;


end.
