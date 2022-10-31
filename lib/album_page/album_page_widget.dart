import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlbumPageWidget extends StatefulWidget {
  const AlbumPageWidget({
    Key? key,
    this.youtubePlaylistId,
  }) : super(key: key);

  final String? youtubePlaylistId;

  @override
  _AlbumPageWidgetState createState() => _AlbumPageWidgetState();
}

class _AlbumPageWidgetState extends State<AlbumPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: YouTubeGroup.youtubeplaylistitemCall.call(
        part: 'contentDetails',
        id: widget.youtubePlaylistId,
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
        final albumPageYoutubeplaylistitemResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.chevron_left,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Page Title',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final playlistItems = getJsonField(
                        albumPageYoutubeplaylistitemResponse.jsonBody,
                        r'''$.items''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: playlistItems.length,
                        itemBuilder: (context, playlistItemsIndex) {
                          final playlistItemsItem =
                              playlistItems[playlistItemsIndex];
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: SelectionArea(
                                child: Text(
                              getJsonField(
                                playlistItemsItem,
                                r'''$''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
