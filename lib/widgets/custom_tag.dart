import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  const CustomTag(
      {super.key, required this.backgroundColor, required this.children});
  final Color backgroundColor;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
