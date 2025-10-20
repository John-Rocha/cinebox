// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_by_name.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchMoviesByName)
const searchMoviesByNameProvider = SearchMoviesByNameProvider._();

final class SearchMoviesByNameProvider
    extends $NotifierProvider<SearchMoviesByName, AsyncValue<List<Movie>>> {
  const SearchMoviesByNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchMoviesByNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchMoviesByNameHash();

  @$internal
  @override
  SearchMoviesByName create() => SearchMoviesByName();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Movie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Movie>>>(value),
    );
  }
}

String _$searchMoviesByNameHash() =>
    r'24f84218193874be7ff302e7e70208c66fbdf944';

abstract class _$SearchMoviesByName extends $Notifier<AsyncValue<List<Movie>>> {
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
