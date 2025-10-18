import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/api_url.dart';
import '../../../data/book_model.dart';
import 'all_books_event.dart';
import 'all_books_state.dart';

class AllBooksBloc extends Bloc<AllBooksEvent, AllBooksState> {
  AllBooksBloc() : super(AllBooksInitial()) {
    on<FetchAllBooksEvent>((event, emit) async {
      emit(AllBooksLoading());

      try {
        final response = await Dio().get(ApiUrl.allBooks());
        final List data = response.data;
        final books = data.map((json) => BookModel.fromJson(json)).toList();

        emit(AllBooksSuccess(books));
      } catch (e) {
        emit(AllBooksError(e.toString()));
      }
    });
  }
}