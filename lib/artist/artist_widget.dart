import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../youtube/youtube_widget.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistWidget extends StatefulWidget {
  const ArtistWidget({
    Key? key,
    this.name,
    this.age,
    this.bio,
    this.homeTown,
    this.albums,
    this.artistID,
  }) : super(key: key);

  final String? name;
  final int? age;
  final String? bio;
  final String? homeTown;
  final DocumentReference? albums;
  final DocumentReference? artistID;

  @override
  _ArtistWidgetState createState() => _ArtistWidgetState();
}

class _ArtistWidgetState extends State<ArtistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArtitstRecord>(
      stream: ArtitstRecord.getDocument(widget.artistID!),
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
        final artistArtitstRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Image.network(
                      artistArtitstRecord.photoUrl!,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.fitHeight,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              artistArtitstRecord.photoUrl!,
                            ).image,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0x0014181B),
                              FlutterFlowTheme.of(context).secondaryBackground
                            ],
                            stops: [0, 0.7],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 52, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: Color(0x9A202529),
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Text(
                                      artistArtitstRecord.name!,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: Color(0x9A202529),
                                      icon: Icon(
                                        Icons.ios_share,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 24,
                                thickness: 2,
                                indent: 130,
                                endIndent: 130,
                                color: Colors.white,
                              ),
                              Text(
                                artistArtitstRecord.homeTown!,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => YoutubeWidget(),
                                      ),
                                    );
                                  },
                                  text: 'Subscribe',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 44,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Artist Playlist',
                                          icon: Icon(
                                            Icons.play_arrow_rounded,
                                            size: 15,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 44,
                                            color: Color(0x004B39EF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14,
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'My Sauce',
                                          icon: Icon(
                                            Icons.add_rounded,
                                            size: 15,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 44,
                                            color: Color(0x004B39EF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14,
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                          labelStyle: FlutterFlowTheme.of(context).subtitle1,
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          tabs: [
                            Tab(
                              text: 'Discogrophy',
                            ),
                            Tab(
                              text: 'Content',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              StreamBuilder<List<AlbumRecord>>(
                                stream: queryAlbumRecord(
                                  queryBuilder: (albumRecord) =>
                                      albumRecord.where('artitst',
                                          isEqualTo:
                                              artistArtitstRecord.reference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AlbumRecord> listViewAlbumRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewAlbumRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAlbumRecord =
                                          listViewAlbumRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 0),
                                        child: Container(
                                          width: 100,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x2B202529),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      height: 70,
                                                      child: Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child:
                                                                Image.network(
                                                              listViewAlbumRecord
                                                                  .coverArt!,
                                                              width: 100,
                                                              height: 70,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.01, 1.05),
                                                            child: ClipRect(
                                                              child:
                                                                  BackdropFilter(
                                                                filter:
                                                                    ImageFilter
                                                                        .blur(
                                                                  sigmaX: 5,
                                                                  sigmaY: 2,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 24,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xBF0F1113),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              8),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '05:03',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewAlbumRecord
                                                              .title!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'yMMMd',
                                                        listViewAlbumRecord
                                                            .releaseDate!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
                                                ),
                                                Divider(
                                                  height: 24,
                                                  thickness: 1,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'Download',
                                                    icon: Icon(
                                                      Icons
                                                          .cloud_download_rounded,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 44,
                                                      color: Color(0x004B39EF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 340,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: YoutubesearchCall.call(
                                          part: 'snippet',
                                          q: artistArtitstRecord.name,
                                          key: FFAppState().key,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewYoutubesearchResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final item = getJsonField(
                                                listViewYoutubesearchResponse
                                                    .jsonBody,
                                                r'''$.items''',
                                              ).toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: item.length,
                                                itemBuilder:
                                                    (context, itemIndex) {
                                                  final itemItem =
                                                      item[itemIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 12, 0, 12),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                YoutubeWidget(
                                                              videoId:
                                                                  getJsonField(
                                                                itemItem,
                                                                r'''$.id.videoId''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        );
                                                        setState(() =>
                                                            FFAppState()
                                                                    .videoId =
                                                                getJsonField(
                                                              itemItem,
                                                              r'''$.id.videoId''',
                                                            ).toString());
                                                      },
                                                      child: Container(
                                                        width: 270,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x1F000000),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Container(
                                                          width: 100,
                                                          height: 70,
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      itemItem,
                                                                      r'''$.snippet.thumbnails.high.url''',
                                                                    ),
                                                                    'https://storage.googleapis.com/wethesauce-music/2022/07/279ff051-brent-faiyaz-wasteland-300x300.jpg',
                                                                  ),
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1, 1),
                                                                child: ClipRect(
                                                                  child:
                                                                      BackdropFilter(
                                                                    filter:
                                                                        ImageFilter
                                                                            .blur(
                                                                      sigmaX: 5,
                                                                      sigmaY: 2,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          50,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Colors.transparent,
                                                                            FlutterFlowTheme.of(context).secondaryColor
                                                                          ],
                                                                          stops: [
                                                                            0,
                                                                            1
                                                                          ],
                                                                          begin: AlignmentDirectional(
                                                                              0,
                                                                              -1),
                                                                          end: AlignmentDirectional(
                                                                              0,
                                                                              1),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(8),
                                                                          bottomRight:
                                                                              Radius.circular(8),
                                                                          topLeft:
                                                                              Radius.circular(0),
                                                                          topRight:
                                                                              Radius.circular(0),
                                                                        ),
                                                                      ),
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1,
                                                                              0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            itemItem,
                                                                            r'''$.snippet.title''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
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
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x2B202529),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 12, 0),
                                                    child: Icon(
                                                      Icons
                                                          .directions_bus_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 8),
                                                      child: Text(
                                                        'Upcoming Tours',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: Icon(
                                                        Icons.auto_awesome,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 8),
                                                        child: Text(
                                                          'Merch',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: Icon(
                                                        Icons.stream,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 8),
                                                        child: Text(
                                                          'Interviews',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x2B202529),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 0, 0),
                                                child: Text(
                                                  'Artist Chat Room',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1,
                                                ),
                                              ),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 0, 16),
                                      child: Text(
                                        'Related Content',
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 500,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: YoutubesearchCall.call(
                                          part: 'snippet',
                                          q: artistArtitstRecord.name,
                                          key: FFAppState().key,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewYoutubesearchResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final item2 = getJsonField(
                                                listViewYoutubesearchResponse
                                                    .jsonBody,
                                                r'''$.items''',
                                              ).toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: item2.length,
                                                itemBuilder:
                                                    (context, item2Index) {
                                                  final item2Item =
                                                      item2[item2Index];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 16, 12),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                YoutubeWidget(),
                                                          ),
                                                        );
                                                        setState(() =>
                                                            FFAppState()
                                                                    .videoId =
                                                                getJsonField(
                                                              item2Item,
                                                              r'''$.id.videoId''',
                                                            ).toString());
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3,
                                                              color: Color(
                                                                  0x411D2429),
                                                              offset:
                                                                  Offset(0, 1),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 8, 8),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                        item2Item,
                                                                        r'''$.snippet.thumbnails.high.url''',
                                                                      ),
                                                                      'https://storage.googleapis.com/wethesauce-music/2022/07/279ff051-brent-faiyaz-wasteland-300x300.jpg',
                                                                    ),
                                                                    width: 70,
                                                                    height: 100,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          4,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            item2Item,
                                                                            r'''$.snippet.title''',
                                                                          ).toString(),
                                                                          'Test',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            getJsonField(
                                                                              item2Item,
                                                                              r'''$.id.videoId''',
                                                                            ).toString().maybeHandleOverflow(
                                                                                  maxChars: 70,
                                                                                  replacement: '…',
                                                                                ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText2,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .chevron_right_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
