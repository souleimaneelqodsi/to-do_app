import '/components/details_sheet/details_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'details_widget.dart' show DetailsWidget;
import 'package:flutter/material.dart';

class DetailsModel extends FlutterFlowModel<DetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for detailsSheet component.
  late DetailsSheetModel detailsSheetModel;

  @override
  void initState(BuildContext context) {
    detailsSheetModel = createModel(context, () => DetailsSheetModel());
  }

  @override
  void dispose() {
    detailsSheetModel.dispose();
  }
}
