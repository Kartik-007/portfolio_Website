
import 'dart:async';
import 'package:flutter/material.dart';

class CustomTypewriterText extends StatefulWidget {
  const CustomTypewriterText({Key? key}) : super(key: key);

  @override
  State<CustomTypewriterText> createState() => _CustomTypewriterTextState();
}

class _CustomTypewriterTextState extends State<CustomTypewriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final String _text1 = "Hello, ";
  final String _text2 = "Kartik";
  final String _text3 = " here!";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: (_text1.length + _text2.length + _text3.length).toDouble()).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayText = '';
    String coloredText = '';
    if (_animation.value < _text1.length) {
      displayText = _text1.substring(0, _animation.value.toInt());
      coloredText = '';
    } else if (_animation.value < _text1.length + _text2.length) {
      displayText = _text1;
      coloredText = _text2.substring(0, (_animation.value - _text1.length).toInt());
    } else {
      displayText = _text1;
      coloredText = _text2;
    }

    String remainingText = '';
    if (_animation.value > _text1.length + _text2.length) {
      remainingText = _text3.substring(0, (_animation.value - _text1.length - _text2.length).toInt());
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: displayText,
            style: TextStyle(fontSize: 70, color: Color.fromARGB(255, 204, 214, 246)),
          ),
          TextSpan(
            text: coloredText,
            style: TextStyle(fontSize: 70, color: Color.fromARGB(255, 96, 242, 212), fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: remainingText,
            style: TextStyle(fontSize: 70, color: Color.fromARGB(255, 204, 214, 246)),
          ),
        ],
      ),
    );
  }
}