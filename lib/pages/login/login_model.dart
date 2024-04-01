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
  TextEditingController? operatorController;
  String? Function(BuildContext, String?)? operatorControllerValidator;
  String? _operatorControllerValidator(BuildContext context, String? val) {
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
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
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
  TextEditingController? posController;
  String? Function(BuildContext, String?)? posControllerValidator;
  // Stores action output result for [Custom Action - deviceIMEIAction] action in pos widget.
  String? serial;
  // State field(s) for terminal widget.
  FocusNode? terminalFocusNode;
  TextEditingController? terminalController;
  String? Function(BuildContext, String?)? terminalControllerValidator;
  // Stores action output result for [Backend Call - API (Login and retrieve an authentication token)] action in Button widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {
    operatorControllerValidator = _operatorControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    operatorFocusNode?.dispose();
    operatorController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    posFocusNode?.dispose();
    posController?.dispose();

    terminalFocusNode?.dispose();
    terminalController?.dispose();
  }
}
