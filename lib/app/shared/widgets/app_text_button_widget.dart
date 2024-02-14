import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppTextButtonWidget extends StatelessWidget {
  const AppTextButtonWidget({
    super.key,
    required this.label,
    this.textStyle,
    this.onPressed,
  });

  final String label;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle ??
            Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
      ),
    );
  }
}
