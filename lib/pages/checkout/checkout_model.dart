import '/components/custom_count_controller/custom_count_controller_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for CustomCountController dynamic component.
  late FlutterFlowDynamicModels<CustomCountControllerModel>
      customCountControllerModels;

  @override
  void initState(BuildContext context) {
    customCountControllerModels =
        FlutterFlowDynamicModels(() => CustomCountControllerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customCountControllerModels.dispose();
  }
}
