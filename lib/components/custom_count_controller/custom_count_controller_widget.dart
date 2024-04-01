import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'custom_count_controller_model.dart';
export 'custom_count_controller_model.dart';

class CustomCountControllerWidget extends StatefulWidget {
  const CustomCountControllerWidget({
    super.key,
    required this.index,
  });

  final int? index;

  @override
  State<CustomCountControllerWidget> createState() =>
      _CustomCountControllerWidgetState();
}

class _CustomCountControllerWidgetState
    extends State<CustomCountControllerWidget> {
  late CustomCountControllerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomCountControllerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        width: 140.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
        ),
        child: FlutterFlowCountController(
          decrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.minus,
            color: enabled
                ? FlutterFlowTheme.of(context).secondaryText
                : FlutterFlowTheme.of(context).alternate,
            size: 20.0,
          ),
          incrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.plus,
            color: enabled
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).alternate,
            size: 20.0,
          ),
          countBuilder: (count) => Text(
            count.toString(),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          count: _model.countControllerValue ??= valueOrDefault<int>(
            FFAppState().Cart[widget.index!].totalItems,
            1,
          ),
          updateCount: (count) async {
            setState(() => _model.countControllerValue = count);
            setState(() {
              FFAppState().updateCartAtIndex(
                widget.index!,
                (e) => e
                  ..totalItems = valueOrDefault<int>(
                    _model.countControllerValue,
                    1,
                  ),
              );
            });
            setState(() {
              FFAppState().CartTotal =
                  functions.updateTotal(FFAppState().Cart.toList());
            });
          },
          stepSize: 1,
          minimum: 1,
          maximum: 999,
        ),
      ),
    );
  }
}
