// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetFavoriteCommand)
const getFavoriteCommandProvider = GetFavoriteCommandProvider._();

final class GetFavoriteCommandProvider
    extends
        $NotifierProvider<GetFavoriteCommand, AsyncValue<List<FavoriteMovie>>> {
  const GetFavoriteCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFavoriteCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFavoriteCommandHash();

  @$internal
  @override
  GetFavoriteCommand create() => GetFavoriteCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<FavoriteMovie>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<FavoriteMovie>>>(
        value,
      ),
    );
  }
}

String _$getFavoriteCommandHash() =>
    r'3dba8256d411c330d1e20bd62c4a4ab7d8fb1950';

abstract class _$GetFavoriteCommand
    extends $Notifier<AsyncValue<List<FavoriteMovie>>> {
  AsyncValue<List<FavoriteMovie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<FavoriteMovie>>,
              AsyncValue<List<FavoriteMovie>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FavoriteMovie>>,
                AsyncValue<List<FavoriteMovie>>
              >,
              AsyncValue<List<FavoriteMovie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
