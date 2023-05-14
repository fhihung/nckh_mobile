class Numerology {
  final String duongDoi;
  final String linhHon;
  final String namCaNhan;
  final String ngayCaNhan;
  final String ngaySinh;
  final String thaiDo;
  final String thangCaNhan;
  final String tinhCach;
  final String vanMenh;

  Numerology({
    required this.duongDoi,
    required this.linhHon,
    required this.namCaNhan,
    required this.ngayCaNhan,
    required this.ngaySinh,
    required this.thaiDo,
    required this.thangCaNhan,
    required this.tinhCach,
    required this.vanMenh,
  });

  factory Numerology.fromJson(Map<String, dynamic> json) {
    return Numerology(
      duongDoi: json['duong_doi'],
      linhHon: json['linh_hon'],
      namCaNhan: json['nam_ca_nhan'],
      ngayCaNhan: json['ngay_ca_nhan'],
      ngaySinh: json['ngay_sinh'],
      thaiDo: json['thai_do'],
      thangCaNhan: json['thang_ca_nhan'],
      tinhCach: json['tinh_cach'],
      vanMenh: json['van_menh'],
    );
  }
}
