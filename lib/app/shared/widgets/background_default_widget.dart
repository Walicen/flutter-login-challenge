import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../utils/paths/svgs_path.dart';

class BackgroundDefaultWidget extends StatelessWidget {
  const BackgroundDefaultWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: Svg(SvgsPath.background),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
