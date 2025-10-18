import 'package:equatable/equatable.dart';
import '../../../data/book_model.dart';

abstract class AllBooksState extends Equatable {
  const AllBooksState();

  @override
  List<Object?> get props => [];
}

class AllBooksInitial extends AllBooksState {}
class AllBooksLoading extends AllBooksState {}
class AllBooksSuccess extends AllBooksState {
  final List <BookModel> books;

  const AllBooksSuccess(this.books);
  @override
  List<Object?> get props => [books];
}
class AllBooksError extends AllBooksState {
  final String massage;

  const AllBooksError(this.massage);

  @override
  List<Object?> get props => [massage];
}