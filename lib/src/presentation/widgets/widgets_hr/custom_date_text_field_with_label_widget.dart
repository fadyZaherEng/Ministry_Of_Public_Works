// import 'dart:io';
//
// import 'package:aim/src/config/themes/color_scheme.dart';
// import 'package:aim/src/config/utils/android_date_picker.dart';
// import 'package:aim/src/config/utils/image_paths.dart';
// import 'package:aim/src/presentation/widgets/widgets_hr/custom_text_field_with_suffix_icon_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class CustomDateTextFieldWithLabelWidget extends StatefulWidget {
//   final void Function(String value) pickDate;
//   final Function() deleteDate;
//   final String title;
//   final GlobalKey globalKey;
//   final String? errorMassage;
//   final String label;
//   final String imagePath;
//   final bool valueComingFromApi;
//   final String value;
//   final DateTime? firstDate;
//   final TextEditingController? controller;
//   final bool readOnly;
//
//   const CustomDateTextFieldWithLabelWidget({
//     Key? key,
//     required this.pickDate,
//     required this.deleteDate,
//     required this.title,
//     required this.globalKey,
//     this.errorMassage,
//     this.imagePath = ImagePaths.dataActual,
//     this.label = '',
//     this.valueComingFromApi = false,
//     this.value = '',
//     this.firstDate,
//     this.controller,
//     this.readOnly = true,
//   }) : super(key: key);
//
//   @override
//   State<CustomDateTextFieldWithLabelWidget> createState() =>
//       _CustomDateTextFieldWithLabelWidgetState();
// }
//
// class _CustomDateTextFieldWithLabelWidgetState
//     extends State<CustomDateTextFieldWithLabelWidget> {
//   DateTime? selectedDate;
//   DateTime? dateSelected;
//
//   TextEditingController controller = TextEditingController();
//
//   @override
//   void initState() {
//     widget.controller != null ? controller = widget.controller! : null;
//     widget.value.isNotEmpty ? controller.text = widget.value : null;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       key: widget.globalKey,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.title,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium
//                   ?.copyWith(color: ColorSchema.black),
//             ),
//             const SizedBox(height: 16.0),
//             SizedBox(
//               child: CustomTextFieldWithSuffixIconWidget(
//                 controller: controller,
//                 labelTitle: widget.label,
//                 onTap: () {
//                   widget.valueComingFromApi ? () {} : selectDate();
//                 },
//                 suffixIcon: controller.text == ""
//                     ? SvgPicture.asset(
//                         widget.imagePath,
//                         fit: BoxFit.scaleDown,
//                         matchTextDirection: true,
//                       )
//                     : InkWell(
//                         onTap: () {
//                           widget.deleteDate();
//                           selectedDate = DateTime.now();
//                           controller.text = "";
//                           setState(() {});
//                         },
//                         child: SvgPicture.asset(
//                           ImagePaths.close,
//                           fit: BoxFit.scaleDown,
//                           matchTextDirection: true,
//                         ),
//                       ),
//                 isReadOnly: widget.readOnly,
//                 errorMessage: widget.errorMassage,
//                 onChanged: (String value) {},
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   void selectDate() {
//     if (Platform.isAndroid) {
//       androidDatePicker(
//         context: context,
//         firstDate: widget.firstDate ?? DateTime(1900),
//         onSelectDate: (date) {
//           if (date == null) return;
//           controller.text = date.toString().split(" ")[0];
//           widget.pickDate(controller.text);
//           selectedDate = date;
//           setState(() {});
//         },
//         selectedDate: selectedDate,
//       );
//     } else {
//       iosDatePicker(
//         context: context,
//         selectedDate: selectedDate,
//         onChange: (date) {
//           dateSelected = date;
//         },
//         onCancel: () {
//           Navigator.of(context).pop();
//         },
//         onDone: () {
//           if (selectedDate != null) {
//             selectedDate = dateSelected;
//           } else {
//             selectedDate = DateTime.now();
//             dateSelected = selectedDate;
//           }
//           Navigator.of(context).pop();
//           controller.text = selectedDate.toString().split(" ")[0];
//           widget.pickDate(controller.text);
//         },
//       );
//     }
//   }
// }
