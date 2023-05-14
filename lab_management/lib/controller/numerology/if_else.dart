import 'package:flutter/material.dart';
import '../../screens/login/component/body.dart';
import 'data_number.dart';
//  final String LoginBodyState.data!.duongDoi;
//   final String LoginBodyState.data!.linhHon;
//   final String LoginBodyState.data!.namCaNhan;
//   final String LoginBodyState.data!.ngayCaNhan;
//   final String LoginBodyState.data!.ngaySinh;
//   final String LoginBodyState.data!.thaiDo;
//   final String LoginBodyState.data!.thangCaNhan;
//   final String LoginBodyState.data!.tinhCach;
//   final String LoginBodyState.data!.vanMenh;

String duong_doi_text = "";
String van_menh_text = "";
String linh_hon_text = "";
String tinh_cach_text = "";
String ngay_sinh_text = "";
String ngay_ca_nhan_text = "";
String thang_ca_nhan_text = "";
String nam_ca_nhan_text = "";

class DDNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LoginBodyState.data!.duongDoi == '1') {
      duong_doi_text = duong_doi_1;
    } else if (LoginBodyState.data!.duongDoi == '2') {
      duong_doi_text = duong_doi_2;
    } else if (LoginBodyState.data!.duongDoi == '3') {
      duong_doi_text = duong_doi_3;
    } else if (LoginBodyState.data!.duongDoi == '4') {
      duong_doi_text = duong_doi_4;
    } else if (LoginBodyState.data!.duongDoi == '5') {
      duong_doi_text = duong_doi_5;
    } else if (LoginBodyState.data!.duongDoi == '6') {
      duong_doi_text = duong_doi_6;
    } else if (LoginBodyState.data!.duongDoi == '7') {
      duong_doi_text = duong_doi_7;
    } else if (LoginBodyState.data!.duongDoi == '8') {
      duong_doi_text = duong_doi_8;
    } else if (LoginBodyState.data!.duongDoi == '9') {
      duong_doi_text = duong_doi_9;
    } else if (LoginBodyState.data!.duongDoi == '11') {
      duong_doi_text = duong_doi_11;
    } else if (LoginBodyState.data!.duongDoi == '22') {
      duong_doi_text = duong_doi_22;
    } else if (LoginBodyState.data!.duongDoi == '33') {
      duong_doi_text = duong_doi_33;
    }
    return Text(
      duong_doi_text,
      // style: TextStyle(),
    );
  }
}

class VMNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LoginBodyState.data!.vanMenh == '1') {
      van_menh_text = van_menh_1;
    } else if (LoginBodyState.data!.vanMenh == '2') {
      van_menh_text = van_menh_2;
    } else if (LoginBodyState.data!.vanMenh == '3') {
      van_menh_text = van_menh_3;
    } else if (LoginBodyState.data!.vanMenh == '4') {
      van_menh_text = van_menh_4;
    } else if (LoginBodyState.data!.vanMenh == '5') {
      van_menh_text = van_menh_5;
    } else if (LoginBodyState.data!.vanMenh == '6') {
      van_menh_text = van_menh_6;
    } else if (LoginBodyState.data!.vanMenh == '7') {
      van_menh_text = van_menh_7;
    } else if (LoginBodyState.data!.vanMenh == '8') {
      van_menh_text = van_menh_8;
    } else if (LoginBodyState.data!.vanMenh == '9') {
      van_menh_text = van_menh_9;
    } else if (LoginBodyState.data!.vanMenh == '11') {
      van_menh_text = van_menh_11;
    } else if (LoginBodyState.data!.vanMenh == '22') {
      van_menh_text = van_menh_22;
    } else if (LoginBodyState.data!.vanMenh == '33') {
      van_menh_text = van_menh_33;
    }
    return Text(
      van_menh_text,
      // style: TextStyle(),
    );
  }
}

class LHNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LoginBodyState.data!.linhHon == '1') {
      linh_hon_text = linh_hon_1;
    } else if (LoginBodyState.data!.linhHon == '2') {
      linh_hon_text = linh_hon_2;
    } else if (LoginBodyState.data!.linhHon == '3') {
      linh_hon_text = linh_hon_3;
    } else if (LoginBodyState.data!.linhHon == '4') {
      linh_hon_text = linh_hon_4;
    } else if (LoginBodyState.data!.linhHon == '5') {
      linh_hon_text = linh_hon_5;
    } else if (LoginBodyState.data!.linhHon == '6') {
      linh_hon_text = linh_hon_6;
    } else if (LoginBodyState.data!.linhHon == '7') {
      linh_hon_text = linh_hon_7;
    } else if (LoginBodyState.data!.linhHon == '8') {
      linh_hon_text = linh_hon_8;
    } else if (LoginBodyState.data!.linhHon == '9') {
      linh_hon_text = linh_hon_9;
    } else if (LoginBodyState.data!.linhHon == '11') {
      linh_hon_text = linh_hon_11;
    } else if (LoginBodyState.data!.linhHon == '22') {
      linh_hon_text = linh_hon_22;
    } else if (LoginBodyState.data!.linhHon == '33') {
      linh_hon_text = linh_hon_33;
    }
    return Text(
      linh_hon_text,
      // style: TextStyle(),
    );
  }
}

class TCNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LoginBodyState.data!.tinhCach == '1') {
      tinh_cach_text = tinh_cach_1;
    } else if (LoginBodyState.data!.tinhCach == '2') {
      tinh_cach_text = tinh_cach_2;
    } else if (LoginBodyState.data!.tinhCach == '3') {
      tinh_cach_text = tinh_cach_3;
    } else if (LoginBodyState.data!.tinhCach == '4') {
      tinh_cach_text = tinh_cach_4;
    } else if (LoginBodyState.data!.tinhCach == '5') {
      tinh_cach_text = tinh_cach_5;
    } else if (LoginBodyState.data!.tinhCach == '6') {
      tinh_cach_text = tinh_cach_6;
    } else if (LoginBodyState.data!.tinhCach == '7') {
      tinh_cach_text = tinh_cach_7;
    } else if (LoginBodyState.data!.tinhCach == '8') {
      tinh_cach_text = tinh_cach_8;
    } else if (LoginBodyState.data!.tinhCach == '9') {
      tinh_cach_text = tinh_cach_9;
    } else if (LoginBodyState.data!.tinhCach == '11') {
      tinh_cach_text = tinh_cach_11;
    } else if (LoginBodyState.data!.tinhCach == '22') {
      tinh_cach_text = tinh_cach_22;
    } else if (LoginBodyState.data!.tinhCach == '33') {
      tinh_cach_text = tinh_cach_33;
    }
    return Text(
      tinh_cach_text,
      // style: TextStyle(),
    );
  }
}

class NSNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LoginBodyState.data!.ngaySinh == '1') {
      ngay_sinh_text = ngay_sinh_1;
    } else if (LoginBodyState.data!.ngaySinh == '2') {
      ngay_sinh_text = ngay_sinh_2;
    } else if (LoginBodyState.data!.ngaySinh == '3') {
      ngay_sinh_text = ngay_sinh_3;
    } else if (LoginBodyState.data!.ngaySinh == '4') {
      ngay_sinh_text = ngay_sinh_4;
    } else if (LoginBodyState.data!.ngaySinh == '5') {
      ngay_sinh_text = ngay_sinh_5;
    } else if (LoginBodyState.data!.ngaySinh == '6') {
      ngay_sinh_text = ngay_sinh_6;
    } else if (LoginBodyState.data!.ngaySinh == '7') {
      ngay_sinh_text = ngay_sinh_7;
    } else if (LoginBodyState.data!.ngaySinh == '8') {
      ngay_sinh_text = ngay_sinh_8;
    } else if (LoginBodyState.data!.ngaySinh == '9') {
      ngay_sinh_text = ngay_sinh_9;
    } else if (LoginBodyState.data!.ngaySinh == '11') {
      ngay_sinh_text = ngay_sinh_11;
    } else if (LoginBodyState.data!.ngaySinh == '22') {
      ngay_sinh_text = ngay_sinh_22;
    }
    return Text(
      ngay_sinh_text,
      // style: TextStyle(),
    );
  }
}

