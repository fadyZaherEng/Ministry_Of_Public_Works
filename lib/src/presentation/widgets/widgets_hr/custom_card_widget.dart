import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final List<Widget> widget;

  const CustomCardWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
            color: ColorSchema.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 24,
                spreadRadius: 0,
                color: Color.fromRGBO(23, 43, 77, 0.16),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: widget.map((e) => e).toList(),
          ),
        ),
      ),
    );
  }
}
