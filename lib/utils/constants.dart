class Constants {
  static const API_KEY = 'API-KEY';

  static const String TOP_HEADER_LINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY';

  static const String APPLE_NEWS_URL =
      'https://newsapi.org/v2/everything?q=apple&sortBy=popularity&apiKey=$API_KEY';

  static String headLinesFor(country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = {
    'USA': 'us',
    'Turkey': 'tr',
    'Korea': 'kr',
    'China': 'ch',
    'Arabic': 'ar'
  };
}
