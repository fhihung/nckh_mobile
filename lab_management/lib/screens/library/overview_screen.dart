// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lab_management/screens/library/add_book_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../constant.dart';
import '../../controller/library/book/book_services.dart';

import '../../controller/library/borrower/borrower_service.dart';
import '../../widgets/box_get_total.dart';
import 'book_list_home.dart';
import 'book_list_screen.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Row(
              children: [
                GetTotalContainer(
                  icon: Icon(
                    Icons.people,
                  ),
                  text: 'Người mượn',
                  service: BorrowerService.fetchTotalBorrowerCount(),
                ),
                GetTotalContainer(
                  icon: Icon(Icons.book),
                  text: 'Số sách',
                  service: BookService.fetchTotalBookCount(),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 5, bottom: 10),
                              child: Text(
                                'Books List',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 5, bottom: 10),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: AddBookScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Add New Book',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            'ID',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          )),
                          Expanded(
                              child: Text(
                            'Tên',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          )),
                          Expanded(
                              child: Text(
                            'Tác giả',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          )),
                          Expanded(
                              child: Text(
                            'Số lượng',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ))
                        ],
                      ),
                    ),
                    Divider(),
                    Expanded(child: BookListWidget()),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
