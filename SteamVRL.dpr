program SteamVRL;

uses
  Vcl.Forms,
  SteamVRLight in 'SteamVRLight.pas' {SteamVRLightWindow},
  Vcl.Themes,
  Vcl.Styles,
  FormCompabilityIssue in 'Forms\FormCompabilityIssue.pas' {FormIssueCompability},
  VRConfig in 'Units\VRConfig.pas',
  FormRequestVRConfig in 'Forms\FormRequestVRConfig.pas' {FormRequestVRConfiguration};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TSteamVRLightWindow, SteamVRLightWindow);
  Application.CreateForm(TFormIssueCompability, FormIssueCompability);
  Application.CreateForm(TFormRequestVRConfiguration, FormRequestVRConfiguration);
  Application.Run;
end.
