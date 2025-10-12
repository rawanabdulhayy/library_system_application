import 'package:flutter/material.dart';

import '../widgets/nav_bar/simple_nav_bar_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> books = [
      {
        'image': 'assets/images/book_1.png',
        'title': 'The Picture of Dorian Gray',
        'date': 'Published: 1890',
        'description':
        'A timeless story exploring the consequences of vanity, moral corruption, and the pursuit of eternal youth.',
      },
      {
        'image': 'assets/images/book_1.png',
        'title': 'The Catcher in the Rye',
        'date': 'Published: 1951',
        'description':
        'Holden Caulfield\'s rebellious journey through New York captures the raw essence of adolescence and alienation.',
      },
      {
        'image': 'assets/images/book_1.png',
        'title': 'Pride and Prejudice',
        'date': 'Published: 1813',
        'description':
        'Jane Austen\'s classic tale of love, class, and social expectations in Regency-era England.',
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 20, right: 20),
        child: Column(
          children: [
            SearchBar(
              leading: const Icon(Icons.search, color: Colors.black54),
              hintText: 'Search title/author/ISBN no',
              backgroundColor: WidgetStateProperty.all(
                const Color.fromRGBO(222, 222, 222, 1),
              ),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SimpleNavBar(),
    );
  }
}