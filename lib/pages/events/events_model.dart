import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'events_widget.dart' show EventsWidget;
import 'package:flutter/material.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  Local state fields for this page.

  String txtFieldEvent = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchBarEvent widget.
  FocusNode? searchBarEventFocusNode;
  TextEditingController? searchBarEventController;
  String? Function(BuildContext, String?)? searchBarEventControllerValidator;

  /// Query cache managers for this widget.

  final _getEventsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getEvents({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getEventsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetEventsCache() => _getEventsManager.clear();
  void clearGetEventsCacheKey(String? uniqueKey) =>
      _getEventsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarEventFocusNode?.dispose();
    searchBarEventController?.dispose();

    /// Dispose query cache managers for this widget.

    clearGetEventsCache();
  }
}
