unit FormCompabilityIssue;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.CheckLst;

type
  TFormIssueCompability = class(TForm)
    CheckListBox1: TCheckListBox;
    CheckListBox2: TCheckListBox;
    StatusBar1: TStatusBar;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormIssueCompability: TFormIssueCompability;

implementation

{$R *.dfm}

end.
