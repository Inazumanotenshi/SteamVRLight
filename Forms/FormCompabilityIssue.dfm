object FormIssueCompability: TFormIssueCompability
  Left = 0
  Top = 0
  Caption = 'compatibility issues detected'
  ClientHeight = 441
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 0
    Width = 225
    Height = 422
    Align = alLeft
    ItemHeight = 15
    TabOrder = 0
    ExplicitHeight = 441
  end
  object CheckListBox2: TCheckListBox
    Left = 225
    Top = 0
    Width = 225
    Height = 422
    Align = alRight
    ItemHeight = 15
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitHeight = 441
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 450
    Height = 19
    Panels = <>
    ExplicitLeft = 208
    ExplicitTop = 424
    ExplicitWidth = 0
  end
end
