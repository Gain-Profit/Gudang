unit U_kirim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,U_fungsi, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCurrencyEdit, StdCtrls, sButton, sTooledit,
  sEdit, Buttons, sSpeedButton, ExtCtrls, sBevel, sLabel, Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sCurrencyEdit, sMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, sPanel, sSkinProvider, sDialogs,uTerbilang;

type
  TF_kirim = class(TForm)
    od: TsOpenDialog;
    sd: TsSaveDialog;
    sSkinProvider1: TsSkinProvider;
    sPanel1: TsPanel;
    panel1: TsPanel;
    Mm_nama: TsMemo;
    ce_harga: TsCurrencyEdit;
    panel2: TsPanel;
    sLabel5: TsLabel;
    sBevel1: TsBevel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sb_pelanggan: TsSpeedButton;
    sb_cari: TsSpeedButton;
    l_toko: TsLabel;
    ed_no_faktur: TsEdit;
    ed_tgl: TsDateEdit;
    ed_toko: TsEdit;
    ed_code: TsEdit;
    panel3: TsPanel;
    ed_nilai_faktur: TsCurrencyEdit;
    panel4: TsPanel;
    sSpeedButton18: TsSpeedButton;
    sPanel2: TsPanel;
    b_simpan_file: TsButton;
    b_load: TsButton;
    b_auto: TsButton;
    spnl1: TsPanel;
    b_simpan: TsButton;
    b_new: TsButton;
    b_print: TsButton;
    Grid: TcxGrid;
    TableView: TcxGridTableView;
    ableViewColumn1: TcxGridColumn;
    ableViewColumn2: TcxGridColumn;
    t_view_Qty: TcxGridColumn;
    t_view_harga: TcxGridColumn;
    t_view_total: TcxGridColumn;
    Level: TcxGridLevel;
    l_pasangan: TsLabel;
    l_S1: TsLabel;
    ed_jatuh_tempo: TsCurrencyEdit;
    l_S2: TsLabel;
    l_1: TsLabel;
    l_2: TsLabel;
    l_3: TsLabel;
    l_4: TsLabel;
    t_view_barcode: TcxGridColumn;
    procedure WMMDIACTIVATE(var msg : TWMMDIACTIVATE) ; message WM_MDIACTIVATE;
    procedure bersih;
    procedure tampil_data;
    procedure CreateRows;
    procedure b_simpan_fileClick(Sender: TObject);
    procedure b_loadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_newClick(Sender: TObject);
    procedure sb_pelangganClick(Sender: TObject);
    procedure ed_tokoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sb_cariClick(Sender: TObject);
    procedure b_simpanClick(Sender: TObject);
    procedure b_printClick(Sender: TObject);
    procedure ed_no_fakturChange(Sender: TObject);
    procedure sSpeedButton18Click(Sender: TObject);
    procedure b_autoClick(Sender: TObject);
    procedure TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure simpan_file(nama_file: string);
    procedure ed_no_fakturKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_kirim: TF_kirim;
  fungsi:tfungsi;
  sub_sub_total:integer;

implementation

uses u_dm, u_utama, u_cari;

{$R *.dfm}

procedure TF_kirim.WMMDIACTIVATE(var msg: TWMMDIACTIVATE);
var
  active: TWinControl;
  idx: Integer;
begin
  active := FindControl(msg.ActiveWnd) ;
if not(metu_kabeh) then
begin
  if Assigned(active) then
  begin
    idx := f_utama.tc_child.Tabs.IndexOfObject(TObject(msg.ActiveWnd));
    f_utama.tc_child.Tag := -1;
    f_utama.tc_child.TabIndex := idx;
    f_utama.tc_child.Tag := 0;
  end;
end;
end;

procedure TF_kirim.simpan_file(nama_file: string);
var
  F: TextFile;
  x: Integer;
