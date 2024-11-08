
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabeledTextField extends StatelessWidget {
  final String? label;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? initialValue;
  final String? hintText;
  final int? maxLength;
  final TextEditingController? textEditingController;
  final bool enabled;
  final bool? readOnly;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autofillHints;

  const LabeledTextField(
      {super.key,
      this.enabled = true,
      this.textEditingController,
      this.label,
      this.obscureText = false,
      this.suffix,
      this.validator,
      this.onChanged,
      this.textInputAction,
      this.prefixIcon,
      this.keyboardType,
      this.maxLines = 1,
      this.initialValue,
      this.maxLength,
      this.hintText,
      this.inputFormatters,
      this.labelStyle,
      this.fillColor,
      this.readOnly,
      this.autofillHints});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      readOnly: readOnly ?? false,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      maxLength: maxLength,
      cursorColor: Colors.black,
      textInputAction: textInputAction,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      validator: validator,
      controller: textEditingController,
      initialValue: initialValue,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.titleSmall!,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: fillColor ?? Theme.of(context).colorScheme.onPrimary,
        filled: true, 
        prefix: prefixIcon,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 200 * 0.04, vertical: 14
            ),
        labelText: label == null ? null : ' $label ',
        labelStyle:
            labelStyle ?? TextStyle(color: Theme.of(context).iconTheme.color),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            color: Theme.of(context).iconTheme.color!.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            color: Colors.teal,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffix: suffix,
      ),
    );
  }
}
