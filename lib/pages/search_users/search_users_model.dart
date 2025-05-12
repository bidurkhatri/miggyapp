import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_users_widget.dart' show SearchUsersWidget;
import 'package:flutter/material.dart';

class SearchUsersModel extends FlutterFlowModel<SearchUsersWidget> {
  ///  Local state fields for this page.

  bool searchOn = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Searchbar widget.
  FocusNode? searchbarFocusNode;
  TextEditingController? searchbarTextController;
  String? Function(BuildContext, String?)? searchbarTextControllerValidator;
  List<UserProfileRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchbarFocusNode?.dispose();
    searchbarTextController?.dispose();
  }
}
