// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landlords_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LandlordsNotifier)
const landlordsProvider = LandlordsNotifierProvider._();

final class LandlordsNotifierProvider
    extends $AsyncNotifierProvider<LandlordsNotifier, List<Landlord>> {
  const LandlordsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'landlordsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$landlordsNotifierHash();

  @$internal
  @override
  LandlordsNotifier create() => LandlordsNotifier();
}

String _$landlordsNotifierHash() => r'0938d99178777913a17ed8204a5d40cecb8b068a';

abstract class _$LandlordsNotifier extends $AsyncNotifier<List<Landlord>> {
  FutureOr<List<Landlord>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Landlord>>, List<Landlord>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Landlord>>, List<Landlord>>,
        AsyncValue<List<Landlord>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
