unit FormRequestVRConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst;

type
  TFormRequestVRConfiguration = class(TForm)
    LabelHMD: TLabel;
    LabelController: TLabel;
    LabelBasestations: TLabel;
    LabelFBT: TLabel;
    CheckListBox1: TCheckListBox;
    CheckListBox2: TCheckListBox;
    CheckListBox3: TCheckListBox;
    CheckListBox4: TCheckListBox;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormRequestVRConfiguration: TFormRequestVRConfiguration;

implementation

{$R *.dfm}

end.
