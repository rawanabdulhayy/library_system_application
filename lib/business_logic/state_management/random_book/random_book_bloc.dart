import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/random_book/random_book_event.dart';
import 'package:library_system_application/business_logic/state_management/random_book/random_book_state.dart';
import '../../../core/api/api_url.dart';
import '../../../data/book_model.dart';

class RandomBookBloc extends Bloc<RandomBookEvent, RandomBookState> {
  RandomBookBloc() : super(RandomBookInitial()) {
    on<FetchRandomBook>((event, emit) async {
      emit(RandomBookLoading());

      try {
        final response = await Dio().get(ApiUrl.randomBook());
        final data = response.data as Map<String, dynamic>;
        final book = BookModel.fromJson(data);
        emit(RandomBookSuccess([book]));

      } catch (e) {
        emit(RandomBookError(e.toString()));
      }
    });
  }
}