import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/presentation/widgets/custom_radio_list_tile_widget.dart';
import 'package:flutter/material.dart';

class SortBottomSheetWidget extends StatelessWidget {
  final List<Sort> sorts;
  final Sort selectedSort;

  const SortBottomSheetWidget({
    Key? key,
    required this.sorts,
    required this.selectedSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => _divider(),
      itemCount: sorts.length,
      itemBuilder: (context, index) => CustomRadioListTileWidget(
        title: sorts[index].name,
        id: sorts[index].id,
        imagePath: sorts[index].imagePath,
        groupValue: selectedSort.id,
        onChange: (value) {
          Navigator.pop(context, sorts[index]);
        },
      ),
    );
  }

  Widget _divider() => const Divider(
        color: ColorSchema.gray,
        thickness: 0.2,
      );
}
