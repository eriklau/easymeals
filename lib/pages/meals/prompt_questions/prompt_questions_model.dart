import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'prompt_questions_widget.dart' show PromptQuestionsWidget;
import 'package:flutter/material.dart';

class PromptQuestionsModel extends FlutterFlowModel<PromptQuestionsWidget> {
  ///  Local state fields for this page.

  dynamic userInput;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController3;
  String? get choiceChipsValue3 =>
      choiceChipsValueController3?.value?.firstOrNull;
  set choiceChipsValue3(String? val) =>
      choiceChipsValueController3?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (Send Full Prompt Functions)] action in CreateRecipe widget.
  ApiCallResponse? apiResultf00;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();
  }
}
