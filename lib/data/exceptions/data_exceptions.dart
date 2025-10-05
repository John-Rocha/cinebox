class DataExceptions implements Exception {
  final String message;

  DataExceptions({required this.message});

  @override
  String toString() => 'DataExceptions: $message';
}
