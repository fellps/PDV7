import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Bilheteria Digital Group Code

class BilheteriaDigitalGroup {
  static String baseUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:qkh-j3-J';
  static Map<String, String> headers = {};
  static LoginAndRetrieveAnAuthenticationTokenCall
      loginAndRetrieveAnAuthenticationTokenCall =
      LoginAndRetrieveAnAuthenticationTokenCall();
  static GetTheUserRecordBelongingToTheAuthenticationTokenCall
      getTheUserRecordBelongingToTheAuthenticationTokenCall =
      GetTheUserRecordBelongingToTheAuthenticationTokenCall();
  static SignupAndRetrieveAnAuthenticationTokenCall
      signupAndRetrieveAnAuthenticationTokenCall =
      SignupAndRetrieveAnAuthenticationTokenCall();
  static DeleteEventsRecordCall deleteEventsRecordCall =
      DeleteEventsRecordCall();
  static GetEventsRecordCall getEventsRecordCall = GetEventsRecordCall();
  static EditEventsRecordCall editEventsRecordCall = EditEventsRecordCall();
  static QueryAllEventsRecordsCall queryAllEventsRecordsCall =
      QueryAllEventsRecordsCall();
  static AddEventsRecordCall addEventsRecordCall = AddEventsRecordCall();
  static DeleteTicketsRecordCall deleteTicketsRecordCall =
      DeleteTicketsRecordCall();
  static GetTicketsRecordCall getTicketsRecordCall = GetTicketsRecordCall();
  static EditTicketsRecordCall editTicketsRecordCall = EditTicketsRecordCall();
  static QueryAllTicketsRecordsCall queryAllTicketsRecordsCall =
      QueryAllTicketsRecordsCall();
  static AddTicketsRecordCall addTicketsRecordCall = AddTicketsRecordCall();
  static DeleteUserRecordCall deleteUserRecordCall = DeleteUserRecordCall();
  static GetUserRecordCall getUserRecordCall = GetUserRecordCall();
  static EditUserRecordCall editUserRecordCall = EditUserRecordCall();
  static QueryAllUserRecordsCall queryAllUserRecordsCall =
      QueryAllUserRecordsCall();
  static AddUserRecordCall addUserRecordCall = AddUserRecordCall();
}

class LoginAndRetrieveAnAuthenticationTokenCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? terminal = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password",
  "terminal": "$terminal"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login and retrieve an authentication token',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.name''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class GetTheUserRecordBelongingToTheAuthenticationTokenCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get the user record belonging to the authentication token',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/auth/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SignupAndRetrieveAnAuthenticationTokenCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "$name",
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Signup and retrieve an authentication token',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/auth/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteEventsRecordCall {
  Future<ApiCallResponse> call({
    int? eventsId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete events record.',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/events/$eventsId',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetEventsRecordCall {
  Future<ApiCallResponse> call({
    int? eventsId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get events record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/events/$eventsId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EditEventsRecordCall {
  Future<ApiCallResponse> call({
    int? eventsId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Edit events record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/events/$eventsId',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class QueryAllEventsRecordsCall {
  Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Query all events records',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/events',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddEventsRecordCall {
  Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Add events record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/events',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteTicketsRecordCall {
  Future<ApiCallResponse> call({
    int? ticketsId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete tickets record.',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/tickets/$ticketsId',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTicketsRecordCall {
  Future<ApiCallResponse> call({
    int? ticketsId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get tickets record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/tickets/$ticketsId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EditTicketsRecordCall {
  Future<ApiCallResponse> call({
    int? ticketsId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Edit tickets record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/tickets/$ticketsId',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class QueryAllTicketsRecordsCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? eventId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Query all tickets records',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/tickets',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
        'eventId': eventId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddTicketsRecordCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Add tickets record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/tickets',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserRecordCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete user record.',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/user/$userId',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserRecordCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get user record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/user/$userId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EditUserRecordCall {
  Future<ApiCallResponse> call({
    int? userId,
  }) async {
    const ffApiRequestBody = '''
{
  "name": "",
  "email": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit user record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/user/$userId',
      callType: ApiCallType.PATCH,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class QueryAllUserRecordsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Query all user records',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddUserRecordCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "name": "",
  "email": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add user record',
      apiUrl: '${BilheteriaDigitalGroup.baseUrl}/user',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Bilheteria Digital Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
