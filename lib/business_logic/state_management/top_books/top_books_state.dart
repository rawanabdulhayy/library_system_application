import 'package:equatable/equatable.dart';

import '../../../data/book_model.dart';

abstract class TopBooksState extends Equatable {
  const TopBooksState();

  @override
  List<Object?> get props => [];
}

class TopBooksInitial extends TopBooksState {}
class TopBooksLoading extends TopBooksState {}
class TopBooksSuccess extends TopBooksState {
  final List <BookModel> books;

  const TopBooksSuccess(this.books);
  @override
  List<Object?> get props => [books];
}
class TopBooksError extends TopBooksState {
  final String massage;

  const TopBooksError(this.massage);

  @override
  List<Object?> get props => [massage];
}