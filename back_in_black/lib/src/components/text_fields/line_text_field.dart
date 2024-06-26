import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldStatus { enabled, disabled, success, error }

class LineTextField extends StatefulWidget {
  final TextFieldStatus status;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? erroText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputAction? textInputAction;
  const LineTextField({
    super.key,
    required this.status,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.inputFormatters,
    this.erroText,
    this.autofocus,
    this.focusNode,
    this.suffixIcon,
    this.hintText,
    this.textInputAction,
  });

  @override
  State<LineTextField> createState() => _LineTextFieldState();
}

class _LineTextFieldState extends State<LineTextField> {
  FocusNode myFocusNode = FocusNode();
  bool obscureText = true;

  @override
  void initState() {
    if (widget.focusNode != null) {
      myFocusNode = widget.focusNode!;
    }
    myFocusNode.addListener(() {
      //setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: _texField(context),
    );
  }

  Widget _texField(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge;
    return TextField(
      focusNode: myFocusNode,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.status != TextFieldStatus.disabled &&
          widget.status != TextFieldStatus.success,
      autofocus: widget.autofocus ?? false,
      style: textStyle,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        labelStyle: textStyle,
        hintStyle: textStyle,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
      ),
    );
  }
}
