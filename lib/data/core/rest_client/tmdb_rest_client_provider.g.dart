// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_rest_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tmdbRestClient)
const tmdbRestClientProvider = TmdbRestClientProvider._();

final class TmdbRestClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const TmdbRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tmdbRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tmdbRestClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return tmdbRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$tmdbRestClientHash() => r'0fdbeafdd26c016f1340cca38bb1c29dbce5c8f7';
