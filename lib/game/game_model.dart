import '/backend/backend.dart';
import '/components/messages_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'game_widget.dart' show GameWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class GameModel extends FlutterFlowModel<GameWidget> {
  ///  Local state fields for this page.

  bool showBar = false;

  bool moreThan1 = true;

  bool count = false;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - Create Document] action in Game widget.
  JackpotRoomsRecord? newGameActive;
  // Models for messages dynamic component.
  late FlutterFlowDynamicModels<MessagesModel> messagesModels;
  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;
  // State field(s) for TimerDown widget.
  final timerDownInitialTimeMs = 30000;
  int timerDownMilliseconds = 30000;
  String timerDownValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerDownController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    messagesModels = FlutterFlowDynamicModels(() => MessagesModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    messagesModels.dispose();
    messageFocusNode?.dispose();
    messageTextController?.dispose();

    timerDownController.dispose();
  }
}