String NCNNumber() {
  if (LoginBodyState.data!.ngayCaNhan == '1') {
    ngay_ca_nhan_text = ngay_ca_nhan_1;
  } else if (LoginBodyState.data!.ngayCaNhan == '2') {
    ngay_ca_nhan_text = ngay_ca_nhan_2;
  } else if (LoginBodyState.data!.ngayCaNhan == '3') {
    ngay_ca_nhan_text = ngay_ca_nhan_3;
  } else if (LoginBodyState.data!.ngayCaNhan == '4') {
    ngay_ca_nhan_text = ngay_ca_nhan_4;
  } else if (LoginBodyState.data!.ngayCaNhan == '5') {
    ngay_ca_nhan_text = ngay_ca_nhan_5;
  } else if (LoginBodyState.data!.ngayCaNhan == '6') {
    ngay_ca_nhan_text = ngay_ca_nhan_6;
  } else if (LoginBodyState.data!.ngayCaNhan == '7') {
    ngay_ca_nhan_text = ngay_ca_nhan_7;
  } else if (LoginBodyState.data!.ngayCaNhan == '8') {
    ngay_ca_nhan_text = ngay_ca_nhan_8;
  } else if (LoginBodyState.data!.ngayCaNhan == '9') {
    ngay_ca_nhan_text = ngay_ca_nhan_9;
  }
  return ngay_ca_nhan_text;
}

class TCNNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LoginBodyState.data!.thangCaNhan == '1') {
      thang_ca_nhan_text = thang_ca_nhan_1;
    } else if (LoginBodyState.data!.thangCaNhan == '2') {
      thang_ca_nhan_text = thang_ca_nhan_2;
    } else if (LoginBodyState.data!.thangCaNhan == '3') {
      thang_ca_nhan_text = thang_ca_nhan_3;
    } else if (LoginBodyState.data!.thangCaNhan == '4') {
      thang_ca_nhan_text = thang_ca_nhan_4;
    } else if (LoginBodyState.data!.thangCaNhan == '5') {
      thang_ca_nhan_text = thang_ca_nhan_5;
    } else if (LoginBodyState.data!.thangCaNhan == '6') {
      thang_ca_nhan_text = thang_ca_nhan_6;
    } else if (LoginBodyState.data!.thangCaNhan == '7') {
      thang_ca_nhan_text = thang_ca_nhan_7;
    } else if (LoginBodyState.data!.thangCaNhan == '8') {
      thang_ca_nhan_text = thang_ca_nhan_8;
    } else if (LoginBodyState.data!.thangCaNhan == '9') {
      thang_ca_nhan_text = thang_ca_nhan_9;
    }
    return Text(
      thang_ca_nhan_text,
      // style: TextStyle(),
    );
  }
}

class NamCNNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LoginBodyState.data!.namCaNhan == '1') {
      nam_ca_nhan_text = nam_ca_nhan_1;
    } else if (LoginBodyState.data!.namCaNhan == '2') {
      nam_ca_nhan_text = nam_ca_nhan_2;
    } else if (LoginBodyState.data!.namCaNhan == '3') {
      nam_ca_nhan_text = nam_ca_nhan_3;
    } else if (LoginBodyState.data!.namCaNhan == '4') {
      nam_ca_nhan_text = nam_ca_nhan_4;
    } else if (LoginBodyState.data!.namCaNhan == '5') {
      nam_ca_nhan_text = nam_ca_nhan_5;
    } else if (LoginBodyState.data!.namCaNhan == '6') {
      nam_ca_nhan_text = nam_ca_nhan_6;
    } else if (LoginBodyState.data!.namCaNhan == '7') {
      nam_ca_nhan_text = nam_ca_nhan_7;
    } else if (LoginBodyState.data!.namCaNhan == '8') {
      nam_ca_nhan_text = nam_ca_nhan_8;
    } else if (LoginBodyState.data!.namCaNhan == '9') {
      nam_ca_nhan_text = nam_ca_nhan_9;
    } else if (LoginBodyState.data!.namCaNhan == '11') {
      nam_ca_nhan_text = nam_ca_nhan_11;
    } else if (LoginBodyState.data!.namCaNhan == '22') {
      nam_ca_nhan_text = nam_ca_nhan_22;
    }
    return Text(
      nam_ca_nhan_text,
      // style: TextStyle(),
    );
  }
}
