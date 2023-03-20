// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_flutter_project/components/typography.dart';
import 'package:base_flutter_project/core/theme.dart';

class TextFieldOutlineWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final String? labelText;
  final String? prefixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool obscureText;
  final TextEditingController? controller;
  final Function? functionValidate;
  final Function? customValidation;
  final String? parametersValidate;
  final TextInputAction actionKeyboard;
  final Function? onSubmitField;
  final VoidCallback? onFieldTap;
  final Function? onChange;
  final bool readOnly;
  final bool isNumberOnly;
  final bool isDisabled;
  double? labelSize;
  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final TypographyToken? typographyToken;

  TextFieldOutlineWidget(
      {Key? key,
      this.hintText,
      this.labelText,
      this.prefixText,
      this.focusNode,
      this.textInputType,
      this.defaultText,
      this.obscureText = false,
      this.controller,
      this.functionValidate,
      this.parametersValidate,
      this.actionKeyboard = TextInputAction.next,
      this.onSubmitField,
      this.onFieldTap,
      this.onChange,
      this.prefixIcon,
      this.suffixIcon,
      this.readOnly = false,
      this.customValidation,
      this.isNumberOnly = false,
      this.isDisabled = false,
      this.labelSize,
      this.minLines,
      this.maxLines = 1,
      this.maxLength,
      this.typographyToken = TypographyToken.text16})
      : super(key: key);

  @override
  _TextFieldOutlineWidgetState createState() => _TextFieldOutlineWidgetState();
}

class _TextFieldOutlineWidgetState extends State<TextFieldOutlineWidget> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      enabled: !widget.isDisabled,
      toolbarOptions: const ToolbarOptions(
        paste: true,
        cut: true,
        copy: true,
        selectAll: true,
      ),
      onChanged: (value) {
        setState(() {
          if (widget.onChange != null) widget.onChange!(value);
        });
      },
      inputFormatters: widget.isNumberOnly
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      cursorColor: AppThemes.primarySwatch,
      obscureText: _isObscure,
      keyboardType: widget.textInputType,
      textInputAction: widget.actionKeyboard,
      focusNode: widget.isDisabled ? null : widget.focusNode,
      readOnly: widget.readOnly,
      textAlignVertical: TextAlignVertical.bottom,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines,
      style: TextStyle(
        fontSize: widget.typographyToken?.fontSize ?? TypographyToken.text12.fontSize,
        fontFamily: widget.typographyToken?.fontFamily,
        fontStyle: FontStyle.normal,
      ),
      initialValue: widget.defaultText,
      decoration: InputDecoration(
          counterText: '',
          isDense: true,
          labelText: widget.labelText,
          prefixText: widget.prefixText,
          hintText: widget.hintText,
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 24.0,
                  ))
              : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          errorMaxLines: 2,
          filled: widget.isDisabled,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0))),
      controller: widget.controller,
      validator: (value) {
        if (widget.functionValidate != null) {
          String resultValidate =
              widget.functionValidate!(value, widget.parametersValidate);
          if (resultValidate != null) {
            return resultValidate;
          }
        } else if (widget.customValidation != null) {
          String customResult = widget.customValidation!(value);
          if (customResult != null) {
            return customResult;
          }
        }
        return null;
      },
      onFieldSubmitted: (value) {
        setState(() {
          if (widget.onSubmitField != null) widget.onSubmitField!();
        });
      },
      onTap: widget.isDisabled
          ? null
          : () {
              setState(() {
                if (widget.onFieldTap != null) widget.onFieldTap?.call();
              });
            },
    );
  }
}
