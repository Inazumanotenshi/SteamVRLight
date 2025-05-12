object SteamVRLightWindow: TSteamVRLightWindow
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SteamVR Light'
  ClientHeight = 468
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  DesignSize = (
    645
    468)
  TextHeight = 13
  object ImagePreview: TImage
    Left = 8
    Top = 128
    Width = 385
    Height = 199
    Anchors = [akBottom]
    Center = True
    Proportional = True
    Stretch = True
    ExplicitTop = 93
  end
  object BtnSelectPath: TButton
    Left = 519
    Top = 37
    Width = 113
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Select SteamVR-Path'
    TabOrder = 0
    OnClick = BtnSelectPathClick
  end
  object EditSteamVRPath: TEdit
    Left = 8
    Top = 39
    Width = 505
    Height = 21
    Hint = 'SteamVR-Path'
    Anchors = [akLeft, akTop, akRight]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
  end
  object CheckBoxIsDefaultInstallation: TCheckBox
    Left = 8
    Top = 16
    Width = 233
    Height = 17
    Caption = 'SteamVR-Standart-Installationspfad (C:\)'
    TabOrder = 2
    OnClick = CheckBoxIsDefaultInstallationClick
  end
  object BitBtnReinstall: TBitBtn
    Left = 335
    Top = 407
    Width = 302
    Height = 36
    Anchors = [akRight, akBottom]
    Caption = '&Zur'#252'cksetzen'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtnReinstallClick
  end
  object BitBtnClose: TBitBtn
    Left = 8
    Top = 407
    Width = 321
    Height = 36
    Anchors = [akLeft, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtnCloseClick
  end
  object BitBtnInstall: TBitBtn
    Left = 8
    Top = 366
    Width = 629
    Height = 34
    Anchors = [akBottom]
    Caption = '&Pack installieren'
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitBtnInstallClick
  end
  object MemoLog: TMemo
    Left = 399
    Top = 128
    Width = 238
    Height = 197
    Anchors = [akBottom]
    Lines.Strings = (
      'MemoLog')
    ReadOnly = True
    TabOrder = 6
  end
  object StatusBarInstallation: TProgressBar
    Left = 8
    Top = 333
    Width = 624
    Height = 27
    Anchors = [akBottom]
    TabOrder = 7
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 449
    Width = 645
    Height = 19
    Panels = <
      item
        Text = 'Key:'
        Width = 50
      end>
  end
  object CheckBoxStart: TCheckBox
    Left = 480
    Top = 16
    Width = 152
    Height = 17
    Caption = 'Start after installation'
    TabOrder = 9
  end
  object SelectPack: TComboBox
    Left = 8
    Top = 101
    Width = 629
    Height = 21
    Anchors = [akBottom]
    TabOrder = 10
    Text = 'Select pack...'
    OnChange = SelectPackChange
  end
  object ButtonImportPack: TButton
    Left = 8
    Top = 66
    Width = 321
    Height = 25
    Caption = 'Import SteamVR-pack... (ZIP-archive)'
    TabOrder = 11
    OnClick = ButtonImportPackClick
  end
  object ButtonDeletePack: TButton
    Left = 335
    Top = 66
    Width = 302
    Height = 25
    Caption = 'Delete pack'
    TabOrder = 12
    OnClick = ButtonDeletePackClick
  end
  object BitBtnIssue: TBitBtn
    Left = 608
    Top = 97
    Width = 29
    Height = 25
    Hint = 'Press to see compatibility issues'
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 13
  end
  object OpenDialogSelectPath: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 320
  end
  object OpenDialogCopy: TOpenDialog
    Left = 288
  end
  object OpenPictureDialogLoadPicturePreview: TOpenPictureDialog
    Left = 352
  end
  object NotificationCenter1: TNotificationCenter
    Left = 256
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 384
  end
  object Timer1: TTimer
    Left = 416
  end
end
