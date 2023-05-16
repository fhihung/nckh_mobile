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
      duongDoi: json['duong_doi'] ?? 0,
      linhHon: json['linh_hon'] ?? 0,
      namCaNhan: json['nam_ca_nhan'] ?? 0,
      ngayCaNhan: json['ngay_ca_nhan'] ?? 0,
      ngaySinh: json['ngay_sinh'] ?? 0,
      thaiDo: json['thai_do'] ?? 0,
      thangCaNhan: json['thang_ca_nhan'] ?? 0,
      tinhCach: json['tinh_cach'] ?? 0,
      vanMenh: json['van_menh'] ?? 0,
    );
  }
}
