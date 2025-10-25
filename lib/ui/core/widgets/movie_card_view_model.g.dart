// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_card_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieCardViewModel)
const movieCardViewModelProvider = MovieCardViewModelFamily._();

final class MovieCardViewModelProvider
    extends $NotifierProvider<MovieCardViewModel, void> {
  const MovieCardViewModelProvider._({
    required MovieCardViewModelFamily super.from,
    required ({Key key, int id}) super.argument,
  }) : super(
         retry: null,
         name: r'movieCardViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieCardViewModelHash();

  @override
  String toString() {
    return r'movieCardViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  MovieCardViewModel create() => MovieCardViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MovieCardViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieCardViewModelHash() =>
    r'5c798e6e4391418fbc1869c9bd461093bc4e63c9';

final class MovieCardViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          MovieCardViewModel,
          void,
          void,
          void,
          ({Key key, int id})
        > {
  const MovieCardViewModelFamily._()
    : super(
        retry: null,
        name: r'movieCardViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieCardViewModelProvider call({required Key key, required int id}) =>
      MovieCardViewModelProvider._(argument: (key: key, id: id), from: this);

  @override
  String toString() => r'movieCardViewModelProvider';
}

abstract class _$MovieCardViewModel extends $Notifier<void> {
  late final _$args = ref.$arg as ({Key key, int id});
  Key get key => _$args.key;
  int get id => _$args.id;

  void build({required Key key, required int id});
  @$mustCallSuper
  @override
  void runBuild() {
    build(key: _$args.key, id: _$args.id);
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
