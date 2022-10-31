import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'album_record.g.dart';

abstract class AlbumRecord implements Built<AlbumRecord, AlbumRecordBuilder> {
  static Serializer<AlbumRecord> get serializer => _$albumRecordSerializer;

  String? get title;

  DocumentReference? get artitst;

  @BuiltValueField(wireName: 'cover_art')
  String? get coverArt;

  BuiltList<DocumentReference>? get features;

  BuiltList<String>? get sauce;

  @BuiltValueField(wireName: 'release_date')
  DateTime? get releaseDate;

  @BuiltValueField(wireName: 'artist_name')
  String? get artistName;

  String? get description;

  @BuiltValueField(wireName: 'youtube_id')
  String? get youtubeId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AlbumRecordBuilder builder) => builder
    ..title = ''
    ..coverArt = ''
    ..features = ListBuilder()
    ..sauce = ListBuilder()
    ..artistName = ''
    ..description = ''
    ..youtubeId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('album');

  static Stream<AlbumRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AlbumRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AlbumRecord._();
  factory AlbumRecord([void Function(AlbumRecordBuilder) updates]) =
      _$AlbumRecord;

  static AlbumRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAlbumRecordData({
  String? title,
  DocumentReference? artitst,
  String? coverArt,
  DateTime? releaseDate,
  String? artistName,
  String? description,
  String? youtubeId,
}) {
  final firestoreData = serializers.toFirestore(
    AlbumRecord.serializer,
    AlbumRecord(
      (a) => a
        ..title = title
        ..artitst = artitst
        ..coverArt = coverArt
        ..features = null
        ..sauce = null
        ..releaseDate = releaseDate
        ..artistName = artistName
        ..description = description
        ..youtubeId = youtubeId,
    ),
  );

  return firestoreData;
}
