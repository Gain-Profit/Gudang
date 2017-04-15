unit u_jenis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sLabel, sEdit, sButton, UFungsi, sSkinProvider, StdCtrls;

type
  TF_jenis = class(TForm)
    B_new: TsButton;
    ed_kode: TsEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    ed_desc: TsEdit;
    B_save: TsButton;
    sSkinProvider1: TsSkinProvider;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
  private
    jenis_baru: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_jenis: TF_jenis;

implementation

uses
  u_dm, u_cari;

{$R *.dfm}

procedure TF_jenis.baru;
begin
  ed_kode.Enabled := True;
  fungsi.SQLExec(dm.q_temp, 'select * from tb_jenis', true);

  if Length(IntToStr(dm.Q_temp.recordcount + 1)) <> 1 then
    ed_kode.Text := inttostr(dm.Q_temp.recordcount + 1)
  else
    ed_kode.Text := '0' + inttostr(dm.Q_temp.recordcount + 1);

  ed_desc.Clear;
  jenis_baru := true;
end;

procedure TF_jenis.ubah;
begin
  ed_kode.Enabled := False;
  ed_kode.Text := F_cari.q_cari.FieldByName('kd_jenis').AsString;
  ed_desc.text := F_cari.q_cari.FieldByName('n_jenis').AsString;
  jenis_baru := false;
end;

procedure TF_jenis.B_newClick(Sender: TObject);
begin
  baru;
end;

procedure TF_jenis.B_saveClick(Sender: TObject);
begin
  dm.db_conn.StartTransaction;
  try
    if jenis_baru = true then
      fungsi.SQLExec(dm.Q_Exe,
        'insert into tb_jenis (kd_jenis,n_jenis,`update`)values ("' + ed_kode.Text
        + '","' + ed_desc.Text + '","' + formatdatetime('yyyy-MM-dd', date()) +
        '")', false)
    else
      fungsi.SQLExec(dm.Q_Exe, 'update tb_jenis set n_jenis="' + ed_desc.Text +
        '",`update`="' + formatdatetime('yyyy-MM-dd', date()) +
        '" where kd_jenis="' + ed_kode.Text + '"', false);

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

  F_cari.clm1.Caption := 'No';
  F_cari.clm2.caption := 'Deskripsi';
  close;
end;

end.


