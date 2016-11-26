unit u_comp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sLabel, sButton, sMemo,UFungsi, sSkinProvider;

type
  Tf_comp = class(TForm)
    sLabel1: TsLabel;
    ed_kode: TsEdit;
    sLabel2: TsLabel;
    ed_desk: TsEdit;
    sLabel3: TsLabel;
    ed_telp: TsEdit;
    sLabel4: TsLabel;
    ed_mail: TsEdit;
    sLabel5: TsLabel;
    mm_alamat: TsMemo;
    B_new: TsButton;
    B_save: TsButton;
    sSkinProvider1: TsSkinProvider;
    procedure baru;
    procedure ubah;
    procedure B_newClick(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
  private
    comp_baru:boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_comp: Tf_comp;

implementation

uses u_dm, u_cari;

{$R *.dfm}

procedure tf_comp.baru;
begin
ed_kode.clear;
ed_desk.Clear;
mm_alamat.Clear;
ed_telp.Clear;
ed_mail.Clear;

comp_baru:= true;
end;

procedure tf_comp.ubah;
begin
ed_kode.Enabled:= false;
ed_kode.Text:= f_cari.q_cari.FieldByName('kd_perusahaan').AsString;
fungsi.SQLExec(dm.Q_temp,'select * from tb_company where kd_perusahaan="'+ed_kode.Text+'"',true);
ed_desk.text:= dm.Q_temp.FieldByName('n_perusahaan').AsString;
mm_alamat.Text:= dm.Q_temp.FieldByName('alamat').AsString;;
ed_telp.text:=dm.Q_temp.FieldByName('telp').AsString;;
ed_mail.text:= dm.Q_temp.FieldByName('e_mail').AsString;;

comp_baru:= false;
end;

procedure Tf_comp.B_newClick(Sender: TObject);
begin
baru;
end;

procedure Tf_comp.B_saveClick(Sender: TObject);
begin
dm.db_conn.StartTransaction;
try
if comp_baru=true then
fungsi.SQLExec(dm.Q_Exe,'insert into tb_company (kd_perusahaan, n_perusahaan,alamat,telp,e_mail)values ("'+ed_kode.Text
+'","'+ed_desk.Text+'","'+mm_alamat.Text+'","'+ed_telp.Text+'","'+ed_mail.Text+'")',false) else
fungsi.SQLExec(dm.Q_Exe,'update tb_company set n_perusahaan="'+ed_desk.Text+'", alamat="'+
mm_alamat.Text+'", telp="'+ed_telp.Text+'", e_mail="'+ed_mail.Text+'" where kd_perusahaan="'+ed_kode.Text+'"',false);

dm.db_conn.Commit;
showmessage('penyimpanan data sukses....');
except on e:exception do begin
  dm.db_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;
f_cari.q_cari.Close;
f_cari.q_cari.Open;

f_cari.clm1.caption:='Kode';
f_cari.clm2.caption:='Nama Perusahaan';
close;
end;

end.
