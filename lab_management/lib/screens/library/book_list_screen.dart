import 'package:flutter/material.dart';
import 'package:lab_management/constant.dart';

import '../../controller/library/book/book_services.dart';
import '../../models/books.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final _quantityController = TextEditingController();
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    try {
      final List<Book> books = await BookService.fetchAll();
      setState(() {
        _books = books;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _addBook(Book book) async {
    try {
      await BookService.add(book);
      _loadBooks();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _updateBookQuantity(int id, int newQuantity) async {
    try {
      await BookService.updateQuantity(id, newQuantity);
      _loadBooks();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _deleteBook(int id) async {
    try {
      await BookService.delete(id);
      _loadBooks();
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('List of Books'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: BookService.fetchAll(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _books.length,
              itemBuilder: (BuildContext context, int index) {
                final book = _books[index];
                return ListTile(
                  // leading: Text('${book.quantity}'),
                  title: Text(
                    book.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    book.author ?? 'Unknown author',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: PopupMenuButton(
                      // add icon, by default "3 dot" icon
                      // icon: Icon(Icons.book),
                      itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("Thông tin chi tiết"),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text("Xóa"),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Text("Sửa số lượng"),
                      ),
                    ];
                  }, onSelected: (value) {
                    if (value == 0) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showInformDialog(book: book);
                        },
                      );
                    } else if (value == 1) {
                      _deleteBook(book.id!);
                    } else if (value == 2) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Add a new book'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _quantityController,
                                  decoration: InputDecoration(
                                    labelText: 'Quantity',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _loadBooks();
                                },
                              ),
                              ElevatedButton(
                                child: Text('Save'),
                                onPressed: () async {
                                  final quantity =
                                      int.tryParse(_quantityController.text) ??
                                          book.quantity;
                                  await _updateBookQuantity(
                                      book.id!, quantity!);
                                  await _loadBooks();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return showInformDialog(book: book);
                      },
                    );
                    // _updateBookQuantity(book.id!, 2);
                  },
                  onLongPress: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AddBookScreen()),
                    // );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _loadBooks();
        },
      ),
    );
  }
}

class showInformDialog extends StatelessWidget {
  const showInformDialog({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Tên tài liệu'),
            subtitle: Text(book.title),
          ),
          ListTile(
            title: Text('Tác giả'),
            subtitle: Text(book.author!),
          ),
          ListTile(
            title: Text('Nhà xuất bản'),
            subtitle: Text(book.publisher!),
          ),
          ListTile(
            title: Text('Năm phát hành'),
            subtitle: Text('${book.publicationYear}'),
          ),
          ListTile(
            title: Text('Số lượng'),
            subtitle: Text('${book.quantity}'),
          ),
          ListTile(
            title: Text('Mô tả'),
            subtitle: Text('${book.description}'),
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text('Exit'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

// class showQuantityDialog extends StatelessWidget {
//   final _quantityController = TextEditingController();
//   showQuantityDialog({
//     super.key,
//     required this.book,
//   });

//   final Book book;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add a new book'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: _quantityController,
//             decoration: InputDecoration(
//               labelText: 'Quantity',
//             ),
//             keyboardType: TextInputType.number,
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           child: Text('Cancel'),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         ElevatedButton(
//           child: Text('Save'),
//           onPressed: () {
//             final quantity =
//                 int.tryParse(_quantityController.text) ?? book.quantity;
//             updateBookQuantity(book.id, quantity);
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
// }
