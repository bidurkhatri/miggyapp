import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'photo_preview_model.dart';
export 'photo_preview_model.dart';

class PhotoPreviewWidget extends StatefulWidget {
  const PhotoPreviewWidget({
    super.key,
    required this.photo,
  });

  final String? photo;

  @override
  State<PhotoPreviewWidget> createState() => _PhotoPreviewWidgetState();
}

class _PhotoPreviewWidgetState extends State<PhotoPreviewWidget> {
  late PhotoPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoPreviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FlutterFlowIconButton(
          borderRadius: 8.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.clear_rounded,
            color: FlutterFlowTheme.of(context).error,
            size: 24.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            valueOrDefault<String>(
              widget.photo,
              'https://picsum.photos/seed/747/600',
            ),
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: MediaQuery.sizeOf(context).height * 0.4,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
