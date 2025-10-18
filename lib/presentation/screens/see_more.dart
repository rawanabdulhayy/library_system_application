import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/all_books/all_books_event.dart';
import 'package:library_system_application/business_logic/state_management/all_books/all_books_state.dart';
import 'package:library_system_application/presentation/screens/details_screen.dart';

import '../../business_logic/state_management/all_books/all_books_bloc.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  void initState() {
    super.initState();
    context.read<AllBooksBloc>().add(FetchAllBooksEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Books"), centerTitle: true),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;

          // 💡 Example: calculate how many columns fit dynamically
          int crossAxisCount = screenWidth ~/ 180; // each tile ~180px wide
          if (crossAxisCount < 2) crossAxisCount = 2; // minimum 2 columns

          return BlocBuilder<AllBooksBloc, AllBooksState>(
            builder: (context, state) {
              if (state is AllBooksSuccess) {
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: screenWidth * 0.04,
                    mainAxisSpacing: screenHeight * 0.02,
                    childAspectRatio: 0.62, // shape ratio (adjust as needed)
                  ),
                  itemCount: state.books.length, // total items
                  itemBuilder: (context, index) {
                    // final titles = [
                    //   'Dorian Gray',
                    //   'Catcher in the Rye',
                    //   'Pride & Prejudice',
                    //   'Frankenstein',
                    //   'The Hobbit',
                    //   'Jane Eyre',
                    // ];
                    // final authors = [
                    //   'Oscar Wilde',
                    //   'J.D. Salinger',
                    //   'Jane Austen',
                    //   'Mary Shelley',
                    //   'J.R.R. Tolkien',
                    //   'Charlotte Brontë',
                    // ];
                    // final images = [
                    //   'assets/images/book_1.png',
                    //   'assets/images/book_2.png',
                    //   'assets/images/book_3.png',
                    //   'assets/images/book_4.png',
                    //   'assets/images/book_5.png',
                    //   'assets/images/book_6.png',
                    // ];
                    final book = state.books[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return DetailsScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.network(
                                  // images[index],
                                  book.cover,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book.originalTitle,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      book.releaseDate,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      '\$25.00',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
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
                    );
                  },
                );
              } else if (state is AllBooksLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is AllBooksError) {
                return Text("Error encountered: ${state.massage}");
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
