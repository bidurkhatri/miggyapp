import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'helpsupport_widget.dart' show HelpsupportWidget;
import 'package:flutter/material.dart';

class HelpsupportModel extends FlutterFlowModel<HelpsupportWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for IssueCategory widget.
  String? issueCategoryValue;
  FormFieldController<String>? issueCategoryValueController;
  // State field(s) for TextMessage widget.
  FocusNode? textMessageFocusNode;
  TextEditingController? textMessageTextController;
  String? Function(BuildContext, String?)? textMessageTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textMessageFocusNode?.dispose();
    textMessageTextController?.dispose();
  }
}
