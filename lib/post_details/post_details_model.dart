import '/components/comment_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_details_widget.dart' show PostDetailsWidget;
import 'package:flutter/material.dart';

class PostDetailsModel extends FlutterFlowModel<PostDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Post component.
  late PostModel postModel;
  // Models for comment dynamic component.
  late FlutterFlowDynamicModels<CommentModel> commentModels;
  // State field(s) for CommentField widget.
  FocusNode? commentFieldFocusNode;
  TextEditingController? commentFieldTextController;
  String? Function(BuildContext, String?)? commentFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    postModel = createModel(context, () => PostModel());
    commentModels = FlutterFlowDynamicModels(() => CommentModel());
  }

  @override
  void dispose() {
    postModel.dispose();
    commentModels.dispose();
    commentFieldFocusNode?.dispose();
    commentFieldTextController?.dispose();
  }
}