begin
  AssignFile(F, nama_file);
  Rewrite(F);
  Writeln(F, ed_toko.text);
  Writeln(F, l_toko.caption);
  Writeln(F, ed_no_faktur.text);
  Writeln(F, ed_tgl.text);
  Writeln(F, tableview.DataController.RecordCount);
  for x:=0 to tableview.DataController.RecordCount-1 do
    begin
      Writeln(F, TableView.DataController.GetValue(x,0));
      Writeln(F, TableView.DataController.GetValue(x,1));
      Writeln(F, TableView.DataController.GetValue(x,2));
      Writeln(F, TableView.DataController.GetValue(x,3));
      Writeln(F, TableView.DataController.GetValue(x,4));
      Writeln(F, TableView.DataController.GetValue(x,5));
    end;
  CloseFile(F);
  fungsi.amankan(nama_file,nama_file,321);
end;



procedure TF_kirim.b_simpan_fileClick(Sender: TObject);
begin
sd.FileName:= ed_no_faktur.Text + sd.DefaultExt;
sd.InitialDir:= dm.WPath;
if sd.Execute then
  begin
    simpan_file(sd.FileName);
  end;
end;

procedure TF_kirim.b_loadClick(Sender: TObject);
var
  F: TextFile;
  Tmp, x: Integer;
  TmpStr: string;
begin
if od.Execute then
begin
  try
  od.InitialDir:= dm.WPath;
  fungsi.amankan(od.FileName,od.FileName,321);
  AssignFile(F, od.FileName);
  Reset(F);
  Readln(F, TmpStr);
  ed_toko.text:= TmpStr;
  Readln(F, TmpStr);
  l_toko.caption:= TmpStr;
  Readln(F, TmpStr);
  ed_no_faktur.text:=TmpStr;
  Readln(F, TmpStr);
  ed_tgl.text:=TmpStr;
  Readln(F, Tmp);
  tableview.DataController.RecordCount:=Tmp;
  for x:=0 to tableview.DataController.RecordCount-1 do
    begin
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 0, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 1, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 2, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 3, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 4, TmpStr);
      Readln(F, TmpStr);
      TableView.DataController.SetValue(x, 5, TmpStr);
    end;
  CloseFile(F);
  
  tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount);
  mm_nama.Text:= tableView.DataController.GetValue(tableview.DataController.RecordCount-1,1);
  ce_harga.Text:= tableView.DataController.GetValue(tableview.DataController.RecordCount-1,3);

  fungsi.amankan(od.FileName,od.FileName,321);
  except
  ShowMessage('proses load data gagal...');
  end;
end;

end;

procedure TF_kirim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
f_utama.MDIChildDestroyed(Self.Handle);
Action:=cafree;
F_kirim:=nil;
end;

procedure TF_kirim.bersih;
begin
l_toko.Caption:= '';
ed_tgl.Date:= waktu_sekarang;
mm_nama.Clear;
ce_harga.Clear;
ed_toko.Clear;                                 
ed_no_faktur.Clear;
tableview.DataController.RecordCount:=0;
ed_nilai_faktur.Clear;
end;

procedure TF_kirim.tampil_data;
Var h : Integer;
    x_hpp:real;
begin
ed_toko.Text:= dm.Q_list_kirim.fieldbyname('kd_tk_kirim').AsString;
l_toko.Caption:= dm.Q_list_kirim.fieldbyname('n_pelanggan').AsString;
ed_no_faktur.Text:= dm.Q_list_kirim.fieldbyname('kd_kirim').AsString;
ed_tgl.Text:= formatdatetime('dd/MM/yyyy',dm.Q_list_kirim.fieldbyname('tgl_kirim').AsDateTime);

fungsi.SQLExec(dm.Q_temp,'select * from tb_kirim_rinci where kd_perusahaan="'+
dm.Q_list_kirim.fieldbyname('kd_perusahaan').AsString+'" and kd_kirim="'+
dm.Q_list_kirim.fieldbyname('kd_kirim').AsString+'"',true);

