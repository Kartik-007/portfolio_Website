import 'package:flutter/material.dart';
class BlinkingCursorText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final int cursorWidth;
  final Color cursorColor;

  BlinkingCursorText({
    Key? key,
    required this.text,
    this.textStyle,
    this.cursorWidth = 6,
    this.cursorColor = Colors.black,
  }) : super(key: key);

  @override
  _BlinkingCursorTextState createState() => _BlinkingCursorTextState();
}

class _BlinkingCursorTextState extends State<BlinkingCursorText> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.text,
          style: widget.textStyle,
        ),
        FadeTransition(
          opacity: _animation,
          child: Container(
            height: 70,
            width: widget.cursorWidth.toDouble(),
            color: widget.cursorColor,
          ),
        ),
      ],
    );
  }
}
