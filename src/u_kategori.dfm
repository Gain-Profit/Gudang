object F_Kategori: TF_Kategori
  Left = 0
  Top = 0
  Caption = 'Kateori Barang'
  ClientHeight = 116
  ClientWidth = 297
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
  object sLabel2: TsLabel
    Left = 8
    Top = 48
    Width = 43
    Height = 13
    Caption = 'Deskripsi'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel1: TsLabel
    Left = 8
    Top = 16
    Width = 22
    Height = 13
    Caption = 'TAG'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object ed_kode: TEdit
    Left = 56
    Top = 8
    Width = 233
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object ed_desc: TEdit
    Left = 56
    Top = 40
    Width = 233
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object B_save: TsButton
    Left = 216
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 2
    OnClick = B_saveClick
    SkinData.SkinSection = 'BUTTON_BIG'
  end
  object B_new: TsButton
    Left = 128
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Baru'
    TabOrder = 3
    OnClick = B_newClick
    SkinData.SkinSection = 'BUTTON_BIG'
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 8
  end
end
