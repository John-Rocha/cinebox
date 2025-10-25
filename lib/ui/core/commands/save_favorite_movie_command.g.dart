// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_favorite_movie_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SaveFavoriteMovieCommand)
const saveFavoriteMovieCommandProvider = SaveFavoriteMovieCommandFamily._();

final class SaveFavoriteMovieCommandProvider
    extends $NotifierProvider<SaveFavoriteMovieCommand, AsyncValue<int>> {
  const SaveFavoriteMovieCommandProvider._({
    required SaveFavoriteMovieCommandFamily super.from,
    required ({Key key, int id}) super.argument,
  }) : super(
         retry: null,
         name: r'saveFavoriteMovieCommandProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveFavoriteMovieCommandHash();

  @override
  String toString() {
    return r'saveFavoriteMovieCommandProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SaveFavoriteMovieCommand create() => SaveFavoriteMovieCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveFavoriteMovieCommandProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveFavoriteMovieCommandHash() =>
    r'a7474d38f42434bc3a2a0a8b9419a317935bd1d7';

final class SaveFavoriteMovieCommandFamily extends $Family
    with
        $ClassFamilyOverride<
          SaveFavoriteMovieCommand,
          AsyncValue<int>,
          AsyncValue<int>,
          AsyncValue<int>,
          ({Key key, int id})
        > {
  const SaveFavoriteMovieCommandFamily._()
    : super(
        retry: null,
        name: r'saveFavoriteMovieCommandProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SaveFavoriteMovieCommandProvider call({required Key key, required int id}) =>
      SaveFavoriteMovieCommandProvider._(
        argument: (key: key, id: id),
        from: this,
      );

  @override
  String toString() => r'saveFavoriteMovieCommandProvider';
}

abstract class _$SaveFavoriteMovieCommand extends $Notifier<AsyncValue<int>> {
  late final _$args = ref.$arg as ({Key key, int id});
  Key get key => _$args.key;
  int get id => _$args.id;

  AsyncValue<int> build({required Key key, required int id});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(key: _$args.key, id: _$args.id);
    final ref = this.ref as $Ref<AsyncValue<int>, AsyncValue<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, AsyncValue<int>>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
