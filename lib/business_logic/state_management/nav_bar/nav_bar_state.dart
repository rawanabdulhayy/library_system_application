import 'package:equatable/equatable.dart';

class NavBarState extends Equatable {
  final int selectedIndex;

  const NavBarState(this.selectedIndex);

  NavBarState copyWith({int? selectedIndex}) =>
      NavBarState(selectedIndex ?? this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

//todo: copy with vs copy? in bloc and in models? and how do we know of we need the copy with inside of our state?