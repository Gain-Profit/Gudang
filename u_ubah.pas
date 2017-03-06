unit u_ubah;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinProvider, sEdit, sLabel, sCurrEdit, sCurrencyEdit, ComCtrls,
  sStatusBar, ExtCtrls, DBCtrls, UFungsi, Buttons, sBitBtn, sComboBox, sTooledit,
  cxControls, sGroupBox, StdCtrls, Mask, sMaskEdit, sCustomComboEdit;

type
  THarga = record
    HPP: Extended;
    Harga3: Extended;
    Harga2: Extended;
    Harga1: Extended;
    Awal: TDateTime;
    Ahir: TDateTime;
  end;

  TF_ubah_harga = class(TForm)
    sSkinProvider1: TsSkinProvider;
    Ed_Plu: TsEdit;
    Ed_deskripsi: TsEdit;
    ed_pokok: TsCurrencyEdit;
    ed_marginP: TsCurrencyEdit;
    ed_marginRp: TsCurrencyEdit;
    Ed_harga1: TsCurrencyEdit;
    ed_harga2: TsCurrencyEdit;
    ed_harga3: TsCurrencyEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    ed_qty1: TsCurrencyEdit;
    ed_qty2: TsCurrencyEdit;
    sCurrencyEdit3: TsCurrencyEdit;
    Ed_sat1: TsEdit;
    Ed_sat2: TsEdit;
    Ed_sat3: TsEdit;
    sb: TsStatusBar;
    btn_simpan: TsBitBtn;
    sBitBtn2: TsBitBtn;
    Ed_macam: TsEdit;
    cb_macam: TsComboBox;
    sLabel7: TsLabel;
    b_update: TsBitBtn;
    g_1: TsGroupBox;
    de_awal: TsDateEdit;
    l_1: TsLabel;
    de_ahir: TsDateEdit;
    l_2: TsLabel;
    ed_discP: TsCurrencyEdit;
    l_3: TsLabel;
    l_4: TsLabel;
    ed_discRp: TsCurrencyEdit;
    g_2: TsGroupBox;
    ed_harga3New: TsCurrencyEdit;
    ed_harga2New: TsCurrencyEdit;
    l_5: TsLabel;
    l_6: TsLabel;
    l_7: TsLabel;
    ed_harga1New: TsCurrencyEdit;
    ed_marginPNew: TsCurrencyEdit;
    ed_marginRpNew: TsCurrencyEdit;
    l_8: TsLabel;
    l_9: TsLabel;
    procedure FormShow(Sender: TObject);
    procedure ubah;
    procedure btn_simpanClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cb_macamChange(Sender: TObject);
    procedure ed_harga3Exit(Sender: TObject);
    procedure ed_pokokExit(Sender: TObject);
    procedure cb_periodikClick(Sender: TObject);
    procedure ed_harga2Exit(Sender: TObject);
    procedure ed_marginRpExit(Sender: TObject);
    procedure b_updateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure harga_baru;
    procedure ed_discRpExit(Sender: TObject);
    procedure ed_discPExit(Sender: TObject);
    procedure Ed_harga1Exit(Sender: TObject);
    procedure de_ahirExit(Sender: TObject);
  private
    procedure ubahHarga(perusahaan: string);
    procedure UbahJenis(Jenis: Byte);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_ubah_harga: TF_ubah_harga;
  HargaAsli, HargaBaru: THarga;

implementation

uses
  u_dm, u_utama;

{$R *.dfm}

procedure TF_ubah_harga.harga_baru;
begin
//merubah harga baru setelah diskon
  if ed_harga3.Value <> 0 then
    ed_discP.Value := (ed_discRp.Value / ed_harga3.Value) * 100;

  ed_harga3New.Value := ed_harga3.Value - ed_discRp.Value;

  ed_marginRpNew.Value := ed_harga3New.Value - ed_pokok.Value;
  if ed_pokok.Value <> 0 then
    ed_marginPNew.Value := (ed_marginrpNew.Value / ed_pokok.Value) * 100;
  ed_harga2New.Value := ed_harga2.Value - (ed_discRp.Value * ed_qty2.Value);
  ed_harga1New.Value := ed_harga1.Value - (ed_discRp.Value * ed_qty2.Value *
    ed_qty1.Value);
