import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for operator widget.
  FocusNode? operatorFocusNode;
  TextEditingController? operatorTextController;
  String? Function(BuildContext, String?)? operatorTextControllerValidator;
  String? _operatorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O operador é obrigatório';
    }

    if (val.length < 5) {
      return 'O email informado é muito curto';
    }
    if (val.length > 255) {
      return 'O limite do campo é de 255 caracteres';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Informe um email válido';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'A senha é obrigatória';
    }

    if (val.length > 255) {
      return 'O limite do campo é de 255 caracteres';
    }

    return null;
  }

  // State field(s) for pos widget.
  FocusNode? posFocusNode;
  TextEditingController? posTextController;
  String? Function(BuildContext, String?)? posTextControllerValidator;
  // Stores action output result for [Custom Action - deviceIMEIAction] action in pos widget.
  String? serial;
  // State field(s) for terminal widget.
  FocusNode? terminalFocusNode;
  TextEditingController? terminalTextController;
  String? Function(BuildContext, String?)? terminalTextControllerValidator;
  // Stores action output result for [Backend Call - API (Login and retrieve an authentication token)] action in Button widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {
    operatorTextControllerValidator = _operatorTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    operatorFocusNode?.dispose();
    operatorTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    posFocusNode?.dispose();
    posTextController?.dispose();

    terminalFocusNode?.dispose();
    terminalTextController?.dispose();
  }
}
