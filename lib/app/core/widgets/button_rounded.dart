import 'package:flutter/material.dart';

class ButtonRounded extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  final MaterialStateProperty<Color>? backgroundColor;
  final MaterialStateProperty<Color>? textColor;
  final bool? disabled;

  const ButtonRounded(this.text,
      {Key? key,
      this.onPressed,
      this.disabled = false,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  @override
  State<ButtonRounded> createState() => _ButtonRoundedState();
}

class _ButtonRoundedState extends State<ButtonRounded> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: widget.disabled == false ? widget.onPressed ?? null : null,
        autofocus: true,
        style: ButtonStyle(
            foregroundColor:
                widget.textColor ?? MaterialStateProperty.all(Colors.white),
            backgroundColor: widget.backgroundColor ??
                MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.isNotEmpty &&
                      !states.contains(MaterialState.disabled)) {
                    return Color(0xFF271019);
                  }

                  return Color(0xFF8A8A8A);
                }),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 16, horizontal: 10)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(46.0))),
            side: MaterialStateProperty.all(BorderSide(
                color: Colors.white, width: 1.0, style: BorderStyle.none))),
        child: Text(widget.text.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 2
            )),
      ),
    );
  }
}
