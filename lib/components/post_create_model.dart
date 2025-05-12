import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_create_widget.dart' show PostCreateWidget;
import 'package:flutter/material.dart';

class PostCreateModel extends FlutterFlowModel<PostCreateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PostField widget.
  FocusNode? postFieldFocusNode;
  TextEditingController? postFieldTextController;
  String? Function(BuildContext, String?)? postFieldTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostsRecord? postCreated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    postFieldFocusNode?.dispose();
    postFieldTextController?.dispose();
  }
}
