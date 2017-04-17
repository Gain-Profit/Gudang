object F_Login: TF_Login
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 275
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sb: TStatusBar
    Left = 0
    Top = 254
    Width = 409
    Height = 21
    Cursor = crHandPoint
    Panels = <
      item
        Alignment = taCenter
        Width = 70
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    OnClick = sbClick
  end
  object sg_login: TGroupBox
    Left = 0
    Top = 0
    Width = 409
    Height = 254
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 76
      Height = 19
      Caption = 'Kode User'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 80
      Width = 82
      Height = 19
      Caption = 'Nama User'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 136
      Width = 70
      Height = 19
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
    end
    object l_1: TLabel
      Left = 8
      Top = 232
      Width = 216
      Height = 16
      Caption = 'Tekan F2 untuk merubah Perusahaan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object BtnClose: TBitBtn
      Left = 320
      Top = 192
      Width = 81
      Height = 33
      Cursor = crHandPoint
      Caption = '&Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ModalResult = 2
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
      OnClick = BtnCloseClick
    end
    object BtnLogin: TButton
      Left = 208
      Top = 192
      Width = 75
      Height = 33
      Caption = '&Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnLoginClick
    end
    object Ed_Kd_User: TEdit
      Left = 32
      Top = 48
      Width = 369
      Height = 27
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = Ed_Kd_UserChange
      OnKeyDown = Ed_Kd_UserKeyDown
    end
    object Ed_N_User: TEdit
      Left = 32
      Top = 104
      Width = 369
      Height = 27
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = Ed_N_UserEnter
    end
    object Ed_Password: TEdit
      Left = 32
      Top = 160
      Width = 369
      Height = 27
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      PasswordChar = '@'
      TabOrder = 2
      OnKeyDown = Ed_PasswordKeyDown
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 8
  end
end
