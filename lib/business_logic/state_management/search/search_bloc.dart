import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system_application/business_logic/state_management/search/search_event.dart';
import 'package:library_system_application/business_logic/state_management/search/search_state.dart';
import '../../../core/api/api_url.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchBooksEvent>((event, emit) async {
      //so first we have to access the query that triggers the event, from the event itself.
      final query = event.query.trim();
      //our safe-guard checker in case no queries have been passed yet.
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());

      try {
        //dio.get(base_url.STATIC_FUNCTION >> static String searchBook(String query))
        final response = await Dio().get(ApiUrl.searchBook(query));
        //access to the data from the gotten-back response.
        final data = response.data;
        //data adaptor if-else checkers.
        if (data is List) {
          emit(SearchLoaded(data));
        } else if (data is Map && data.containsKey('books')) {
          emit(SearchLoaded(List<Map<String, dynamic>>.from(data['books'])));
        } else {
          emit(SearchError("Unexpected data format"));
        }
      } catch (e) {
        emit(SearchError("Failed to fetch results: $e"));
      }
    });
  }
}
