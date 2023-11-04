import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  final String name;
  final int cureentIndex;
  final int activeTabIndex;
  const TabWidget({
    super.key,
    required this.name,
    required this.cureentIndex,
    required this.activeTabIndex,
  });

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: widget.activeTabIndex == widget.cureentIndex
            ? Colors.transparent
            : const Color(0xfff2f2f2),
      ),
      child: Text(
        widget.name,
      ),
    );
  }
}