end;

procedure TF_ubah_harga.ubah;
var
  sat1, sat2, sat3: string;
begin
  cb_macam.ItemIndex := cb_macam.Items.IndexOf(dm.Q_harga.FieldByName('kd_macam_harga').AsString);

  if cb_macam.ItemIndex = -1 then
    cb_macam.ItemIndex := 0;

  ed_plu.Text := dm.Q_harga.FieldByName('kd_barang').AsString;
  ed_DESKRIPSI.Text := dm.Q_harga.FieldByName('n_barang').AsString;

  ed_qty1.Text := dm.Q_harga.FieldByName('Qty1').AsString;
  ed_qty2.Text := dm.Q_harga.FieldByName('Qty2').AsString;
  sat1 := dm.Q_harga.FieldByName('kd_sat1').AsString;
  fungsi.SQLExec(dm.Q_Exe, 'select * from tb_satuan where kd_satuan="' + sat1 +
    '"', true);
  ed_sat1.Text := dm.Q_Exe.FieldByName('n_singkat').AsString;
  sat2 := dm.Q_harga.FieldByName('kd_sat2').AsString;
  fungsi.SQLExec(dm.Q_Exe, 'select * from tb_satuan where kd_satuan="' + sat2 +
    '"', true);
  ed_sat2.Text := dm.Q_Exe.FieldByName('n_singkat').AsString;
  sat3 := dm.Q_harga.FieldByName('kd_sat3').AsString;
  fungsi.SQLExec(dm.Q_Exe, 'select * from tb_satuan where kd_satuan="' + sat3 +
    '"', true);
  ed_sat3.Text := dm.Q_Exe.FieldByName('n_singkat').AsString;

  UbahJenis(cb_macam.ItemIndex);
end;

procedure TF_ubah_harga.FormShow(Sender: TObject);
begin

  if f_utama.sb.Panels[8].Text = 'PUSAT' then
  begin
    ed_pokok.Enabled := True;
    b_update.Visible := True;
  end
  else
  begin
    ed_pokok.Enabled := False;
    b_update.Visible := False;
  end;
end;

procedure TF_ubah_harga.btn_simpanClick(Sender: TObject);
var
  i: integer;
