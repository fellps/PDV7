import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ticket_not_found_model.dart';
export 'ticket_not_found_model.dart';

class TicketNotFoundWidget extends StatefulWidget {
  const TicketNotFoundWidget({super.key});

  @override
  State<TicketNotFoundWidget> createState() => _TicketNotFoundWidgetState();
}

class _TicketNotFoundWidgetState extends State<TicketNotFoundWidget> {
  late TicketNotFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketNotFoundModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/notFound.png',
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.contain,
                alignment: const Alignment(0.0, 0.0),
              ),
            ),
          ),
        ),
        Text(
          'Oops, nenhum ingresso encontrado..',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w300,
              ),
        ),
      ],
    );
  }
}
