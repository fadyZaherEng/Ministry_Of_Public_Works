import 'package:aim/generated/l10n.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class DescriptionBottomSheet extends StatelessWidget {
  final String description;

  const DescriptionBottomSheet({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const SizedBox(height: 32),
        ButtonWidget(
          onTap: () {
            Navigator.pop(context);
          },
          buttonTitle: S.of(context).close,
        )
      ],
    );
  }
}
