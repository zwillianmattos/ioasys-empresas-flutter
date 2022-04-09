import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String labelText;
  bool isPassword;
  bool showPassword;
  String? initialValue;
  TextInputType? keyboardType;

  String? Function(String?)? onValidation;
  Function(String?)? onSaved;

  AppTextFormField(
    this.labelText, {
    Key? key,
    this.showPassword = false,
    this.isPassword = false,
    this.onSaved,
    this.onValidation,
    this.initialValue = "",
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      initialValue: widget.initialValue,
      onSaved: this.widget.onSaved,
      validator: this.widget.onValidation,
      obscureText: this.widget.isPassword ? widget.showPassword : false,
      keyboardType: widget.keyboardType,
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 250),
      decoration: InputDecoration(
        labelText: this.widget.labelText,
        labelStyle: TextStyle(
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: this.widget.isPassword
            ? IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                ),
                onPressed: () {
                  setState(() {
                    widget.showPassword = !widget.showPassword;
                  });
                },
              )
            : null,
      ),
    );
  }
}
