// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_genres_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetGenresCommand)
const getGenresCommandProvider = GetGenresCommandProvider._();

final class GetGenresCommandProvider
    extends $AsyncNotifierProvider<GetGenresCommand, List<Genre>> {
  const GetGenresCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGenresCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGenresCommandHash();

  @$internal
  @override
  GetGenresCommand create() => GetGenresCommand();
}

String _$getGenresCommandHash() => r'141446d76fe9df50ee8ffb2bce68b2b280deab34';

abstract class _$GetGenresCommand extends $AsyncNotifier<List<Genre>> {
  FutureOr<List<Genre>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Genre>>, List<Genre>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Genre>>, List<Genre>>,
              AsyncValue<List<Genre>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
