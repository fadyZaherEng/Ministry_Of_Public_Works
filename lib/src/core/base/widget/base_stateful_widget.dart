// ignore_for_file: no_logic_in_create_state

import 'package:aim/src/core/base/manager/loading/loading_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  final Color materialColor;

  const BaseStatefulWidget({
    Key? key,
    this.materialColor = Colors.white,
  }) : super(key: key);

  @override
  BaseState createState() {
    return baseCreateState();
  }

  BaseState baseCreateState();
}

abstract class BaseState<W extends BaseStatefulWidget> extends State<W>
    with LoadingManager {
  @override
  Widget build(BuildContext context) {
    return baseWidget();
  }

  Widget baseWidget() {
    return Material(
      color: widget.materialColor,
      child: Stack(
        fit: StackFit.expand,
        children: [baseBuild(context), loadingManagerWidget()],
      ),
    );
  }

  void changeState() {
    setState(() {});
  }

  @override
  void runChangeState() {
    changeState();
  }

  Widget baseBuild(BuildContext context);
}
