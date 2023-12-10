// import 'package:flutter/material.dart';
// import 'package:aim/generated/l10n.dart';
//
// class CustomRadioButtonsWidget extends StatefulWidget {
//   final Function(SingleSelectionModel singleSelectionModel) onSelectAction;
//
//   const CustomRadioButtonsWidget({
//     super.key,
//     required this.onSelectAction,
//   });
//
//   @override
//   State<CustomRadioButtonsWidget> createState() =>
//       _CustomRadioButtonsWidgetState();
// }
//
// class _CustomRadioButtonsWidgetState extends State<CustomRadioButtonsWidget> {
//   final List<SingleSelectionModel> _singleSelection = [
//     SingleSelectionModel(id: 0, text: S.current.payroll, isSelected: true),
//     SingleSelectionModel(id: 1, text: S.current.settlement),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: _singleSelection
//           .map((e) => CustomButtonWithPrefixWidget(
//                 onTap: () {
//                   _onTap(e.id);
//                   widget.onSelectAction(e);
//                 },
//                 buttonTitle: e.text,
//                 isSelected: e.isSelected,
//               ))
//           .toList(),
//     );
//   }
//
//   void _onTap(int id) {
//     for (var element in _singleSelection) {
//       setState(() {
//         if (id == element.id) {
//           element.isSelected = true;
//         } else {
//           element.isSelected = false;
//         }
//       });
//     }
//   }
// }
