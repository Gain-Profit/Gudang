program gudang;

uses
  Forms,
  UFungsi in '..\tools\pascal\UFungsi.pas',
  u_dm in 'u_dm.pas' {dm: TDataModule},
  u_cari in 'u_cari.pas' {f_cari},
  u_login in 'u_login.pas' {F_Login},
  u_utama in 'u_utama.pas' {f_utama},
  u_company in 'u_company.pas' {f_comp},
  u_pengguna in 'u_pengguna.pas' {f_emp},
  u_supplier in 'u_supplier.pas' {f_supplier},
  u_pelanggan in 'u_pelanggan.pas' {f_cust},
  u_jenis in 'u_jenis.pas' {f_jenis},
  u_golongan in 'u_golongan.pas' {f_golongan},
  u_kategori in 'u_kategori.pas' {F_Kategori},
  u_merk in 'u_merk.pas' {f_merk},
  u_satuan in 'u_satuan.pas' {F_satuan},
  u_barang in 'u_barang.pas' {F_barang},
  u_barang_detail in 'u_barang_detail.pas' {F_barang_det},
  u_barang_property in 'u_barang_property.pas' {F_barang_property},
  u_barang_supplier in 'u_barang_supplier.pas' {f_barang_supp},
  u_group_barang in 'u_group_barang.pas' {FGroupBarang},
  u_group_barang_detail in 'u_group_barang_detail.pas' {FGroupBarangDetail},
  u_planogram in 'u_planogram.pas' {f_planogram},
  u_harga in 'u_harga.pas' {F_ubah_harga},
  u_edit_harga in 'u_edit_harga.pas' {F_Edit_Harga},
  u_purchase in 'u_purchase.pas' {f_purchase},
  u_receipt in 'u_receipt.pas' {f_RO},
  u_return in 'u_return.pas' {f_return},
  u_kirim in 'u_kirim.pas' {F_kirim},
  u_return_kirim in 'u_return_kirim.pas' {f_return_kirim},
  u_list_purchase in 'u_list_purchase.pas' {f_List_purchase},
  u_list_receipt in 'u_list_receipt.pas' {f_list_receipt},
  u_list_return in 'u_list_return.pas' {f_list_return},
  u_list_kirim in 'u_list_kirim.pas' {F_list_kirim},
  u_list_return_kirim in 'u_list_return_kirim.pas' {f_list_return_kirim},
  u_list_jual in 'u_list_jual.pas' {f_list_sales},
  u_list_return_jual in 'u_list_return_jual.pas' {f_list_return_jual},
  u_list_stock_opname in 'u_list_stock_opname.pas' {f_list_SO},
  u_kirim_data in 'u_kirim_data.pas' {F_kirim_data},
  u_laporan in 'u_laporan.pas' {F_toko},
  u_ganti_hari in 'u_ganti_hari.pas' {f_hari},
  u_ubah_password in 'u_ubah_password.pas' {F_ubahPassword},
  u_barcode in 'u_barcode.pas' {f_Barcode},
  u_real_card in 'u_real_card.pas' {f_realCard};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Central of Profit';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tf_utama, f_utama);
  Application.Run;
end.


