object F_ubahPassword: TF_ubahPassword
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ubah Password'
  ClientHeight = 147
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object l_1: TsLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Password Lama'
  end
  object l_2: TsLabel
    Left = 8
    Top = 48
    Width = 71
    Height = 13
    Caption = 'Password Baru'
  end
  object l_3: TsLabel
    Left = 8
    Top = 80
    Width = 97
    Height = 13
    Caption = 'Konfirmasi Password'
  end
  object ed_pass2: TsEdit
    Left = 128
    Top = 76
    Width = 241
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object ed_pass: TsEdit
    Left = 128
    Top = 49
    Width = 241
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object edpassLama: TsEdit
    Left = 128
    Top = 9
    Width = 241
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    SkinData.SkinSection = 'EDIT'
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
  end
  object btnpass: TsButton
    Left = 248
    Top = 112
    Width = 120
    Height = 25
    Caption = 'Ubah Password'
    TabOrder = 3
    OnClick = btnpassClick
    SkinData.SkinSection = 'BUTTON_BIG'
  end
end
