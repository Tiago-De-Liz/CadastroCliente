object frmServerPrincipal: TfrmServerPrincipal
  Left = 271
  Top = 114
  Caption = 'Server_Principal'
  ClientHeight = 235
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Button1: TButton
    Left = 102
    Top = 80
    Width = 163
    Height = 57
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object FServer: TIdHTTPServer
    Bindings = <>
    DefaultPort = 2134
    OnCommandGet = FServerCommandGet
    Left = 312
    Top = 64
  end
end
