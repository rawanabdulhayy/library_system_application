import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/presentation/screens/details_screen.dart';

import '../../../business_logic/state_management/random_book/random_book_bloc.dart';
import '../../../business_logic/state_management/random_book/random_book_state.dart';

class RandomBookWidget extends StatefulWidget {
  const RandomBookWidget({super.key});

  @override
  State<RandomBookWidget> createState() => _RandomBookWidgetState();
}

class _RandomBookWidgetState extends State<RandomBookWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomBookBloc, RandomBookState>(
      builder: (context, state) {
        if (state is RandomBookSuccess) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return DetailsScreen(
                      title: state.books.first.title,
                      originalTitle: state.books.first.originalTitle,
                      releaseDate: state.books.first.releaseDate,
                      pages: state.books.first.pages,
                      description: state.books.first.description,
                      cover: state.books.first.cover,
                    );
                  },
                ),
              );
            },
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(state.books.first.cover),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Novel',
                          //   style: TextStyle(color: Colors.white70, fontSize: 14),
                          // ),
                          // SizedBox(height: 4),
                          Text(
                            state.books.first.originalTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            state.books.first.releaseDate,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${state.books.first.pages.toString()} pages',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
        } else if (state is RandomBookLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RandomBookError) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return Container();
        }
      },
    );
  }
}
