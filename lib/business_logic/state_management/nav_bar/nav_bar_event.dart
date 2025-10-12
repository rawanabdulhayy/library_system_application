import 'package:equatable/equatable.dart';

abstract class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

/// Fired when the user taps an item on the navbar
class NavBarItemSelected extends NavBarEvent {
  final int index;

  const NavBarItemSelected(this.index);

  @override
  List<Object> get props => [index];
}

/// Fired when another part of the app wants to navigate
/// to a specific tab (e.g. from a button somewhere else)
class NavigateToTab extends NavBarEvent {
  final int index;

  const NavigateToTab(this.index);

  @override
  List<Object> get props => [index];
}
