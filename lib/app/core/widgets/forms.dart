import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String labelText;
  bool isPassword;
  bool showPassword;
  String? initialValue;

  String? Function(String?)? onValidation;
  Function(String?)? onSaved;

  AppTextFormField(this.labelText,
      {Key? key,
      this.showPassword = false,
      this.isPassword = false,
      this.onSaved,
      this.onValidation,
      this.initialValue = ""})
      : super(key: key);

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
      obscureText: widget.showPassword,
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 250),
      decoration: InputDecoration(
        labelText: this.widget.labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: this.widget.isPassword
            ? IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
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
