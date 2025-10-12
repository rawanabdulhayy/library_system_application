import 'package:flutter/material.dart';
import 'package:library_system_application/presentation/screens/search_page.dart';
import 'package:library_system_application/presentation/screens/see_more.dart';
import 'package:library_system_application/presentation/widgets/all_books_widget.dart';
import 'package:library_system_application/presentation/widgets/top_three_books.dart';

import '../widgets/nav_bar/simple_nav_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0; // track selected index
  //
  // void _onNavTap(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   // You can also handle navigation here if you have multiple pages:
  //   // if (index == 0) Navigator.push(...);
  // }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Navigator.push(context, MaterialPageRoute(builder: (_){return SearchPage();}));
                    },
                    icon: Icon(Icons.search_sharp, size: 28),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(
                "Best Deals",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Container(
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
                      child: Image.asset("assets/images/tuesday_mooney.png"),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Novel',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Tuesday Mooney\nTalks to Ghosts',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Kate Racculia',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$33.00',
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
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Books',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Text(
                      'see more',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){return SeeMore();}));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 28),
              AllBooksWidget(),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top 3 Books',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              TopThreeBooks(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SimpleNavBar(),
    );
  }
}
