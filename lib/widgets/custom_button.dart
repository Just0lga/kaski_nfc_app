import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonOnTap,
  });

  final String buttonText;
  final Color buttonColor;
  final GestureTapCallback? buttonOnTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: GestureDetector(
        onTap: widget.buttonOnTap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: Container(
          margin: EdgeInsets.only(bottom: height * 0.08),

          width: width * 0.7,
          height: height * 0.075,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _isPressed
                ? widget.buttonColor.withOpacity(0.6)
                : widget.buttonColor,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
