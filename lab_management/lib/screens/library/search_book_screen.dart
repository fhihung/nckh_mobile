// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../controller/library/book/book_services.dart';
import '../../models/books.dart';

enum SearchOption {
  Title,
  Author,
  Publisher,
}

class SearchBookScreen extends StatefulWidget {
  @override
  _SearchBookScreenState createState() => _SearchBookScreenState();
}

class _SearchBookScreenState extends State<SearchBookScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Book> _searchResults = [];
  SearchOption _selectedOption = SearchOption.Title;

  Future<void> _searchBooks(String query) async {
    try {
      List<Book> results = [];
      if (_selectedOption == SearchOption.Title) {
        results = await BookService.searchByTitle(query);
      } else if (_selectedOption == SearchOption.Author) {
        results = await BookService.searchByAuthor(query);
      } else if (_selectedOption == SearchOption.Publisher) {
        results = await BookService.searchByPublisher(query);
      }
      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      // Handle search error
    }
  }

  Future<void> _loadBooks() async {
    try {
      final books = await BookService.fetchAll();
      setState(() {
        _searchResults = books;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _deleteBook(int id) async {
    try {
      await BookService.delete(id);
      await _loadBooks();
    } catch (e) {
      // Handle delete error
    }
  }

  Future<void> _updateBook(Book book) async {
    try {
      await BookService.updateBook(book);
      await _loadBooks();
    } catch (e) {
      // Handle update error
    }
  }

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _showEditDialog(Book book) async {
    TextEditingController _titleController =
        TextEditingController(text: book.title);
    TextEditingController _authorController =
        TextEditingController(text: book.author);
    TextEditingController _publisherController =
        TextEditingController(text: book.publisher);
    TextEditingController _publicationYearController =
        TextEditingController(text: book.publicationYear.toString());
    TextEditingController _quantityController =
        TextEditingController(text: book.quantity.toString());
    TextEditingController _descriptionController =
        TextEditingController(text: book.description);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        bool isReadOnly = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Information',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  RoundedTextField(
                      hintText: 'Title',
                      readOnly: !isReadOnly,
                      controller: _titleController),
                  RoundedTextField(
                    readOnly: !isReadOnly,
                    controller: _authorController,
                    hintText: 'Author',
                  ),
                  RoundedTextField(
                    readOnly: !isReadOnly,
                    controller: _publisherController,
                    hintText: 'Publisher',
                  ),
                  RoundedTextField(
                    readOnly: !isReadOnly,
                    controller: _publicationYearController,
                    hintText: 'PublicationYear',
                  ),
                  RoundedTextField(
                    readOnly: !isReadOnly,
                    controller: _quantityController,
                    hintText: 'Quantity',
                  ),
                  RoundedTextField(
                    readOnly: !isReadOnly,
                    controller: _descriptionController,
                    hintText: 'Description',
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () async {
                    final updatedBook = Book(
                      id: book.id,
                      title: _titleController.text,
                      author: _authorController.text,
                      publisher: _publisherController.text,
                      publicationYear:
                          int.parse(_publicationYearController.text),
                      quantity: int.parse(_quantityController.text),
                      description: _descriptionController.text,
                    );
                    await _updateBook(updatedBook);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách tài liệu',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      hintText: _selectedOption == SearchOption.Title
                          ? 'Title'
                          : _selectedOption == SearchOption.Author
                              ? 'Author'
                              : 'Publisher',
                      prefixIcon: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(Icons.search)),
                      prefixIconColor: Colors.black,
                      // fillColor: Colors.black,
                    ),
                    onChanged: (value) {
                      final query = _searchController.text;
                      _searchBooks(query);
                    },
                  ),
                ),
                PopupMenuButton<SearchOption>(
                  icon: Icon(Icons.filter_list_sharp),
                  initialValue: _selectedOption,
                  onSelected: (SearchOption option) {
                    setState(() {
                      _selectedOption = option;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SearchOption>>[
                    PopupMenuItem<SearchOption>(
                      value: SearchOption.Title,
                      child: Text('Title'),
                    ),
                    PopupMenuItem<SearchOption>(
                      value: SearchOption.Author,
                      child: Text('Author'),
                    ),
                    PopupMenuItem<SearchOption>(
                      value: SearchOption.Publisher,
                      child: Text('Publisher'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    'ID',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Title',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Author',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'More',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      )),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  final book = _searchResults[index];
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
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300),
                              )),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    book.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${book.author}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${book.quantity}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    PopupMenuButton(
                                      icon: Icon(Icons.more_horiz),
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem<int>(
                                              value: 0,
                                              child: Text("More Information")),
                                        ];
                                      },
                                      onSelected: (value) {
                                        if (value == 0) {
                                          _showEditDialog(book);
                                        }
                                      },

                                      // _showEditDialog(book);
                                    ),
                                    // IconButton(
                                    //   icon: Icon(Icons.delete),
                                    //   onPressed: () {

                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  String hintText;
  bool? readOnly;
  TextEditingController controller;
  RoundedTextField({
    Key? key,
    required this.hintText,
    this.readOnly,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        maxLines: null,
        readOnly: readOnly!,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          hintText: hintText,
          prefixIconColor: Colors.black,
          // fillColor: Colors.black,
        ),
      ),
    );
  }
}
