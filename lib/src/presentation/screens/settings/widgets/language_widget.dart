import 'package:aim/src/presentation/bloc/settings/settings_bloc.dart';
import 'package:aim/src/presentation/widgets/radio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageWidget extends StatelessWidget {
  final SupportLanguage groupValue;

  const LanguageWidget({
    Key? key,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Inside $groupValue");
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RadioButtonWidget<SupportLanguage>(
          onChanged: (value) {
            BlocProvider.of<SettingsBloc>(context)
                .add(ChangeLanguageEvent(languageCode: value.name));
          },
          groupValue: groupValue,
          value: SupportLanguage.en,
          label: 'English',
        ),
        const SizedBox(width: 16),
        RadioButtonWidget<SupportLanguage>(
          onChanged: (value) {
            BlocProvider.of<SettingsBloc>(context)
                .add(ChangeLanguageEvent(languageCode: value.name));
          },
          groupValue: groupValue,
          value: SupportLanguage.ar,
          label: 'العربية',
        ),
      ],
    );
  }
}

enum SupportLanguage { en, ar }
