unit u_company;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sEdit, sLabel, sButton, sMemo, UFungsi, sSkinProvider, StdCtrls;

type
  TF_comp = class(TForm)
    sLabel1: TsLabel;
    ed_kode: TEdit;
    sLabel2: TsLabel;
    ed_desk: TEdit;
    sLabel3: TsLabel;
    ed_telp: TEdit;
    sLabel4: TsLabel;
    ed_mail: TEdit;
    sLabel5: TsLabel;
    mm_alamat: TsMemo;
    B_save: TsButton;
    sSkinProvider1: TsSkinProvider;
    ed_npwp: TEdit;
    sLabel6: TsLabel;
    procedure baru;
    procedure ubah;
    procedure B_saveClick(Sender: TObject);
  private
    comp_baru: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_comp: TF_comp;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure TF_comp.baru;
begin
  ed_kode.clear;
  ed_desk.Clear;
  mm_alamat.Clear;
  ed_telp.Clear;
  ed_mail.Clear;
  ed_npwp.Clear;

  comp_baru := true;
end;

procedure TF_comp.ubah;
begin
  ed_kode.Enabled := false;
  ed_kode.Text := F_cari.q_cari.FieldByName('kd_perusahaan').AsString;
  fungsi.SQLExec(dm.Q_temp, 'select * from tb_company where kd_perusahaan="' +
    ed_kode.Text + '"', true);
  ed_desk.text := dm.Q_temp.FieldByName('n_perusahaan').AsString;
  mm_alamat.Text := dm.Q_temp.FieldByName('alamat').AsString;
  ed_telp.text := dm.Q_temp.FieldByName('telp').AsString;
  ed_mail.text := dm.Q_temp.FieldByName('e_mail').AsString;
  ed_npwp.text := dm.Q_temp.FieldByName('NPWP').AsString;

  comp_baru := false;
end;

procedure TF_comp.B_saveClick(Sender: TObject);
var
  LSql : string;
begin
  if comp_baru then
    LSql := Format('INSERT INTO tb_company(kd_perusahaan, n_perusahaan, alamat, telp, ' +
      'e_mail, npwp) VALUES ("%s", "%s", "%s", "%s", "%s", "%s")', [ed_kode.Text,
      ed_desk.Text, mm_alamat.Text, ed_telp.Text, ed_mail.Text, ed_npwp.Text]) else
    LSql := Format('UPDATE tb_company SET alamat = "%s", telp = "%s", e_mail = "%s", ' +
      'npwp = "%s" WHERE kd_perusahaan = "%s"', [mm_alamat.Text, ed_telp.Text,
      ed_mail.Text, ed_npwp.Text, ed_kode.Text]);

  dm.db_conn.StartTransaction;
  try
    fungsi.SQLExec(dm.Q_Exe, LSql, false);
    dm.db_conn.Commit;
    showmessage('penyimpanan data sukses....');
  except
    on e: exception do
    begin
      dm.db_conn.Rollback;
      showmessage('penyimpanan data gagal '#10#13'' + e.Message);
    end;
  end;
  F_cari.q_cari.Close;
  F_cari.q_cari.Open;

  F_cari.clm1.caption := 'Kode';
  F_cari.clm2.caption := 'Nama Perusahaan';
  close;
end;

end.


