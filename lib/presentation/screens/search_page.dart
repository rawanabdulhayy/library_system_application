import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/search/search_bloc.dart';
import 'package:library_system_application/business_logic/state_management/search/search_state.dart';

import '../../business_logic/state_management/search/search_event.dart';
import '../widgets/nav_bar/simple_nav_bar_widget.dart';
import 'details_screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchbarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final List<Map<String, String>> books = [
    //   {
    //     'image': 'assets/images/book_1.png',
    //     'title': 'The Picture of Dorian Gray',
    //     'date': 'Published: 1890',
    //     'description':
    //     'A timeless story exploring the consequences of vanity, moral corruption, and the pursuit of eternal youth.',
    //   },
    //   {
    //     'image': 'assets/images/book_1.png',
    //     'title': 'The Catcher in the Rye',
    //     'date': 'Published: 1951',
    //     'description':
    //     'Holden Caulfield\'s rebellious journey through New York captures the raw essence of adolescence and alienation.',
    //   },
    //   {
    //     'image': 'assets/images/book_1.png',
    //     'title': 'Pride and Prejudice',
    //     'date': 'Published: 1813',
    //     'description':
    //     'Jane Austen\'s classic tale of love, class, and social expectations in Regency-era England.',
    //   },
    // ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 20, right: 20),
        child: Column(
          children: [
            SearchBar(
              controller: searchbarController,
              leading: const Icon(Icons.search, color: Colors.black54),
              hintText: 'Search title/author/ISBN no',
              backgroundColor: WidgetStateProperty.all(
                const Color.fromRGBO(222, 222, 222, 1),
              ),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              ),
              onChanged: (value) {
                context.read<SearchBloc>().add(SearchBooksEvent(value.trim()));
              },
            ),
            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoaded) {
                    final bookResults = state.results;

                    if (bookResults.isEmpty) {
                      return Text("No books found.");
                    }
                    return ListView.builder(
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final book = bookResults[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailsScreen(
                                  title: book['title'],
                                  originalTitle: book['originalTitle'],
                                  releaseDate: book['releaseDate'],
                                  pages: book['pages'],
                                  description: book['description'],
                                  cover: book['cover'],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    book['cover']!,
                                    width: 70,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        book['originalTitle']!,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        book['releaseDate']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        book['description']!,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black54,
                                          height: 1.3,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchError) {
                    return Center(child: Text("Error: ${state.message}"));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
