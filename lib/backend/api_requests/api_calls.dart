import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start spotify Group Code

class SpotifyGroup {
  static String baseUrl = 'https://api.spotify.com/v1';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-type': 'application.json',
    'Authorization': 'Bearer',
  };
}

/// End spotify Group Code

class YoutubesearchCall {
  static Future<ApiCallResponse> call({
    String? part = '',
    String? q = '',
    String? key = 'AIzaSyCdIDvungzwp2d9AMivD62EBB0qyw-Agdk',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'youtubesearch',
      apiUrl: 'https://www.googleapis.com/youtube/v3/search?',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'part': part,
        'q': q,
        'key': key,
      },
      returnBody: true,
    );
  }
}

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
