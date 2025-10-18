import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/top_books/top_books_event.dart';
import 'package:library_system_application/business_logic/state_management/top_books/top_books_state.dart';
import '../../../core/api/api_url.dart';
import '../../../data/book_model.dart';

class TopBooksBloc extends Bloc<TopBooksEvent, TopBooksState> {
  TopBooksBloc() : super(TopBooksInitial()) {
    on<FetchTopBooksEvent>((event, emit) async {
      emit(TopBooksLoading());

      try {
        //returned data is a list, in which there are a number of returned JSON objects.
        final response = await Dio().get(ApiUrl.topBooks(3));
        final List data = response.data;
        final List <BookModel> books = data.map((json) => BookModel.fromJson(json)).toList();

        emit(TopBooksSuccess(books));
      } catch (e) {
        emit(TopBooksError(e.toString()));
      }
    });
  }
}