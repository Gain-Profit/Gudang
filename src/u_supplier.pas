unit u_supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sButton, sLabel, sEdit, UFungsi, Buttons, sSkinProvider;

type
  Tf_supplier = class(TForm)
    sLabel2: TsLabel;
    ed_nama: TsEdit;
    sLabel1: TsLabel;
    ed_alamat: TsEdit;
    sLabel3: TsLabel;
    ed_kota: TsEdit;
    sLabel4: TsLabel;
    ed_telp: TsEdit;
    sLabel5: TsLabel;
    ed_kontak: TsEdit;
    sLabel6: TsLabel;
    ed_web: TsEdit;
    sLabel7: TsLabel;
    ed_mail: TsEdit;
    sLabel8: TsLabel;
    B_new: TsButton;
    B_save: TsButton;
    ed_kode: TsEdit;
    sSkinProvider1: TsSkinProvider;
    b_auto: TsButton;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
    procedure b_autoClick(Sender: TObject);
  private
    supp_baru: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_supplier: Tf_supplier;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure Tf_supplier.baru;
begin
  ed_kode.Clear;
  ed_kode.ReadOnly := false;
  ed_alamat.Clear;
  ed_kontak.Clear;
  ed_kota.Clear;
  ed_mail.Clear;
  ed_nama.Clear;
  ed_telp.Clear;
  ed_web.Clear;

  supp_baru := true;
end;

procedure Tf_supplier.ubah;
begin
  ed_kode.ReadOnly := true;
  b_auto.Enabled := False;

  ed_kode.Text := f_cari.q_cari.FieldByName('kode').AsString;
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_supp where kode="' + ed_kode.Text
    + '" and kd_perusahaan="' + dm.kd_perusahaan + '"', true);
  ed_alamat.Text := dm.Q_temp.FieldByName('alamat').AsString;
  ed_kontak.Text := dm.Q_temp.FieldByName('kontak').AsString;
  ed_kota.Text := dm.Q_temp.FieldByName('kota').AsString;
  ed_mail.Text := dm.Q_temp.FieldByName('email').AsString;
  ed_nama.Text := dm.Q_temp.FieldByName('n_supp').AsString;
  ed_telp.Text := dm.Q_temp.FieldByName('telp').AsString;
  ed_web.Text := dm.Q_temp.FieldByName('website').AsString;

  supp_baru := false;
end;

procedure Tf_supplier.B_newClick(Sender: TObject);
begin
  baru;
end;

procedure Tf_supplier.B_saveClick(Sender: TObject);
begin
  if ed_kode.Text = '' then
  begin
    ShowMessage('Kode Supplier Tidak Boleh Kosong');
    b_auto.SetFocus;
    Exit;
  end;

  dm.db_conn.StartTransaction;
  try
    if supp_baru = true then
      fungsi.SQLExec(dm.Q_Exe,
        'insert into tb_supp (kode,alamat,kontak,kota,email,n_supp,telp,website,kd_perusahaan,`update`)values ("' +
        ed_kode.Text + '","' + ed_alamat.Text + '","' + ed_kontak.Text + '","' +
        ed_kota.Text + '","' + ed_mail.Text + '","' + ed_nama.Text + '","' +
        ed_telp.Text + '","' + ed_web.Text + '","' + dm.kd_perusahaan + '","' +
        formatdatetime('yyyy-MM-dd', date()) + '")', false)
    else
      fungsi.SQLExec(dm.Q_Exe, 'update tb_supp set `update`="' + formatdatetime('yyyy-MM-dd',
        date()) + '",alamat="' + ed_alamat.Text + '",kontak="' + ed_kontak.Text
        + '",kota="' + ed_kota.Text + '",email="' + ed_mail.Text + '",n_supp="'
        + ed_nama.Text + '",telp="' + ed_telp.Text + '",website="' + ed_web.Text
        + '" where kode="' + ed_kode.Text + '" and kd_perusahaan = "' + dm.kd_perusahaan
        + '"', false);

    dm.db_conn.Commit;
    showmessage('penyimpanan data sukses....');
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
  f_cari.q_cari.Close;
  f_cari.q_cari.Open;

  f_cari.clm1.caption := 'kode';
  f_cari.clm2.caption := 'Nama Supplier';
  close;

end;

procedure Tf_supplier.b_autoClick(Sender: TObject);
begin
  fungsi.SQLExec(dm.Q_temp, Format('SELECT CONCAT("SU-",LPAD(IFNULL(max(right(kode,4)),0)+1, 4, "0")) '
    + 'as new_id FROM tb_supp WHERE kd_perusahaan= "%s"  AND kode like "SU-%%"',
    [dm.kd_perusahaan]), true);

  ed_kode.Text := dm.Q_temp.fieldbyname('new_id').AsString;
end;

end.


