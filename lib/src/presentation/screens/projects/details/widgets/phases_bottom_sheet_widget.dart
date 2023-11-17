import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/domain/entities/project/details_phase.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:flutter/material.dart';

class PhasesBottomSheetWidget extends StatelessWidget {
  final List<DetailsPhase> phases;

  const PhasesBottomSheetWidget({
    Key? key,
    required this.phases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => _divider(),
      itemCount: phases.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pop(context, {
            "selectedId" : phases[index].id ?? "",
          });
        },
        child: Text(
          phases[index].name ?? "",
          style: Theme.of(context).textTheme.headlineMedium,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _divider() => const Divider(
        color: ColorSchema.gray,
        thickness: 0.2,
      );
}
