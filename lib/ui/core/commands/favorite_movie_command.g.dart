// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteMovieCommand)
const favoriteMovieCommandProvider = FavoriteMovieCommandFamily._();

final class FavoriteMovieCommandProvider
    extends $NotifierProvider<FavoriteMovieCommand, bool> {
  const FavoriteMovieCommandProvider._({
    required FavoriteMovieCommandFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'favoriteMovieCommandProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$favoriteMovieCommandHash();

  @override
  String toString() {
    return r'favoriteMovieCommandProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FavoriteMovieCommand create() => FavoriteMovieCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteMovieCommandProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$favoriteMovieCommandHash() =>
    r'659261a91970bc6e0f42a7d6b1d2975fc538e0f1';

final class FavoriteMovieCommandFamily extends $Family
    with $ClassFamilyOverride<FavoriteMovieCommand, bool, bool, bool, int> {
  const FavoriteMovieCommandFamily._()
    : super(
        retry: null,
        name: r'favoriteMovieCommandProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FavoriteMovieCommandProvider call({required int id}) =>
      FavoriteMovieCommandProvider._(argument: id, from: this);

  @override
  String toString() => r'favoriteMovieCommandProvider';
}

abstract class _$FavoriteMovieCommand extends $Notifier<bool> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  bool build({required int id});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(id: _$args);
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
