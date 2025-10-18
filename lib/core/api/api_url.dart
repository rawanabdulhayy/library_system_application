class ApiUrl {
  // Base URL of your API
  static const String baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  // Search book endpoint
  static String searchBook(String query) {
    return '$baseUrl/books?query=$query';
  }
}
