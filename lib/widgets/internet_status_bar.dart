import 'package:mbayat_user_app/NetworkService/Service/internet_service.dart';
import 'package:mbayat_user_app/Provider/ScreenProvider/internet_provider.dart';

import '../Utils/allExport.dart';

class InternetStatusBar extends StatefulWidget {
  const InternetStatusBar({super.key});

  @override
  State<InternetStatusBar> createState() => _InternetStatusBarState();
}

class _InternetStatusBarState extends State<InternetStatusBar>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  bool _backOnline = false;
  bool _checking = false;

  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );

    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<InternetProvider>(context, listen: false);
      provider.addListener(_onStatusChange);

      if (provider.status == InternetStatus.disconnected) {
        _showOffline();
      }
    });
  }

  void _onStatusChange() {
    final provider = Provider.of<InternetProvider>(context, listen: false);
    provider.status == InternetStatus.disconnected
        ? _showOffline()
        : _showBackOnline();
  }

  void _showOffline() {
    if (!_visible) {
      setState(() {
        _visible = true;
        _backOnline = false;
      });
      _controller.forward();
    }
  }

  void _showBackOnline() {
    if (!_visible) return;

    setState(() => _backOnline = true);

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.reverse();
        setState(() {
          _visible = false;
          _backOnline = false;
        });
      }
    });
  }

  Future<void> _retryConnection() async {
    setState(() => _checking = true);
    await InternetService().checkNow();
    if (mounted) setState(() => _checking = false);
  }

  @override
  void dispose() {
    Provider.of<InternetProvider>(
      context,
      listen: false,
    ).removeListener(_onStatusChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible && !_backOnline) return const SizedBox.shrink();

    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topCenter,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
          child: SlideTransition(
            position: _slide,
            child: ScaleTransition(
              scale: _scale,
              child: Material(
                elevation: 14,
                shadowColor: (_backOnline ? Colors.green : Colors.red)
                    .withOpacity(.4),
                borderRadius: BorderRadius.circular(18),
                color: _backOnline
                    ? Colors.green.shade600
                    : Colors.red.shade600,
                child: Stack(
                  children: [
                    /// Bottom Glow
                    Positioned(
                      bottom: 0,
                      left: 40,
                      right: 40,
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(.35),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              _backOnline ? Icons.wifi : Icons.wifi_off,
                              key: ValueKey(_backOnline),
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Text(
                                _backOnline
                                    ? "Back Online"
                                    : "No Internet Connection",
                                key: ValueKey(_backOnline),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          if (!_backOnline)
                            InkWell(
                              borderRadius: BorderRadius.circular(30),
                              onTap: _checking ? null : _retryConnection,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                    _checking ? .15 : .25,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: _checking
                                    ? const SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Row(
                                        children: [
                                          Icon(
                                            Icons.refresh,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            "Retry",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
