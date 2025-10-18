abstract class SearchEvent {}

class SearchBooksEvent extends SearchEvent {
  //the event should be the one that gets triggered by passing a certain variable; which is the search query here.
  final String query;
  SearchBooksEvent(this.query);
}