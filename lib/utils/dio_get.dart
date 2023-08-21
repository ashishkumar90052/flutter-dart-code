// import 'package:flutter/material.dart';

// class BookListScreen extends StatefulWidget {
//   const BookListScreen({super.key});

//   @override
//   BookListScreenState createState() => BookListScreenState();
// }

// class BookListScreenState extends State<BookListScreen> {
//   List<Book> _books = [];
//   bool _isDataLoaded = false;

//   Dio dio = Dio();
//   Future<List<Book>> _fetchBooks() async {
//     try {
//       final response = await dio.get(createSet);
//       final List<dynamic> data = response.data['mocks'];

//       List<Book> books = data.map((json) => Book.fromJson(json)).toList();
//       return books;
//     } catch (e) {
//       debugPrint('Error fetching data: $e');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Book List')),
//       body: _isDataLoaded
//           ? ListView.builder(
//               itemCount: _books.length,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 final book = _books[index];
//                 return ListTile(
//                   title: Text(book.title),
//                   subtitle: Text(book.author),
//                   trailing: Text('${book.pages} pages'),
//                 );
//               },
//             )
//           : FutureBuilder<List<Book>>(
//               future: _fetchBooks(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                       child: CircularProgressIndicator.adaptive());
//                 } else if (snapshot.hasError) {
//                   return const Center(child: Text('Error fetching data'));
//                 } else if (snapshot.hasData) {
//                   _books = snapshot.data!;
//                   _isDataLoaded = true;
//                   return ListView.builder(
//                     itemCount: _books.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       final book = _books[index];
//                       return ListTile(
//                         title: Text(book.title),
//                         subtitle: Text(book.author),
//                         trailing: Text('${book.pages} pages'),
//                       );
//                     },
//                   );
//                 } else {
//                   return const Center(child: Text('No data found'));
//                 }
//               },
//             ),
//     );
//   }
// }

// class Book {
//   final String title;
//   final String author;
//   final int pages;

//   Book({required this.title, required this.author, required this.pages});

//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(
//       title: json['title'] as String,
//       author: json['description'] as String,
//       pages: json['price'] as int,
//     );
//   }
// }
