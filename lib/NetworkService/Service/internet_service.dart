import 'dart:async';
import 'dart:io';

enum InternetStatus { connected, disconnected }

class InternetService {
  static final InternetService _instance = InternetService._internal();
  factory InternetService() => _instance;
  InternetService._internal();

  final StreamController<InternetStatus> _controller =
      StreamController<InternetStatus>.broadcast();

  Stream<InternetStatus> get stream => _controller.stream;

  InternetStatus _lastStatus = InternetStatus.connected;

  void startMonitoring() {
    Timer.periodic(const Duration(seconds: 3), (_) async {
      await checkNow();
    });
  }

  /// ✅ FORCE CHECK (used by Retry button)
  Future<void> checkNow() async {
    final status = await _checkInternet();
    if (status != _lastStatus) {
      _lastStatus = status;
      _controller.add(status);
    }
  }

  Future<InternetStatus> _checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty
          ? InternetStatus.connected
          : InternetStatus.disconnected;
    } catch (_) {
      return InternetStatus.disconnected;
    }
  }
}
