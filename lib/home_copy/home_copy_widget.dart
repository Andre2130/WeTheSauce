import '../album/album_widget.dart';
import '../artist/artist_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCopyWidget extends StatefulWidget {
  const HomeCopyWidget({Key? key}) : super(key: key);

  @override
  _HomeCopyWidgetState createState() => _HomeCopyWidgetState();
}

class _HomeCopyWidgetState extends State<HomeCopyWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0F1113),
        automaticallyImplyLeading: false,
        title: Text(
          'WeTheSauce',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Outfit',
                color: Color(0xFF7B1FA2),
                fontSize: 28,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF7B1FA2),
                size: 30,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF0F1113),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFF0F1113),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x27000000),
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: StreamBuilder<List<AlbumRecord>>(
                        stream: queryAlbumRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<AlbumRecord> textFieldAlbumRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final textFieldAlbumRecord =
                              textFieldAlbumRecordList.isNotEmpty
                                  ? textFieldAlbumRecordList.first
                                  : null;
                          return TextFormField(
                            controller: textController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Search products...',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF1F4F8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Color(0x6E6B6C70),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Color(0xFFF1F4F8),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF7B1FA2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 8),
                          child: InkWell(
                            onTap: () async {
                              setState(
                                  () => FFAppState().currentfilter = 'All');
                            },
                            child: Container(
                              width: 120,
                              height: 190,
                              decoration: BoxDecoration(
                                color: Color(0x6E6B6C70),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.white,
                                        size: 44,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Recently Added',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                          child: InkWell(
                            onTap: () async {
                              setState(
                                  () => FFAppState().currentfilter = 'Hot');
                            },
                            child: Container(
                              width: 120,
                              height: 190,
                              decoration: BoxDecoration(
                                color: Color(0xDEFF2C30),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Icon(
                                        Icons.local_fire_department,
                                        color: Colors.white,
                                        size: 44,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Hot',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 8),
                          child: InkWell(
                            onTap: () async {
                              setState(() =>
                                  FFAppState().currentfilter = 'SweetBaby');
                            },
                            child: Container(
                              width: 120,
                              height: 190,
                              decoration: BoxDecoration(
                                color: Color(0x6E6B6C70),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Icon(
                                        Icons.child_care_outlined,
                                        color: Colors.white,
                                        size: 44,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'SweetBaby',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 8),
                          child: InkWell(
                            onTap: () async {
                              setState(
                                  () => FFAppState().currentfilter = 'Trap');
                            },
                            child: Container(
                              width: 120,
                              height: 190,
                              decoration: BoxDecoration(
                                color: Color(0xFF7B1FA2),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 4),
                                      child: Icon(
                                        Icons.hardware,
                                        color: Colors.white,
                                        size: 44,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Trap',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                          child: Text(
                            FFAppState().currentfilter,
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'home'),
                              ),
                            );
                          },
                          child: Text(
                            'See All',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF7B1FA2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF0F1113),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                            color: Color(0xFF0F1113),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: StreamBuilder<List<AlbumRecord>>(
                              stream: queryAlbumRecord(
                                queryBuilder: (albumRecord) => albumRecord
                                    .where('sauce',
                                        arrayContains:
                                            FFAppState().currentfilter)
                                    .orderBy('release_date', descending: true),
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
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listViewAlbumRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewAlbumRecord =
                                        listViewAlbumRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AlbumWidget(
                                                coverArt: listViewAlbumRecord
                                                    .coverArt,
                                                title:
                                                    listViewAlbumRecord.title,
                                                artist: listViewAlbumRecord
                                                    .artistName,
                                                releaseDate: listViewAlbumRecord
                                                    .releaseDate,
                                                artistID:
                                                    listViewAlbumRecord.artitst,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 200,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0F1113),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 190,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.network(
                                                      listViewAlbumRecord
                                                          .coverArt!,
                                                    ).image,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x230E151B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x6E6B6C70),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12),
                                                      bottomRight:
                                                          Radius.circular(12),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(0,
                                                          0.050000000000000044),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(8, 12,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewAlbumRecord
                                                              .title!,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 4, 0, 0),
                                                        child: Text(
                                                          listViewAlbumRecord
                                                              .artistName!,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
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
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Artist',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFF1F4F8),
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFF0F1113),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: StreamBuilder<List<ArtitstRecord>>(
                            stream: queryArtitstRecord(
                              queryBuilder: (artitstRecord) => artitstRecord
                                  .orderBy('name', descending: true),
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
                              List<ArtitstRecord> listViewArtitstRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: listViewArtitstRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewArtitstRecord =
                                      listViewArtitstRecordList[listViewIndex];
                                  return Container(
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0F1113),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ArtistWidget(
                                                name:
                                                    listViewArtitstRecord.name,
                                                age: listViewArtitstRecord.age,
                                                bio: listViewArtitstRecord.bio,
                                                homeTown: listViewArtitstRecord
                                                    .homeTown,
                                                artistID: listViewArtitstRecord
                                                    .reference,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF0F1113),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    listViewArtitstRecord
                                                        .photoUrl!,
                                                  ).image,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x230E151B),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: 200,
                                                height: 55,
                                                decoration: BoxDecoration(
                                                  color: Color(0x6E6B6C70),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0),
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0, 0.050000000000000044),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 12, 0, 0),
                                                      child: Text(
                                                        listViewArtitstRecord
                                                            .name!,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .subtitle1
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 4, 0, 0),
                                                      child: Text(
                                                        listViewArtitstRecord
                                                            .homeTown!,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText2
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
