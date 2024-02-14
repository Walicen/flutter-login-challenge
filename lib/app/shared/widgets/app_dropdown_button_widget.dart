import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppDrodownButton extends StatelessWidget {
  const AppDrodownButton({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    required this.hintText,
  });

  final int? value;
  final List<String> items;
  final void Function(int?) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 8.0),
      child: DropdownButton<int>(
        value: items.isEmpty ? null : value,
        isExpanded: true,
        hint: Text(hintText),
        items: items
            .mapIndexed(
              (int index, String value) => DropdownMenuItem<int>(
                value: index,
                child: Text(value),
              ),
            )
            .toList(),
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
      ),
    );
  }
}
