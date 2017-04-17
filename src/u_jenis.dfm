object F_jenis: TF_jenis
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Jenis Barang'
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
  object sLabel1: TsLabel
    Left = 8
    Top = 16
    Width = 41
    Height = 13
    Caption = 'No Jenis'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
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
  object B_new: TsButton
    Left = 128
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Baru'
    TabOrder = 2
    OnClick = B_newClick
    SkinData.SkinSection = 'BUTTON_BIG'
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
    MaxLength = 2
    ParentFont = False
    TabOrder = 3
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
    TabOrder = 0
  end
  object B_save: TsButton
    Left = 216
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 1
    OnClick = B_saveClick
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
