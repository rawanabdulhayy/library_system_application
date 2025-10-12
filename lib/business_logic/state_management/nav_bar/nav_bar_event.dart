import 'package:equatable/equatable.dart';

abstract class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

class NavBarItemSelected extends NavBarEvent {
  final int index;

  const NavBarItemSelected(this.index);

  @override
  List<Object> get props => [index];
}
