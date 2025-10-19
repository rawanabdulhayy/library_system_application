import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/state_management/top_books/top_books_bloc.dart';
import '../../../business_logic/state_management/top_books/top_books_state.dart';
import '../../../business_logic/state_management/top_books/top_books_event.dart';
import '../../../data/book_model.dart';
import '../../screens/details_screen.dart';

class TopThreeBooks extends StatefulWidget {
  const TopThreeBooks({super.key});

  @override
  State<TopThreeBooks> createState() => _TopThreeBooksState();
}

class _TopThreeBooksState extends State<TopThreeBooks> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: BlocBuilder<TopBooksBloc, TopBooksState>(
        builder: (context, state) {
          if (state is TopBooksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopBooksError) {
            return Center(
              child: Text(
                'Error: ${state.massage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is TopBooksSuccess) {
            final List<BookModel> books = state.books;

            if (books.isEmpty) {
              return const Center(child: Text('No books found.'));
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              separatorBuilder: (context, index) =>
              const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final book = books[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return DetailsScreen(
                            title: book.title,
                            originalTitle: book.originalTitle,
                            releaseDate: book.releaseDate,
                            pages: book.pages,
                            description: book.description,
                            cover: book.cover,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Column(
                        children: [
                          // 🖼️ Top Half - Book Cover
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              book.cover,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error, color: Colors.red),
                            ),
                          ),

                          // ⚫ Bottom Half - Info
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.black,
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Top 3 Books',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    book.originalTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    book.releaseDate,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${book.pages} pages',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox(); // For initial state
          }
        },
      ),
    );
  }
}
