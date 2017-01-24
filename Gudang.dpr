program Gudang;

uses
  Forms,
  u_edit_harga in 'u_edit_harga.pas' {F_Edit_Harga},
  u_dm in 'u_dm.pas' {dm: TDataModule},
  u_ubah in 'u_ubah.pas' {F_ubah_harga},
  UFungsi in '..\tools\pascal\UFungsi.pas',
  u_barang in 'u_barang.pas' {F_barang},
  u_barang_det in 'u_barang_det.pas' {F_barang_det},
  u_jenis in 'u_jenis.pas' {f_jenis},
  u_satuan in 'u_satuan.pas' {F_satuan},
  u_golongan in 'u_golongan.pas' {f_golongan},
  u_cari in 'u_cari.pas' {f_cari},
  u_merk in 'u_merk.pas' {f_merk},
  u_kategori in 'u_kategori.pas' {F_Kategori},
  u_comp in 'u_comp.pas' {f_comp},
  u_supplier in 'u_supplier.pas' {f_supplier},
  u_utama in 'u_utama.pas' {f_utama},
  u_barang_supp in 'u_barang_supp.pas' {f_barang_supp},
  u_planogram in 'u_planogram.pas' {f_planogram},
  u_pelanggan in 'u_pelanggan.pas' {f_cust},
  u_emp in 'u_emp.pas' {f_emp},
  u_list_purchase in 'u_list_purchase.pas' {f_List_purchase},
  u_list_receipt in 'u_list_receipt.pas' {f_list_receipt},
  u_list_return in 'u_list_return.pas' {f_list_return},
  U_Login in 'U_Login.pas' {F_Login},
  u_RO in 'u_RO.pas' {f_RO},
  u_purchase in 'u_purchase.pas' {f_purchase},
  u_return in 'u_return.pas' {f_return},
  U_kirim in 'U_kirim.pas' {F_kirim},
  u_list_kirim in 'u_list_kirim.pas' {F_list_kirim},
  u_kirim_data in 'u_kirim_data.pas' {F_kirim_data},
  u_list_sales in 'u_list_sales.pas' {f_list_sales},
  u_list_SO in 'u_list_SO.pas' {f_list_SO},
  u_return_kirim in 'u_return_kirim.pas' {f_return_kirim},
  u_list_return_kirim in 'u_list_return_kirim.pas' {f_list_return_kirim},
  U_toko in 'U_toko.pas' {F_toko},
  u_hari in 'u_hari.pas' {f_hari},
  u_barang_property in 'u_barang_property.pas' {F_barang_property},
  u_ubahPassword in 'u_ubahPassword.pas' {F_ubahPassword},
  u_list_return_jual in 'u_list_return_jual.pas' {f_list_return_jual},
  u_barcode in 'u_barcode.pas' {f_Barcode},
  u_realCard in 'u_realCard.pas' {f_realCard},
  U_Group_Barang in 'U_Group_Barang.pas' {FGroupBarang},
  u_Group_Barang_Detail in 'u_Group_Barang_Detail.pas' {FGroupBarangDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Central of Profit';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tf_utama, f_utama);
  Application.Run;
end.
