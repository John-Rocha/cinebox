// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_logged_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckUserLoggedCommand)
const checkUserLoggedCommandProvider = CheckUserLoggedCommandProvider._();

final class CheckUserLoggedCommandProvider
    extends $AsyncNotifierProvider<CheckUserLoggedCommand, bool?> {
  const CheckUserLoggedCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkUserLoggedCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkUserLoggedCommandHash();

  @$internal
  @override
  CheckUserLoggedCommand create() => CheckUserLoggedCommand();
}

String _$checkUserLoggedCommandHash() =>
    r'558eed218050d62c02e8125ead9ce7fb2e96c77f';

abstract class _$CheckUserLoggedCommand extends $AsyncNotifier<bool?> {
  FutureOr<bool?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool?>, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool?>, bool?>,
              AsyncValue<bool?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
