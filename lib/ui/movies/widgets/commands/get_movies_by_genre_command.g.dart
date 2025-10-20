// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_by_genre_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetMoviesByGenreCommand)
const getMoviesByGenreCommandProvider = GetMoviesByGenreCommandProvider._();

final class GetMoviesByGenreCommandProvider
    extends
        $NotifierProvider<GetMoviesByGenreCommand, AsyncValue<List<Movie>>> {
  const GetMoviesByGenreCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByGenreCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByGenreCommandHash();

  @$internal
  @override
  GetMoviesByGenreCommand create() => GetMoviesByGenreCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Movie>>>(value),
    );
  }
}

String _$getMoviesByGenreCommandHash() =>
    r'0d6a60ece8ac37690bc170d17c4b4835b2c1990c';

abstract class _$GetMoviesByGenreCommand
    extends $Notifier<AsyncValue<List<Movie>>> {
  AsyncValue<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, AsyncValue<List<Movie>>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
