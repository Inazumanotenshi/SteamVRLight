unit VRConfig;

interface

uses
  Winapi.Windows, System.Classes, IOUtils, ShellAPI, System.SysUtils, System.Variants;

type
  TSetupConfiguration = class(TObject)
  private
    FSetup: string;
    FHMD: string;
    FController: string;
    FHasFBTracker: Boolean;
    FFullbodyTracker: string;
    FHasBaseStation: Boolean;
    FBaseStation: string;

  public
    constructor Create; overload;
    constructor Create(const ASetup, AHMD, AController: string;
      AHasFBTracker: Boolean; const AFullbodyTracker: string;
      AHasBaseStation: Boolean; const ABaseStation: string); overload;

    property Setup: string            read FSetup             write FSetup;
    property HMD: string              read FHMD               write FHMD;
    property Controller: string       read FController        write FController;
    property HasFBTracker: Boolean    read FHasFBTracker      write FHasFBTracker;
    property FullbodyTracker: string  read FFullbodyTracker   write FFullbodyTracker;
    property HasBaseStation: Boolean  read FHasBaseStation    write FHasBaseStation;
    property BaseStation: string      read FBaseStation       write FBaseStation;
  end;

implementation

{ TSetupConfiguration }

constructor TSetupConfiguration.Create;
begin
  inherited Create;
end;

constructor TSetupConfiguration.Create(const ASetup, AHMD, AController: string;
  AHasFBTracker: Boolean; const AFullbodyTracker: string;
  AHasBaseStation: Boolean; const ABaseStation: string);
begin
  inherited Create;
  FSetup := ASetup;
  FHMD := AHMD;
  FController := AController;
  FHasFBTracker := AHasFBTracker;
  FFullbodyTracker := AFullbodyTracker;
  FHasBaseStation := AHasBaseStation;
  FBaseStation := ABaseStation;
end;






end.
