import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_chat_model.dart';
export 'empty_chat_model.dart';

class EmptyChatWidget extends StatefulWidget {
  const EmptyChatWidget({super.key});

  @override
  State<EmptyChatWidget> createState() => _EmptyChatWidgetState();
}

class _EmptyChatWidgetState extends State<EmptyChatWidget> {
  late EmptyChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/i_want_an_image_signifying_that_there.jpeg',
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
