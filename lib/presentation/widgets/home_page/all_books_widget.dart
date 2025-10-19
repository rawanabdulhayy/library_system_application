import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/all_books/all_books_bloc.dart';
import 'package:library_system_application/business_logic/state_management/all_books/all_books_state.dart';

import '../../screens/details_screen.dart';

class AllBooksWidget extends StatelessWidget {
  const AllBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksBloc, AllBooksState>(
      builder: (context, state) {
        if (state is AllBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                // final isFirst = index == 0;
                final book = state.books[index];
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
                          // 🖼️ Top half - image (50%)
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              book.cover,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),

                          // ⚫ Bottom half - black info section (50%)
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.black,
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   book.title,
                                  //   style: TextStyle(
                                  //     color: Colors.white70,
                                  //     fontSize: 13,
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 4),
                                  Text(
                                    book.originalTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                    ),
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
                                    '${book.pages.toString()} pages',
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
            ),
          );
        } else if (state is AllBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllBooksError) {
          return Center(child: Text("Error: ${state.massage}"));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
