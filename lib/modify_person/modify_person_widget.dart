import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modify_person_model.dart';
export 'modify_person_model.dart';

class ModifyPersonWidget extends StatefulWidget {
  const ModifyPersonWidget({
    Key? key,
    required this.nameremote,
    required this.foodremote,
    required this.countremote,
    required this.ref,
  }) : super(key: key);

  final String? nameremote;
  final String? foodremote;
  final int? countremote;
  final DocumentReference? ref;

  @override
  _ModifyPersonWidgetState createState() => _ModifyPersonWidgetState();
}

class _ModifyPersonWidgetState extends State<ModifyPersonWidget> {
  late ModifyPersonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModifyPersonModel());

    _model.yourNameController ??=
        TextEditingController(text: widget.nameremote);
    _model.foodController ??= TextEditingController(text: widget.foodremote);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(-0.1, -0.3),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: AutoSizeText(
                'Modifier une fiche ',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
              child: TextFormField(
                controller: _model.yourNameController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Nom de famille',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: null,
                validator:
                    _model.yourNameControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
              child: TextFormField(
                controller: _model.foodController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Nourriture apporter',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: null,
                validator: _model.foodControllerValidator.asValidator(context),
              ),
            ),
            Container(
              width: 160.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xFF9E9E9E),
                  width: 1.0,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.minus,
                  color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                  size: 20.0,
                ),
                incrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.plus,
                  color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                  size: 20.0,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                count: _model.countControllerValue ??= widget.countremote!,
                updateCount: (count) =>
                    setState(() => _model.countControllerValue = count),
                stepSize: 1,
                minimum: 0,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('MaFêtedesVoisins'),
                              content:
                                  Text('Prendre en compte vos modifications?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      if (_model.countControllerValue == 0) {
                        await widget.ref!.delete();
                      } else {
                        final platsUpdateData = createPlatsRecordData(
                          name: _model.yourNameController.text,
                          description: _model.foodController.text,
                          who: _model.countControllerValue,
                        );
                        await widget.ref!.update(platsUpdateData);
                      }

                      context.pushNamed('Main');

                      return;
                    } else {
                      context.pushNamed('Main');
                    }
                  },
                  text: 'Sauvegarder',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleMedium
                        .override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
