import 'dart:io';

import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/widgets/widgets_hr/custom_text_field_with_suffix_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTimeTextFieldWithLabelWidget extends StatefulWidget {
  final void Function(String value) pickTime;
  final Function() deleteTime;
  final String title;
  final GlobalKey globalKey;
  final String? errorMessage;
  final String label;
  final bool valueComingFromApi;
  final String value;
  final TextEditingController? controller;

  const CustomTimeTextFieldWithLabelWidget({
    Key? key,
    required this.pickTime,
    required this.deleteTime,
    required this.title,
    required this.globalKey,
    this.errorMessage,
    this.label = '',
    this.valueComingFromApi = false,
    this.value = '',
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTimeTextFieldWithLabelWidget> createState() =>
      _CustomTimeTextFieldWithLabelWidgetState();
}

class _CustomTimeTextFieldWithLabelWidgetState
    extends State<CustomTimeTextFieldWithLabelWidget> {
  TimeOfDay? selectedTime;
  TimeOfDay? dateSelected;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    widget.controller != null ? controller = widget.controller! : null;
    widget.value.isNotEmpty ? controller.text = widget.value : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.globalKey,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorSchema.black),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              child: CustomTextFieldWithSuffixIconWidget(
                controller: controller,
                labelTitle: widget.label,
                onTap: () {
                  widget.valueComingFromApi ? () {} : selectTime();
                },
                suffixIcon: selectedTime == null || controller.text == ""
                    ? SvgPicture.asset(
                        ImagePaths.tenderDate,
                        fit: BoxFit.scaleDown,
                        matchTextDirection: true,
                      )
                    : InkWell(
                        onTap: () {
                          widget.deleteTime();
                          selectedTime = null;
                          controller.text = "";
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          ImagePaths.close,
                          fit: BoxFit.scaleDown,
                          matchTextDirection: true,
                        ),
                      ),
                isReadOnly: true,
                errorMessage: widget.errorMessage,
                onChanged: (String value) {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  void selectTime() {
    if (Platform.isAndroid) {
      androidTimePicker(
        context: context,
        selectedTime: selectedTime,
        onSelectTime: (time) {
          if (time == null) return;
          controller.text = _formatTimeOfDay(time);
          widget.pickTime(controller.text);
          selectedTime = time;
          setState(() {});
        },
      );
    } else {
      iosTimePicker(
        context: context,
        selectedTime: selectedTime,
        onChange: (time) {
          selectedTime = time;
        },
        onCancel: () {
          Navigator.of(context).pop();
        },
        onDone: () {
          if (selectedTime != null) {
            selectedTime = dateSelected;
          } else {
            selectedTime = TimeOfDay.now();
            dateSelected = selectedTime;
          }
          Navigator.of(context).pop();
          controller.text = selectedTime?.format(context) ?? '';
          widget.pickTime(controller.text);
        },
      );
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}
