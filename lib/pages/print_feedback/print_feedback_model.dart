import '/flutter_flow/flutter_flow_util.dart';
import 'print_feedback_widget.dart' show PrintFeedbackWidget;
import 'package:flutter/material.dart';

class PrintFeedbackModel extends FlutterFlowModel<PrintFeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - printAction] action in Button widget.
  String? printResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
