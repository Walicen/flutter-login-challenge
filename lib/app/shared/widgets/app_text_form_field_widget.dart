import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.label,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.isPassword = false,
    this.controller,
    this.padding,
    this.validator,
    this.onChanged,
    this.autocorrect = false,
  });

  final String? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final bool isPassword;
  final bool autocorrect;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obscureText = true;

  void _toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 42.0, vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        autocorrect: widget.autocorrect,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword ? obscureText : false,
        validator: widget.validator,
        onChanged: widget.onChanged,
        style: widget.hintStyle ??
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textPrimary,
                ),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: _toggleObscureText,
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          labelText: widget.label,
          labelStyle: widget.labelStyle,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
