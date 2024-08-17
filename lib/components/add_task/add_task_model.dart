import '/flutter_flow/flutter_flow_util.dart';
import 'add_task_widget.dart' show AddTaskWidget;
import 'package:flutter/material.dart';

class AddTaskModel extends FlutterFlowModel<AddTaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for titleTask widget.
  FocusNode? titleTaskFocusNode;
  TextEditingController? titleTaskTextController;
  String? Function(BuildContext, String?)? titleTaskTextControllerValidator;
  // State field(s) for taskDetails widget.
  FocusNode? taskDetailsFocusNode;
  TextEditingController? taskDetailsTextController;
  String? Function(BuildContext, String?)? taskDetailsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleTaskFocusNode?.dispose();
    titleTaskTextController?.dispose();

    taskDetailsFocusNode?.dispose();
    taskDetailsTextController?.dispose();
  }
}
