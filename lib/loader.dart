import 'package:flutter/material.dart';

/// Creates a dialog loader
void showLoader(BuildContext context) {
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Loader(),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Color(0xff017D89),
      ),
    );
  }
}
