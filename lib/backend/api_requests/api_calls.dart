import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI ChatGPT Copy Group Code

class OpenAIChatGPTCopyGroup {
  static String getBaseUrl() => 'https://api.openai.com/v1';
  static Map<String, String> headers = {};
  static SendFullPromptFunctionsCall sendFullPromptFunctionsCall =
      SendFullPromptFunctionsCall();
  static SendFullPromptCopyCall sendFullPromptCopyCall =
      SendFullPromptCopyCall();
}

class SendFullPromptFunctionsCall {
  Future<ApiCallResponse> call({
    dynamic promptJson,
    String? apiKey =
        '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',
    dynamic functionsJson,
    dynamic functionCallJson,
  }) async {
    final baseUrl = OpenAIChatGPTCopyGroup.getBaseUrl();

    final prompt = _serializeJson(promptJson);
    final functions = _serializeJson(functionsJson);
    final functionCall = _serializeJson(functionCallJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-4o-mini",
  "messages": $prompt,
  "functions": $functions,
  "function_call": $functionCall
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt Functions',
      apiUrl: '$baseUrl/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? createdTimestamp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.role''',
      ));
  String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.function_call.arguments''',
      ));
}

class SendFullPromptCopyCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = OpenAIChatGPTCopyGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt Copy',
      apiUrl: '$baseUrl/chat/completions',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OpenAI ChatGPT Copy Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