begin
  HargaBaru.HPP := ed_pokok.Value;
  HargaBaru.Harga3 := ed_harga3New.Value;
  HargaBaru.Harga2 := ed_harga2New.Value;
  HargaBaru.Harga1 := ed_harga1New.Value;
  HargaBaru.Awal := de_awal.Date;
  HargaBaru.Ahir := de_ahir.Date;

  if (HargaAsli.HPP = HargaBaru.HPP) and (HargaAsli.Harga3 = HargaBaru.Harga3)
    and (HargaAsli.Harga2 = HargaBaru.Harga2) and (HargaAsli.Harga1 = HargaBaru.Harga1)
    and (HargaAsli.Awal = HargaBaru.Awal) and (HargaAsli.Ahir = HargaBaru.Ahir) then
  begin
    Exit;
  end;

  dm.db_conn.StartTransaction;
  try
    ubahHarga(dm.kd_perusahaan);
    if F_utama.sb.Panels[8].Text = 'PUSAT' then
    begin
      for i := 0 to cabang.Count - 1 do
      begin
        ubahHarga(cabang[i]);
      end;
    end;

    dm.db_conn.Commit;
    showmessage('proses ubah harga berhasil');

  except
    on E: exception do
    begin
      dm.db_conn.Rollback;
      messagedlg('proses ubah harga gagal '#10#13'' + e.Message, mterror, [mbOk], 0);
    end;
  end;
end;

procedure TF_ubah_harga.ubahHarga(perusahaan: string);
begin
  fungsi.SQLExec(dm.q_temp,
    'select COUNT(kd_barang) as jumlah from tb_barang_harga where kd_perusahaan="' +
    perusahaan + '" and kd_barang="' + ed_plu.Text + '" and kd_macam_harga="' +
    cb_macam.Text + '"', true);

  if dm.q_temp.FieldByName('jumlah').AsInteger = 0 then
  begin
    fungsi.SQLExec(dm.Q_Exe,
      'insert into tb_barang_harga(kd_perusahaan,kd_macam_harga,kd_barang,laba,laba_P,harga_jual1, ' +
      'harga_jual2,harga_jual3,kode_user,awal,ahir,`update`,diskon,diskonP) values ("' +
      perusahaan + '","' + cb_macam.Text + '","' + ed_plu.Text + '","' +
      ed_marginrp.Text + '","' + StringReplace(ed_marginP.Text, ',', '.', [rfReplaceAll])
      + '","' + ed_harga1.Text + '","' + ed_harga2.Text + '","' + ed_harga3.Text
      + '","' + dm.kd_pengguna + '","' + formatdatetime('yyyy-MM-dd', de_awal.date)
      + '","' + formatdatetime('yyyy-MM-dd', de_ahir.Date) +
      '",CURRENT_TIMESTAMP,"' + ed_discRp.Text + '","' + StringReplace(ed_discP.Text,
      ',', '.', [rfReplaceAll]) + '")', false)
  end
  else
  begin
    fungsi.SQLExec(dm.Q_Exe, 'update tb_barang_harga set laba="' + ed_marginRP.Text
      + '",laba_P="' + StringReplace(ed_marginP.Text, ',', '.', [rfReplaceAll])
      + '",harga_jual1="' + ed_harga1.Text + '",harga_jual2="' + ed_harga2.Text
      + '",harga_jual3="' + ed_harga3.Text + '",kode_user="' + dm.kd_pengguna +
      '",`update`=CURRENT_TIMESTAMP,awal="' + formatdatetime('yyyy-MM-dd',
      de_awal.Date) + '",ahir="' + formatdatetime('yyyy-MM-dd', de_ahir.Date) +
      '",diskon="' + ed_discRp.Text + '",diskonP="' + StringReplace(ed_discP.Text,
      ',', '.', [rfReplaceAll]) + '" where kd_barang="' + ed_plu.Text +
      '" and kd_macam_harga="' + cb_macam.Text + '" and kd_perusahaan="' +
      perusahaan + '"', false);
  end;

  if HargaAsli.HPP <> HargaBaru.HPP then
  begin
    fungsi.SQLExec(dm.Q_Exe, 'update tb_barang set hpp_aktif="' + ed_pokok.Text
      + '",`update` = "' + formatdatetime('yyyy-MM-dd', date()) +
      '" where kd_barang="' + ed_plu.Text + '" and kd_perusahaan="' + perusahaan
      + '"', false);
  end;
end;

procedure TF_ubah_harga.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    close;
end;

procedure TF_ubah_harga.cb_macamChange(Sender: TObject);
begin
  UbahJenis(cb_macam.ItemIndex);
end;

procedure TF_ubah_harga.ed_harga3Exit(Sender: TObject);
begin
  ed_marginRp.Value := ed_harga3.Value - ed_pokok.Value;
  if ed_pokok.Value <> 0 then
    ed_marginP.Value := (ed_marginrp.Value / ed_pokok.Value) * 100;
  ed_harga2.Value := ed_harga3.Value * ed_qty2.Value;
  ed_harga1.Value := ed_harga2.Value * ed_qty1.Value;
  harga_baru;
end;

procedure TF_ubah_harga.ed_pokokExit(Sender: TObject);
begin
  if ed_pokok.Value <> 0 then
    ed_marginrp.Value := (ed_marginp.Value / 100) * ed_pokok.Value;
  ed_harga3.Value := ed_pokok.Value + ed_marginrp.Value;
  ed_harga2.Value := ed_harga3.Value * ed_qty2.Value;
  ed_harga1.Value := ed_harga2.Value * ed_qty1.Value;

  harga_baru;
end;

procedure TF_ubah_harga.cb_periodikClick(Sender: TObject);
begin
  de_awal.Clear;
  de_ahir.Clear;
  de_awal.Enabled := not (de_awal.Enabled);
  de_ahir.Enabled := not (de_ahir.Enabled);
end;

procedure TF_ubah_harga.ed_harga2Exit(Sender: TObject);
begin
  ed_harga1.Value := ed_harga2.Value * ed_qty1.Value;
  harga_baru;
end;

procedure TF_ubah_harga.ed_marginRpExit(Sender: TObject);
begin
  if ed_pokok.Value <> 0 then
    ed_marginp.Value := (ed_marginrp.Value / ed_pokok.Value) * 100;
  ed_harga3.Value := ed_pokok.Value + ed_marginrp.Value;
  ed_harga2.Value := ed_harga3.Value * ed_qty2.Value;
  ed_harga1.Value := ed_harga2.Value * ed_qty1.Value;
  harga_baru;
end;

procedure TF_ubah_harga.b_updateClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp, 'select hpp_ahir from tb_barang where kd_barang="' +
    ed_plu.Text + '" and kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  ed_pokok.Text := dm.Q_temp.fieldbyname('hpp_ahir').Text;
  ed_pokokExit(Sender);
end;

procedure TF_ubah_harga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  F_ubah_harga := nil;
end;

procedure TF_ubah_harga.ed_discRpExit(Sender: TObject);
begin
  harga_baru;
end;

procedure TF_ubah_harga.ed_discPExit(Sender: TObject);
begin
  ed_discRp.Value := (ed_discP.Value / 100) * ed_harga3.Value;
  harga_baru;
end;

procedure TF_ubah_harga.Ed_harga1Exit(Sender: TObject);
begin
  harga_baru;
end;

procedure TF_ubah_harga.de_ahirExit(Sender: TObject);
begin
  if de_ahir.Date < de_awal.Date then
    de_ahir.Date := de_awal.Date;
end;

procedure TF_ubah_harga.UbahJenis(Jenis: Byte);
begin
  if Jenis = 1 then
    ed_macam.Text := 'HARGA GROSIR'
  else
    ed_macam.Text := 'HARGA ECERAN';

  fungsi.SQLExec(dm.Q_temp, 'select hpp_aktif from tb_barang where kd_barang="'
    + ed_plu.Text + '" and kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  ed_pokok.Text := dm.Q_temp.fieldbyname('hpp_aktif').AsString;

  fungsi.SQLExec(dm.Q_temp, 'select * from tb_barang_harga where kd_barang = "'
    + ed_plu.Text + '"and kd_macam_harga = "' + cb_macam.Text + '"', true);

  ed_marginP.Text := dm.Q_temp.FieldByName('laba_P').AsString;
  ed_marginRp.Text := dm.Q_temp.FieldByName('laba').AsString;
  ed_harga1.Text := dm.Q_temp.FieldByName('harga_jual1').AsString;
  ed_harga2.Text := dm.Q_temp.FieldByName('harga_jual2').AsString;
  ed_harga3.Text := dm.Q_temp.FieldByName('harga_jual3').AsString;

  de_awal.date := dm.Q_temp.FieldByName('awal').AsDateTime;
  de_ahir.date := dm.Q_temp.FieldByName('ahir').AsDateTime;
  ed_discRp.Text := dm.Q_temp.FieldByName('diskon').AsString;
  ed_discP.Text := dm.Q_temp.FieldByName('diskonP').AsString;

  sb.SimpleText := 'Updated at: ' + dm.Q_temp.FieldByName('update').AsString +
    ' by: ' + dm.Q_temp.FieldByName('kode_user').AsString;

  harga_baru;

  HargaAsli.HPP := ed_pokok.Value;
  HargaAsli.Harga3 := ed_harga3New.Value;
  HargaAsli.Harga2 := ed_harga2New.Value;
  HargaAsli.Harga1 := ed_harga1New.Value;
  HargaAsli.Awal := de_awal.Date;
  HargaAsli.Ahir := de_ahir.Date;
end;

end.


