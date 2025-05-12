import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'interest_page_model.dart';
export 'interest_page_model.dart';

class InterestPageWidget extends StatefulWidget {
  const InterestPageWidget({super.key});

  static String routeName = 'InterestPage';
  static String routePath = '/interestPage';

  @override
  State<InterestPageWidget> createState() => _InterestPageWidgetState();
}

class _InterestPageWidgetState extends State<InterestPageWidget> {
  late InterestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (Theme.of(context).brightness == Brightness.light)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/miggy_Logo.png',
                          width: 200.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (Theme.of(context).brightness == Brightness.dark)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Dark_Miggy.jpg',
                          width: 200.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'p5r0gjmw' /* Choose your interests */,
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'w1ppk3i9' /* Cricket */,
                                    ),
                                    Icons.sports_baseball_rounded),
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'yy6d1197' /* Ludo */,
                                    ),
                                    Icons.sports_baseball),
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      '6cgjam3b' /* Soccer */,
                                    ),
                                    Icons.sports_baseball_rounded),
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'l0hnfd9f' /* Tenis */,
                                    ),
                                    Icons.sports_baseball_sharp),
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'beu9dzhs' /* Chess */,
                                    ),
                                    Icons.sports_baseball_rounded),
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'njgkon0i' /* Volleyball */,
                                    ),
                                    Icons.sports_baseball),
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'wag3z6w0' /* BasketBall */,
                                    ),
                                    Icons.sports_baseball_rounded)
                              ],
                              onChanged: (val) => safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).info,
                                iconSize: 16.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                elevation: 3.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 16.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                elevation: 3.0,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ],
                      ),
                    ]
                        .divide(SizedBox(height: 20.0))
                        .addToEnd(SizedBox(height: 20.0)),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'user_interests':
                              FieldValue.arrayUnion([_model.choiceChipsValue]),
                        },
                      ),
                    });

                    await currentUserReference!
                        .update(createUserProfileRecordData(
                      lastLoggedIn: getCurrentTimestamp,
                    ));

                    context.pushNamed(HomeWidget.routeName);
                  },
                  text: FFLocalizations.of(context).getText(
                    '8wnn4ycf' /* NEXT */,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 30.0))
                  .addToStart(SizedBox(height: 50.0))
                  .addToEnd(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
