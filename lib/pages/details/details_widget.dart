import '/backend/backend.dart';
import '/components/details_sheet/details_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  /// When the user clicks on a task, this page displays the details about this
  /// task.
  const DetailsWidget({
    super.key,
    required this.taskDoc,
    required this.taskDocRef,
  });

  final TasksRecord? taskDoc;
  final DocumentReference? taskDocRef;

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: wrapWithModel(
              model: _model.detailsSheetModel,
              updateCallback: () => setState(() {}),
              child: DetailsSheetWidget(
                taskDoc: widget.taskDoc!,
                taskDocRef: widget.taskDocRef!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
