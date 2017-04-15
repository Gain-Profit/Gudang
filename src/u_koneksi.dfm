object f_koneksi: Tf_koneksi
  Left = 326
  Top = 132
  BorderStyle = bsDialog
  Caption = 'f_koneksi'
  ClientHeight = 220
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object l_1: TsLabel
    Left = 0
    Top = 40
    Width = 625
    Height = 38
    Alignment = taCenter
    AutoSize = False
    Caption = 'TIDAK DAPAT TERHUBUNG KE SERVER'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Comic Sans MS'
    Font.Style = []
  end
  object l_2: TsLabel
    Left = 0
    Top = 120
    Width = 625
    Height = 41
    Alignment = taCenter
    AutoSize = False
    Caption = 'Sedang mencoba menghubungkan kembali'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sknprvdr1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    AddedTitle.ShowMainCaption = False
    AllowAnimation = False
    AllowExtBorders = False
    AllowBlendOnMoving = False
    DrawNonClientArea = False
    SkinData.SkinSection = 'FORM'
    ResizeMode = rmBorder
    ShowAppIcon = False
    TitleButtons = <>
    UseGlobalColor = False
    Left = 8
    Top = 8
  end
  object timer2: TTimer
    Left = 16
    Top = 56
  end
end
