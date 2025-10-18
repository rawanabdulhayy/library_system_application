import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/all_books/all_books_bloc.dart';
import 'package:library_system_application/business_logic/state_management/all_books/all_books_event.dart';
import 'package:library_system_application/business_logic/state_management/random_book/random_book_bloc.dart';
import 'package:library_system_application/business_logic/state_management/random_book/random_book_state.dart';
import 'package:library_system_application/business_logic/state_management/top_books/top_books_event.dart';
import 'package:library_system_application/presentation/screens/search_page.dart';
import 'package:library_system_application/presentation/screens/see_more.dart';
import 'package:library_system_application/presentation/widgets/home_page/all_books_widget.dart';
import 'package:library_system_application/presentation/widgets/home_page/random_book_widget.dart';
import 'package:library_system_application/presentation/widgets/home_page/top_three_books.dart';

import '../../business_logic/state_management/nav_bar/nav_bar_bloc.dart';
import '../../business_logic/state_management/nav_bar/nav_bar_event.dart';
import '../../business_logic/state_management/random_book/random_book_event.dart';
import '../../business_logic/state_management/top_books/top_books_bloc.dart';
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
  void initState() {
    super.initState();
    context.read<AllBooksBloc>().add(FetchAllBooksEvent());
    context.read<RandomBookBloc>().add(FetchRandomBook());
    context.read<TopBooksBloc>().add(FetchTopBooksEvent());
  }

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
                      // Navigator.push(context, MaterialPageRoute(builder: (_){return SearchPage();}));
                      context.read<NavBarBloc>().add(
                        NavigateToTab(1),
                      ); // e.g. go to Search tab
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
              RandomBookWidget(),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return BlocProvider(
                              create: (context) => AllBooksBloc(),
                              child: SeeMore(),
                            );
                          },
                        ),
                      );
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
    );
  }
}
