import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/all_books/all_books_bloc.dart';
import 'package:library_system_application/business_logic/state_management/top_books/top_books_bloc.dart';
import 'package:library_system_application/presentation/screens/favourites_page.dart';
import '../../business_logic/state_management/nav_bar/nav_bar_bloc.dart';
import '../../business_logic/state_management/nav_bar/nav_bar_state.dart';
import '../../business_logic/state_management/random_book/random_book_bloc.dart';
import '../../business_logic/state_management/search/search_bloc.dart';
import '../widgets/nav_bar/simple_nav_bar_widget.dart';
import 'home_page.dart';
import 'search_page.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The IndexedStack swaps visible child based on the current index
      // body: BlocBuilder<NavBarBloc, NavBarState>(
      //   builder: (context, state) {
      //     return IndexedStack(
      //       index: state.selectedIndex,
      //       children: [
      //         BlocProvider(
      //           create: (context) => AllBooksBloc(),
      //           child: const HomePage(),
      //         ),
      //         const SearchPage(),
      //         const FavouritesPage(),
      //       ],
      //     );
      //   },
      // ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AllBooksBloc()),
          BlocProvider(create: (context) => SearchBloc()),
          BlocProvider(create: (context) => RandomBookBloc()),
          BlocProvider(create: (context) => TopBooksBloc()),
        ],
        child: BlocBuilder<NavBarBloc, NavBarState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.selectedIndex,
              children: const [
                HomePage(),
                SearchPage(),
                FavouritesPage(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const SimpleNavBar(),
    );
  }
}

// ✅ Pros:
// Keeps all pages alive (no rebuilds).
// Back navigation doesn’t reset tab content.
// The BLoC still controls which page is active.
// 🧠 The “navigation” is visual switching, not a new route push.