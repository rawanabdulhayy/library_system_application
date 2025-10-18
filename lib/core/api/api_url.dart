class ApiUrl {
  // Base URL of your API
  static const String baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  // Search book endpoint
  static String searchBook(String query) {
    return '$baseUrl/books?query=$query';
  }

  // Top books endpoint
  static String topBooks(int count) {
    return '$baseUrl/books?max=$count';
  }

  // A Random books endpoint
  static String randomBook() {
    return '$baseUrl/books/random';
  }

  // All books endpoint
  static String allBooks() {
    return baseUrl;
  }
}
