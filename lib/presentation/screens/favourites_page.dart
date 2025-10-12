import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/state_management/nav_bar/nav_bar_bloc.dart';
import '../../business_logic/state_management/nav_bar/nav_bar_event.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> books = [
      {
        'image': 'assets/images/book_1.png',
        'title': 'The Picture of Dorian Gray',
        'date': 'Published: 1890',
      },
      {
        'image': 'assets/images/book_1.png',
        'title': 'The Catcher in the Rye',
        'date': 'Published: 1951',
      },
      {
        'image': 'assets/images/book_1.png',
        'title': 'Pride and Prejudice',
        'date': 'Published: 1813',
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Happy Reading!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_){return SearchPage();}));
                    context.read<NavBarBloc>().add(NavigateToTab(1)); // e.g. go to Search tab
                  },
                  icon: Icon(Icons.search_sharp, size: 28),
                ),
              ],
            ),
            // 👉 You placed an Expanded inside a Padding — but Expanded only works directly under a Column, Row, or Flex.
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            book['image']!,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book['title']!,
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
                                book['date']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                        ),
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
