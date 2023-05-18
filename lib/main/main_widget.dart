import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F5F8),
        appBar: AppBar(
          backgroundColor: Color(0xFFF1F5F8),
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Color(0xFF646262),
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 30.0,
              fillColor: Color(0xFFCBCBCB),
              icon: Icon(
                Icons.directions_outlined,
                color: Color(0xFF646262),
                size: 30.0,
              ),
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent(true);
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamedAuth(
                  'Login',
                  mounted,
                  ignoreRedirect: true,
                );
              },
            ),
          ),
          title: Text(
            'Invité(e)s',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Color(0xFF646262),
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 55.0,
                  fillColor: Color(0xFFCBCBCB),
                  icon: Icon(
                    Icons.add_box,
                    color: Color(0xFF646262),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('CreatePerson');
                  },
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Liste des plats apportées par chaque familles',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF57636C),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: PagedListView<DocumentSnapshot<Object?>?, PlatsRecord>(
                  pagingController: () {
                    final Query<Object?> Function(Query<Object?>) queryBuilder =
                        (platsRecord) => platsRecord;
                    if (_model.pagingController != null) {
                      final query = queryBuilder(PlatsRecord.collection);
                      if (query != _model.pagingQuery) {
                        // The query has changed
                        _model.pagingQuery = query;
                        _model.streamSubscriptions.forEach((s) => s?.cancel());
                        _model.streamSubscriptions.clear();
                        _model.pagingController!.refresh();
                      }
                      return _model.pagingController!;
                    }

                    _model.pagingController =
                        PagingController(firstPageKey: null);
                    _model.pagingQuery = queryBuilder(PlatsRecord.collection);
                    _model.pagingController!
                        .addPageRequestListener((nextPageMarker) {
                      queryPlatsRecordPage(
                        queryBuilder: (platsRecord) => platsRecord,
                        nextPageMarker: nextPageMarker,
                        pageSize: 25,
                        isStream: true,
                      ).then((page) {
                        _model.pagingController!.appendPage(
                          page.data,
                          page.nextPageMarker,
                        );
                        final streamSubscription =
                            page.dataStream?.listen((data) {
                          data.forEach((item) {
                            final itemIndexes = _model
                                .pagingController!.itemList!
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            final index = itemIndexes[item.reference.id];
                            final items = _model.pagingController!.itemList!;
                            if (index != null) {
                              items.replaceRange(index, index + 1, [item]);
                              _model.pagingController!.itemList = {
                                for (var item in items) item.reference: item
                              }.values.toList();
                            }
                          });
                          setState(() {});
                        });
                        _model.streamSubscriptions.add(streamSubscription);
                      });
                    });
                    return _model.pagingController!;
                  }(),
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  builderDelegate: PagedChildBuilderDelegate<PlatsRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) => Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),

                    itemBuilder: (context, _, listViewIndex) {
                      final listViewPlatsRecord =
                          _model.pagingController!.itemList![listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x411D2429),
                                offset: Offset(0.0, 1.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 1.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Image.network(
                                      'https://espacemuni.org/wp-content/uploads/2023/02/Logo_FDS_2023-650x750.png',
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 4.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewPlatsRecord.name!,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF0F1113),
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 8.0, 0.0),
                                          child: AutoSizeText(
                                            listViewPlatsRecord.description!
                                                .maybeHandleOverflow(
                                              maxChars: 70,
                                              replacement: '…',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF57636C),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'ModifyPerson',
                                            queryParams: {
                                              'nameremote': serializeParam(
                                                listViewPlatsRecord.name,
                                                ParamType.String,
                                              ),
                                              'foodremote': serializeParam(
                                                listViewPlatsRecord.description,
                                                ParamType.String,
                                              ),
                                              'countremote': serializeParam(
                                                listViewPlatsRecord.who,
                                                ParamType.int,
                                              ),
                                              'ref': serializeParam(
                                                listViewPlatsRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Icon(
                                          Icons.chevron_right_rounded,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 4.0, 8.0),
                                      child: Text(
                                        listViewPlatsRecord.who!.toString(),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
