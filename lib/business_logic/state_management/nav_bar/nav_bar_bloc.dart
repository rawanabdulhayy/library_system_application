import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_bar_event.dart';
import 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(const NavBarState(0)) {
    // Handles taps directly on the navbar items
    on<NavBarItemSelected>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
    // Handles programmatic navigation requests from other parts of the app
    on<NavigateToTab>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
