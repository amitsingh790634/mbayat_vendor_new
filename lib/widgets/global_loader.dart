import '../Utils/allExport.dart';

class GlobalLoader extends StatelessWidget {
  const GlobalLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: loaderNotifier,
      builder: (context, _) {
        if (!loaderNotifier.isLoading) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            /// 🔲 Semi-transparent background
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.35),
              ),
            ),

            /// ⏳ Loader
            const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          ],
        );
      },
    );
  }
}
