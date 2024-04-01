import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'product_list_widget.dart' show ProductListWidget;
import 'package:flutter/material.dart';

class ProductListModel extends FlutterFlowModel<ProductListWidget> {
  ///  Local state fields for this page.

  String txtFieldTicket = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Query cache managers for this widget.

  final _getProductsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getProducts({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getProductsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetProductsCache() => _getProductsManager.clear();
  void clearGetProductsCacheKey(String? uniqueKey) =>
      _getProductsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();

    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearGetProductsCache();
  }
}
