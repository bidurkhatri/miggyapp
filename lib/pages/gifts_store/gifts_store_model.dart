import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'gifts_store_widget.dart' show GiftsStoreWidget;
import 'package:flutter/material.dart';

class GiftsStoreModel extends FlutterFlowModel<GiftsStoreWidget> {
  ///  Local state fields for this page.

  bool onSearch = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  List<GiftsStoreRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
