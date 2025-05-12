object FormRequestVRConfiguration: TFormRequestVRConfiguration
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Input your VR configuration you use the most'
  ClientHeight = 441
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object LabelHMD: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 15
    Caption = 'HMD:'
  end
  object LabelController: TLabel
    Left = 208
    Top = 8
    Width = 56
    Height = 15
    Caption = 'Controller:'
  end
  object LabelBasestations: TLabel
    Left = 440
    Top = 8
    Width = 68
    Height = 15
    Caption = 'Basestations:'
  end
  object LabelFBT: TLabel
    Left = 640
    Top = 8
    Width = 90
    Height = 15
    Caption = 'Fullbody Tracker:'
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 29
    Width = 185
    Height = 404
    Align = alCustom
    ItemHeight = 15
    Items.Strings = (
      'Valve Index'
      'HTC Vive'
      'HTC Vive 2'
      'HTC Vive Cosmos'
      'HTC Vive XR Elite'
      'Oculus Rift DK1'
      'Oculus Rift DK2'
      'Oculus Rift'
      'Oculus Rift S'
      'Oculus Quest 1'
      'Oculus/Meta Quest 2'
      'Meta Quest 3'
      'Meta Quest 3S'
      'Windows Mixed Reality')
    TabOrder = 0
  end
  object CheckListBox2: TCheckListBox
    Left = 208
    Top = 29
    Width = 217
    Height = 404
    Align = alCustom
    ItemHeight = 15
    Items.Strings = (
      'Valve Index Controller'
      'HTC Vive 1.0 Controller'
      'HTC Vive 2.0 Controller'
      'HTC Vive Cosmos Controller'
      'HTC Vive XR Elite Controller'
      'Oculus Rift Controller'
      'Oculus Rift S Controller'
      'Oculus Quest 1 Controller'
      'Oculus/Meta Quest 2 Controller'
      'Meta Quest 3(S) Controller'
      'Windows Mixed Reality Controller'
      'Gamepad Controller')
    TabOrder = 1
  end
  object CheckListBox3: TCheckListBox
    Left = 440
    Top = 29
    Width = 185
    Height = 404
    Align = alCustom
    ItemHeight = 15
    Items.Strings = (
      'Valve Index Lighthouse'
      'HTC Vive 1.0 Lighthouse'
      'HTC Vive 2.0 Lighthouse'
      'XBox Kinect 360'
      'XBox Kinect One'
      'Oculus Rift Cam Station'
      'Windows Mixed Reality Base')
    TabOrder = 2
  end
  object CheckListBox4: TCheckListBox
    Left = 640
    Top = 29
    Width = 185
    Height = 404
    Align = alCustom
    ItemHeight = 15
    Items.Strings = (
      'HTC Vive Tracker 1.0'
      'HTC Vive Tracker 2.0'
      'HTC Vive Tracker 3.0'
      'HTC Vive Ultimate Tracker'
      'Kinect Tracking'
      'Tundra Tracker')
    TabOrder = 3
  end
end
