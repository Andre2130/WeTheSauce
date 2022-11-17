import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../youtube/youtube_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({Key? key}) : super(key: key);

  @override
  _PlaylistWidgetState createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  PagingController<ApiPagingParams, dynamic>? _pagingController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: YouTubeGroup.youtubeplaylistitemCall.call(
        part: 'snippet',
        id: 'PLQcDrcVwJwTMH8YZ5vXGtKj6GH86dl7RG',
        key: FFAppState().key,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final playlistYoutubeplaylistitemResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        setState(() => _pagingController?.refresh());
                        await waitForOnePage();
                      },
                      child: PagedListView<ApiPagingParams, dynamic>(
                        pagingController: () {
                          if (_pagingController != null) {
                            return _pagingController!;
                          }

                          _pagingController = PagingController(
                            firstPageKey: ApiPagingParams(
                              nextPageNumber: 0,
                              numItems: 0,
                              lastResponse: null,
                            ),
                          );
                          _pagingController!
                              .addPageRequestListener((nextPageMarker) {
                            YouTubeGroup.youtubeplaylistitemCall
                                .call(
                              part: 'snippet',
                              id: 'PLQcDrcVwJwTMH8YZ5vXGtKj6GH86dl7RG',
                              key: FFAppState().key,
                            )
                                .then((listViewYoutubeplaylistitemResponse) {
                              final pageItems = getJsonField(
                                listViewYoutubeplaylistitemResponse.jsonBody,
                                r'''$.items''',
                              ).toList() as List;
                              final newNumItems =
                                  nextPageMarker.numItems + pageItems.length;
                              _pagingController!.appendPage(
                                pageItems,
                                (pageItems.length > 0)
                                    ? ApiPagingParams(
                                        nextPageNumber:
                                            nextPageMarker.nextPageNumber + 1,
                                        numItems: newNumItems,
                                        lastResponse:
                                            listViewYoutubeplaylistitemResponse,
                                      )
                                    : null,
                              );
                            });
                          });
                          return _pagingController!;
                        }(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        builderDelegate: PagedChildBuilderDelegate<dynamic>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, itemsIndex) {
                            final itemsItem =
                                _pagingController!.itemList![itemsIndex];
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => YoutubeWidget(
                                      videoId: getJsonField(
                                        itemsItem,
                                        r'''$.resourceId.videoId''',
                                      ).toString(),
                                    ),
                                  ),
                                );
                                setState(
                                    () => FFAppState().videoId = getJsonField(
                                          itemsItem,
                                          r'''$.resourceId.videoId''',
                                        ).toString());
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.network(
                                        getJsonField(
                                          itemsItem,
                                          r'''$.snippet.thumbnails.high.url''',
                                        ),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      SelectionArea(
                                          child: Text(
                                        getJsonField(
                                          itemsItem,
                                          r'''$.snippet.title''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      )),
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
          ),
        );
      },
    );
  }

  Future waitForOnePage({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (_pagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
