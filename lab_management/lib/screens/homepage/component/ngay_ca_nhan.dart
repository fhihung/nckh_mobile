// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constant.dart';

class NgayCaNhan extends StatelessWidget {
  String text;
  String numberText;
  String detailText;
  NgayCaNhan({
    Key? key,
    required this.text,
    required this.numberText,
    required this.detailText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          barrierColor: Colors.white.withOpacity(0.3),
          enableDrag: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              child: Container(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: k3,
                                    borderRadius: BorderRadius.circular(8)),
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  'assets/icons/down.png',
                                  color: kSecondaryColor,
                                  scale: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          text,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(detailText,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Text(
              numberText,
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: k3),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
/*Container(
                width: double.infinity,
                height: size.height * 0.6,
                color: kPrimaryColor,
                child: 
              ); */