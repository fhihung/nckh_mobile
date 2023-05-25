import 'package:flutter/material.dart';

import '../../controller/library/book/book_services.dart';
import '../../models/books.dart';
// import 'package:separated_row/separated_row.dart';

class BookListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<Book>>(
      future: BookService.fetchAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final books = snapshot.data ?? [];
          final limitedBooks = books.take(10).toList(); // Lấy chỉ 10 cuốn sách

          return ListView.builder(
            itemCount: limitedBooks.length,
            itemBuilder: (context, index) {
              final book = limitedBooks[index];
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            '${book.id}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          )),
                          Expanded(
                              child: Text(
                            book.title,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          )),
                          Expanded(
                              child: Text(
                            '${book.author}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          )),
                          Expanded(
                              child: Text(
                            '${book.quantity}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.black),
                          ))
                        ],
                      ),
                    ),
                    Divider()
                  ],
                ),
              );
            },
          );
        }
      },
    ));
  }
}
