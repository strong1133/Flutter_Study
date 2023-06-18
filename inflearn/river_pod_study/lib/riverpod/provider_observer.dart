import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    print('[Provider Updated] provider: $provider / pv: $previousValue / nv: $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    print('[Provider Add] provider: $provider / value: $value');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    print('[Provider Dispose] provider: $provider');
    super.didDisposeProvider(provider, container);
  }
}
