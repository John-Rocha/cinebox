sealed class Result<T> {}

class Unit {}

class Success<T> extends Result<T> {
  final T value;

  Success({required this.value});
}

class Failure<T> extends Result<T> {
  final Exception error;
  final Object? value;

  Failure({required this.error, this.value});
}

Result<Unit> successOfUnit() => Success(value: Unit());
