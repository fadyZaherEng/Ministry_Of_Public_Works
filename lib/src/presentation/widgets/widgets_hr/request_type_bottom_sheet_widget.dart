import 'package:flutter/material.dart';
import 'package:aim/generated/l10n.dart';

class RequestTypeBottomSheetWidget extends StatefulWidget {
  final List<RequestType> requestTypes;
  final RequestType requestType;

  const RequestTypeBottomSheetWidget({
    super.key,
    required this.requestTypes,
    required this.requestType,
  });

  @override
  State<RequestTypeBottomSheetWidget> createState() =>
      _RequestTypeBottomSheetWidgetState();
}

class _RequestTypeBottomSheetWidgetState
    extends State<RequestTypeBottomSheetWidget> {
  RequestType _leaveType = RequestType(id: 0, name: '');

  @override
  void initState() {
    _leaveType = widget.requestType;
    for (var element in widget.requestTypes) {
      if (_leaveType.id == element.id) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.requestTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _onTap(widget.requestTypes[index]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRadioButtonWidget(
                              isSelected: widget.requestTypes[index].isSelected,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              widget.requestTypes[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: ColorSchemes.semiBlack,
                                  ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                              Divider(color: ColorSchemes.semiBlack, height: 1),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        CustomGradientButtonWidget(
            text: S.of(context).done, onTap: () => _onTapDone()),
        const SizedBox(height: 10),
      ],
    );
  }

  void _onTap(RequestType leaveType) {
    for (var element in widget.requestTypes) {
      setState(() {
        if (element.id == leaveType.id) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
    }
  }

  void _onTapDone() {
    for (var element in widget.requestTypes) {
      if (element.isSelected == true) {
        _leaveType = element;
      }
    }
    if (_leaveType.id != 0) {
      Navigator.pop(context, _leaveType);
    } else {
      Navigator.pop(context);
    }
  }
}
