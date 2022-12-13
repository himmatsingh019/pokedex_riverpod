class ServerException implements Exception {
  String message;

  ServerException({this.message = 'Unknown error occurred'});
}

class CacheException implements Exception {}
