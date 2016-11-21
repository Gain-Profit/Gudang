unit u_satuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sButton, sLabel, UFungsi, sSkinProvider;

type
  TF_satuan = class(TForm)
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    b_new: TsButton;
    b_save: TsButton;
    ed_nomer: TsEdit;
    ed_desk: TsEdit;
    ed_singkat: TsEdit;
    sSkinProvider1: TsSkinProvider;
    procedure baru;
    procedure ubah;
    procedure b_newClick(Sender: TObject);
    procedure b_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_satuan: TF_satuan;
  satuan_baru:boolean;
implementation

uses u_dm, u_cari;

{$R *.dfm}

procedure TF_satuan.baru;
begin
fungsi.SQLExec(dm.Q_temp,'select * from tb_satuan',true);
ed_nomer.Text:=inttostr(dm.Q_temp.RecordCount+1);
ed_desk.Clear;
ed_singkat.Clear;
satuan_baru:= true;
end;

procedure TF_satuan.ubah;
begin
ed_nomer.Text:= f_cari.q_cari.FieldByName('kd_satuan').AsString;
ed_desk.text:= f_cari.q_cari.FieldByName('n_satuan').AsString;
ed_singkat.text:= f_cari.q_cari.FieldByName('n_singkat').AsString;
satuan_baru:= false;
end;

procedure TF_satuan.b_newClick(Sender: TObject);
begin
baru;
end;

procedure TF_satuan.b_saveClick(Sender: TObject);
begin
dm.My_Conn.StartTransaction;
try
if satuan_baru=true then
fungsi.SQLExec(dm.Q_Exe,'insert into tb_satuan(kd_satuan,n_satuan,n_singkat,`update`)values("'+ed_nomer.Text
+'","'+ed_desk.Text+'","'+ed_singkat.Text+'","'+formatdatetime('yyyy-MM-dd', date())+'")',false) else
fungsi.SQLExec(dm.Q_Exe,'update tb_satuan set `update`="'+formatdatetime('yyyy-MM-dd', date())+'",n_satuan="'+ed_desk.Text+'",n_singkat="'+ed_singkat.Text
+'" where kd_satuan="'+ed_nomer.Text+'"',false);

dm.My_conn.Commit;
showmessage('penyimpanan data sukses...');
except on e:exception do begin
  dm.My_conn.Rollback;
  showmessage('penyimpanan data gagal '#10#13'' +e.Message);
  end;
end;
f_cari.q_cari.Close;
f_cari.q_cari.Open;

f_cari.clm1.caption:='No';
f_cari.clm2.caption:='Deskripsi';
f_cari.clm3.caption:='Singkatan';
close;
end;

end.
