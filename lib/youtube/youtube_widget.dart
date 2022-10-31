import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YoutubeWidget extends StatefulWidget {
  const YoutubeWidget({
    Key? key,
    this.videoId,
  }) : super(key: key);

  final String? videoId;

  @override
  _YoutubeWidgetState createState() => _YoutubeWidgetState();
}

class _YoutubeWidgetState extends State<YoutubeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return YoutubeFullScreenWrapper(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 24,
            ),
          ),
          title: Text(
            'YouTube',
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
                FlutterFlowYoutubePlayer(
                  url: functions.youtubevideoString(widget.videoId),
                  autoPlay: false,
                  looping: true,
                  mute: false,
                  showControls: true,
                  showFullScreen: true,
                ),
                SelectionArea(
                    child: Text(
                  FFAppState().videoId,
                  style: FlutterFlowTheme.of(context).bodyText1,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
