import 'dart:convert';

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

/// Start YouTube Group Code

class YouTubeGroup {
  static String baseUrl = 'https://www.googleapis.com/youtube/v3/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static YouTubeSearchCall youTubeSearchCall = YouTubeSearchCall();
  static YoutubeplaylistitemCall youtubeplaylistitemCall =
      YoutubeplaylistitemCall();
  static YouTubeVideosCall youTubeVideosCall = YouTubeVideosCall();
}

class YouTubeSearchCall {
  Future<ApiCallResponse> call({
    String? part = '',
    String? q = '',
    String? key = 'AIzaSyCdIDvungzwp2d9AMivD62EBB0qyw-Agdk',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTubeSearch',
      apiUrl: '${YouTubeGroup.baseUrl}search',
      callType: ApiCallType.GET,
      headers: {
        ...YouTubeGroup.headers,
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

class YoutubeplaylistitemCall {
  Future<ApiCallResponse> call({
    String? part = 'snippet',
    String? id = 'PLQcDrcVwJwTMH8YZ5vXGtKj6GH86dl7RG',
    String? key = 'AIzaSyCdIDvungzwp2d9AMivD62EBB0qyw-Agdk',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'youtubeplaylistitem',
      apiUrl: '${YouTubeGroup.baseUrl}playlistItems',
      callType: ApiCallType.GET,
      headers: {
        ...YouTubeGroup.headers,
      },
      params: {
        'part': part,
        'playlistId': id,
        'key': key,
      },
      returnBody: true,
    );
  }
}

class YouTubeVideosCall {
  Future<ApiCallResponse> call({
    String? id = 'OLAK5uy_nij9YoxFWdMAa0BoVictrBF2d_i7W1uzM',
    String? key = 'AIzaSyCdIDvungzwp2d9AMivD62EBB0qyw-Agdk',
    String? part = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'youTubeVideos',
      apiUrl: '${YouTubeGroup.baseUrl}videos',
      callType: ApiCallType.GET,
      headers: {
        ...YouTubeGroup.headers,
      },
      params: {
        'part': part,
        'id': id,
        'key': key,
      },
      returnBody: true,
    );
  }
}

/// End YouTube Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}