if dm.Q_temp.RecordCount<>0 then
begin
  tableview.DataController.RecordCount:= dm.Q_temp.RecordCount;
  for h:= 0 to dm.Q_temp.RecordCount-1 do
  begin
  TableView.DataController.SetValue(h, 0, dm.Q_temp.FieldByName('kd_barang').AsString);
  TableView.DataController.SetValue(h, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(h, 2, dm.Q_temp.FieldByName('qty_kirim').AsString);
  TableView.DataController.SetValue(h, 4, dm.Q_temp.fieldbyname('harga_pokok').AsString);
  TableView.DataController.SetValue(h, 5, dm.Q_temp.fieldbyname('barcode').AsString);
  x_hpp:= dm.Q_temp.fieldbyname('harga_pokok').AsFloat/dm.Q_temp.FieldByName('qty_kirim').AsFloat;
  TableView.DataController.SetValue(h, 3, x_hpp);
  dm.Q_temp.Next;
  end;
  tableview.DataController.ChangeFocusedRowIndex(tableview.DataController.RecordCount+1);
end;
end;

procedure TF_kirim.CreateRows;
var baris_baru: integer;
f: integer;
begin
if tableview.DataController.RecordCount<>0 then
begin
  for f:=0 to tableview.DataController.RecordCount-1 do
  begin
    if (pos(TableView.DataController.GetValue(f,0),dm.Q_temp.fieldbyname('kd_barang').AsString)>0)then
    begin
      tableview.DataController.ChangeFocusedRecordIndex(f);
      TableView.DataController.SetValue(f, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
      TableView.DataController.SetValue(f, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
      TableView.DataController.SetValue(f, 2, TableView.DataController.GetValue(f,2) + 1);
      TableView.DataController.SetValue(f, 4, TableView.DataController.GetValue(f,2) * TableView.DataController.GetValue(f,3));
      TableView.DataController.SetValue(f, 5, dm.Q_temp.fieldbyname('barcode3').AsString);
      exit;
    end;
  end;
end;

  baris_baru:= tableview.DataController.RecordCount+1;
  tableview.DataController.RecordCount:=baris_baru;
  TableView.DataController.SetValue(baris_baru-1, 0, dm.Q_temp.fieldbyname('kd_barang').AsString);
  TableView.DataController.SetValue(baris_baru-1, 1, dm.Q_temp.fieldbyname('n_barang').AsString);
  TableView.DataController.SetValue(baris_baru-1, 2, 1);
  TableView.DataController.SetValue(baris_baru-1, 3, dm.Q_temp.fieldbyname('hpp_aktif').AsString);
  TableView.DataController.SetValue(baris_baru-1, 4, dm.Q_temp.fieldbyname('hpp_aktif').AsString);
  TableView.DataController.SetValue(baris_baru-1, 5, dm.Q_temp.fieldbyname('barcode3').AsString);
  tableview.DataController.ChangeFocusedRowIndex(baris_baru);
  mm_nama.Text:= tableView.DataController.GetValue(baris_baru-1,1);
  ce_harga.Text:= tableView.DataController.GetValue(baris_baru-1,3);
end;

procedure TF_kirim.ed_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  KodeCari: string;
begin
if key=vk_return then
begin
  PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
  if ed_code.Text='' then exit;

  if l_pasangan.Visible = True then
  KodeCari := l_pasangan.Caption + ed_code.Text  else
  KodeCari := ed_code.Text;

  fungsi.sqlExec(dm.Q_temp,'SELECT kd_barang,n_barang,barcode3, '+
  'hpp_aktif,kd_sat3 FROM tb_barang WHERE ((kd_barang = "'+
  KodeCari+'" OR barcode3 = "'+KodeCari+'" OR barcode2 = "'+
  KodeCari+'" OR barcode1 = "'+KodeCari+'") AND kd_perusahaan="'+f_utama.sb.Panels[3].Text+'")', true);
  if dm.Q_temp.RecordCount<>0 then
   begin
     fungsi.SQLExec(dm.Q_Exe,'select kd_barang from tb_barang_harga where kd_perusahaan="'+
     f_utama.sb.Panels[3].Text+'" and kd_barang="'+dm.Q_temp.fieldbyname('kd_barang').AsString+'"',True);
     if dm.Q_Exe.RecordCount=0 then
     begin
       ShowMessage('harga barang belum di set... tidak bisa mengirim barang ini...');
       Grid.SetFocus;
       ed_code.SetFocus;
       Exit;
     end else createrows;
   end else
   begin
   showmessage('data tidak dapat ditemukan dalam daftar barang...');
   Grid.SetFocus;
   ed_code.SetFocus;
   Exit;
   end;
ed_code.Clear
end;

if (key= vk_f2) and (sb_cari.Enabled= True) then sb_cariClick(Sender);

if key= vk_up then
begin
  if tableview.DataController.FocusedRecordIndex >=1 then
     tableview.DataController.FocusedRecordIndex:= tableview.DataController.FocusedRecordIndex-1;
key:=VK_NONAME;

end;
if key= vk_down then
tableview.DataController.FocusedRowIndex:= tableview.DataController.FocusedRowIndex+1;
end;

procedure Tf_kirim.TableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if tableview.DataController.RecordCount=0 then
begin
mm_nama.Clear;
ce_harga.Clear;
exit;
end;

try
mm_nama.Text:= AfocusedRecord.Values[1];
ce_harga.Value:= StrToIntDef(AfocusedRecord.Values[3],0);
except
end;
end;

procedure TF_kirim.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_f2 then ed_code.SetFocus;
if key=vk_f3 then grid.SetFocus;
if key=vk_f4 then sb_pelangganClick(Sender);
if key=vk_f5 then b_autoClick(Sender);
if Key=vk_f6 then l_pasangan.Visible:= not(l_pasangan.Visible);

if Key=vk_f7 then
  begin
  IF ed_code.Text <> '' THEN
  begin
  l_pasangan.Caption:= ed_code.Text;
  ed_code.Clear;
  end else
  l_pasangan.Caption:='pasangan';
end;

if (Shift=[ssctrl]) and (Key= vk_delete) then
if (MessageDlg('Yakinkah, Anda akan menghapus data ini???', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
TableView.DataController.DeleteFocused;
end;

procedure TF_kirim.b_newClick(Sender: TObject);
begin
bersih;
end;

procedure TF_kirim.sb_pelangganClick(Sender: TObject);
var sebelum:string;
begin
sebelum:= ed_toko.Text;

ed_toko.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_pelanggan,n_pelanggan from '+
            'tb_pelanggan where kd_pelanggan IN (SELECT kd_perusahaan from tb_company) and kd_perusahaan="'+
            f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'Kode';
    tblCap[1]:= 'Nama Pelanggan';
    CariT := 11;
    tampil_button(False,True);
    if ShowModal = mrOk then
    begin
        ed_toko.Text:=TblVal[0];
        l_toko.Caption:= tblval[1];
    end;
  finally
  close;
  end;
if CompareStr(ed_toko.Text,sebelum)<>0  then
ed_no_faktur.Clear;

end;

procedure TF_kirim.ed_tokoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_return) and (sb_pelanggan.Enabled= True) then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
sb_pelangganClick(Sender);
end;
end;

procedure TF_kirim.sb_cariClick(Sender: TObject);
begin
  ed_code.SetFocus;
  application.CreateForm(tf_cari, f_cari);
  with F_cari do
  try
    _SQLi:= 'select kd_barang, n_barang from tb_barang where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"';
    tblcap[0]:= 'PID';
    tblCap[1]:= 'Deskripsi Barang';
    tampil_button(False,True);
    if ShowModal = mrOk then
    begin
        ed_code.Text:=TblVal[0];
    end;
  finally
  close;
  end;
end;

procedure TF_kirim.b_simpanClick(Sender: TObject);
var x: integer;
isi_sql,kd_faktur:string;
begin
  kd_faktur:= ed_no_faktur.Text;

if (ed_toko.Text=f_utama.sb.Panels[3].Text) then
begin
showmessage('data tidak dapat disimpan karena toko pegirim dan penerima sama...');
exit;
end;

if (ed_toko.Text='') or (ed_no_faktur.Text='') then
begin
showmessage('Data Toko dan no faktur harus di isi terlebih dahulu...');
exit;
end;

if (ed_no_faktur.Color=clblue) then
begin
showmessage('no faktur ini sudah ada dalam database....');
exit;
end;

if tableview.DataController.RecordCount=0 then
begin
showmessage('Data barang masih kosong...');
exit;
end;

  for x:=0 to tableview.DataController.RecordCount-1 do
  begin
  isi_sql:=isi_sql +'("'+f_utama.sb.Panels[3].Text+'","'+ed_no_faktur.Text
  +'","'+formatdatetime('yyyy-MM-dd',ed_tgl.Date)+'","'+TableView.DataController.GetDisplayText(x,0)+'","'+
  TableView.DataController.GetDisplayText(x,1)+'","'+floattostr(TableView.DataController.GetValue(x,2))+'","'+
  floattostr(TableView.DataController.GetValue(x,4))+'","'+TableView.DataController.GetDisplayText(x,5)+'",date(now())),';
  end;
  delete(isi_sql,length(isi_sql),1);

dm.My_Conn.StartTransaction;
try
fungsi.SQLExec(dm.Q_exe,'insert into tb_kirim_global(kd_perusahaan,kd_kirim,tgl_kirim,'+
'kd_tk_kirim,nilai_faktur,pengguna,jatuh_tempo,simpan_pada) values ("'+f_utama.sb.Panels[3].Text+'","'+ed_no_faktur.Text
+'","'+formatdatetime('yyyy-MM-dd',ed_tgl.Date)+'","'+ed_toko.Text+'","'+
ed_nilai_faktur.Text+'","'+f_utama.Sb.Panels[0].Text+'","'+ed_jatuh_tempo.Text+'",now())',false);

  fungsi.SQLExec(dm.Q_exe,'insert into tb_kirim_rinci(kd_perusahaan,kd_kirim,tgl_kirim,'+
  'kd_barang,n_barang,qty_kirim,harga_pokok,barcode,tgl_simpan) values  '+isi_sql, false);

fungsi.SQLExec(dm.Q_exe,'INSERT tb_piutang (kd_perusahaan,faktur,tanggal,pelanggan, '+
'piutang_awal,`user`,jatuh_tempo,`update`)VALUES("'+f_utama.sb.Panels[3].Text+'","'+
ed_no_faktur.Text+'","'+formatdatetime('yyyy-MM-dd',ed_tgl.Date)+'","'+ed_toko.Text+'","'+
ed_nilai_faktur.Text+'","'+f_utama.Sb.Panels[0].Text+'","'+ed_jatuh_tempo.Text+'",DATE(NOW()))',False);

dm.My_Conn.Commit;

showmessage('penyimpanan data berhasil...');

sd.FileName:= ed_no_faktur.Text + sd.DefaultExt;
sd.InitialDir:= dm.WPath;
if sd.Execute then
  begin
    simpan_file(sd.FileName);
  end;

ed_no_faktur.Clear;
ed_no_faktur.Text:= kd_faktur;
b_print.SetFocus;

except
on E:exception do
begin
dm.My_Conn.Rollback;
messagedlg('proses penyimpanan gagal,ulangi lagi!!! '#10#13'' + e.Message, mterror, [mbOk],0);
end;
end;
end;

procedure TF_kirim.b_printClick(Sender: TObject);
begin
fungsi.SQLExec(dm.Q_laporan,'select * from vw_cetak_kirim where kd_perusahaan="'+f_utama.sb.Panels[3].Text+'" and kd_kirim="'+ed_no_faktur.Text+'"',true);
dm.laporan.LoadFromFile(dm.WPath + 'laporan\gp_kirim_rinci.fr3');
dm.FRMemo(dm.laporan, 'Memo9').Text := MyTerbilang(dm.Q_laporan.fieldbyname('nilai_faktur').AsFloat)+'Rupiah';
dm.laporan.ShowReport;
end;

procedure TF_kirim.ed_no_fakturChange(Sender: TObject);
var urip : Boolean;
begin
fungsi.SQLExec(dm.Q_temp,'select kd_kirim from tb_kirim_global where kd_kirim="'+ed_no_faktur.Text+'" and kd_perusahaan="'+f_utama.sb.Panels[3].Text+'"',true);
if not(dm.Q_temp.Eof) then
begin
ed_no_faktur.Color:=clblue;
Caption:= 'Kirim ('+ed_no_faktur.Text+')';
f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] :=Caption;
urip:= True;
end else
begin
ed_no_faktur.Color:=clwhite;
Caption:= 'Kirim (New)';
f_utama.tc_child.Tabs.Strings[f_utama.tc_child.TabIndex] :=Caption;
urip:= False;
end;

sb_pelanggan.Enabled:=not(urip);
sb_cari.Enabled:=not(urip);
b_simpan.Enabled:=not(urip);
b_auto.Enabled:= not(urip);
b_print.Enabled:= urip;

ed_tgl.ReadOnly:=urip;
ed_code.ReadOnly:=urip;
end;

procedure TF_kirim.sSpeedButton18Click(Sender: TObject);
begin
close;
end;

procedure TF_kirim.b_autoClick(Sender: TObject);
var w:Integer;
x, pid,pid_temp,sekarang:string;
begin
  if ed_toko.Text='' then
  begin
    ShowMessage('untuk auto kode, data Toko harus diisi terlebih dahulu');
    Exit;
  end;
  
  sekarang:= formatdatetime('yyyyMMdd', waktu_sekarang);

  fungsi.SQLExec(dm.Q_temp,'select count(kd_kirim) as jumlah from tb_kirim_global where kd_tk_kirim="'+
  ed_toko.text+'" and kd_perusahaan = "'+f_utama.sb.Panels[3].Text
  +'" and date(simpan_pada)=date(now())',true);

  w:= dm.Q_temp.fieldbyname('jumlah').AsInteger + 1;

  if w<10  then x:= '0'+ inttostr(w) else
  if w<100 then x:= '' + inttostr(w);

  ed_no_faktur.Text:= 'KR-'+ed_toko.text+'-'+sekarang+x;
end;

procedure TF_kirim.TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
if (Atext <>'') then
ed_nilai_faktur.Value:= aVALUE
else ed_nilai_faktur.Clear;
end;

procedure TF_kirim.FormShow(Sender: TObject);
begin
  if (f_utama.sb.Panels[8].Text='PUSAT') and (f_utama.HakAkses('gdTrKirim')) then
  begin
  b_new.Enabled:=True;
  ed_no_faktur.Enabled:= True;
  end else
  begin
  b_new.Enabled:=false;
  ed_no_faktur.Enabled:= False;
  end;
end;

procedure TF_kirim.FormCreate(Sender: TObject);
begin
  f_utama.MDIChildCreated(self.Handle);
  ed_code.Width:= panel2.Width - 268;
end;

procedure TF_kirim.ed_no_fakturKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key =vk_return) and (b_auto.Enabled = True) then
begin
PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE );
b_autoClick(self);
end;
end;

procedure TF_kirim.ed_codeKeyPress(Sender: TObject; var Key: Char);
var harga,qty:real;
kode: string;
b:Integer;
begin
{if not ((key>='0')and(key<='9')or(key=#8) or(key=#43)) then
begin
key:=#0;
Exit;
end;
}
if TableView.DataController.RecordCount=0 then Exit;

harga  := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,3);
Qty    := TableView.DataController.GetValue(tableview.DataController.FocusedRecordIndex,2);

kode:=Ed_Code.Text;

b:= TableView.DataController.GetFocusedRecordIndex;

 if key=#43 then // tanda + (repeat)
 begin
  delete(kode,pos('+',kode),1);
  ed_code.Clear;
  key:=#0;

  if (StrToIntDef(kode,0) = 0) or (Length(kode) =0) then Exit;

  TableView.DataController.SetValue(b, 2, kode); //Qty
  TableView.DataController.SetValue(b, 4, harga * StrToFloatdef(kode,0)); //total harga
 end;

 if Key=#47 then //tanda (/)  ubah harga
 begin
    delete(kode,pos('/',kode),1);
    ed_code.Clear;
    key:=#0;

    if (Length(kode) =0) then Exit;

  TableView.DataController.SetValue(b, 3, kode); //harga baru
  TableView.DataController.SetValue(b, 4, Qty * StrToFloatdef(kode,0)); //total harga
 end;

end;

procedure TF_kirim.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if (ed_toko.Text=f_utama.sb.Panels[3].Text) then
begin
CanClose:=True;
Exit;
end;

if (ed_no_faktur.Color <> clblue) and (tableview.DataController.RecordCount>=1) then
begin
case MessageBox(0, 'Data Belum disimpan, '+#13+#10+'apakah anda akan menyimpan data ini???',
'Central of Profit', MB_ICONWARNING or MB_YESNOCANCEL) of
  idYes:
  begin
    b_simpanClick(Self);
    CanClose:= False;
  end;
  idNo:CanClose:= True;
  IDCANCEL:
  begin
    ed_code.SetFocus;
    CanClose:= False;
  end;  
end;

end;  

end;

end.
