import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/theme/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.minimumSize,
    this.margin,
    required this.loading,
  });

  final String label;
  final VoidCallback? onPressed;
  final Size? minimumSize;
  final EdgeInsetsGeometry? margin;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 31.0),
      child: loading
          ? const SpinKitFadingCube(
              color: AppColors.textPrimary,
              size: 50.0,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                disabledBackgroundColor: AppColors.grey,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                minimumSize: minimumSize ?? const Size(320, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: const BorderSide(color: AppColors.textPrimary, width: 2.0),
                ),
              ),
              child: Text(label),
            ),
    );
  }
}
