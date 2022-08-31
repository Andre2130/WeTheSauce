import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'artitst_record.g.dart';

abstract class ArtitstRecord
    implements Built<ArtitstRecord, ArtitstRecordBuilder> {
  static Serializer<ArtitstRecord> get serializer => _$artitstRecordSerializer;

  String? get name;

  int? get age;

  @BuiltValueField(wireName: 'home_town')
  String? get homeTown;

  @BuiltValueField(wireName: 'record_lable')
  String? get recordLable;

  String? get bio;

  BuiltList<DocumentReference>? get albums;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ArtitstRecordBuilder builder) => builder
    ..name = ''
    ..age = 0
    ..homeTown = ''
    ..recordLable = ''
    ..bio = ''
    ..albums = ListBuilder()
    ..photoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artitst');

  static Stream<ArtitstRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ArtitstRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ArtitstRecord._();
  factory ArtitstRecord([void Function(ArtitstRecordBuilder) updates]) =
      _$ArtitstRecord;

  static ArtitstRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createArtitstRecordData({
  String? name,
  int? age,
  String? homeTown,
  String? recordLable,
  String? bio,
  String? photoUrl,
}) {
  final firestoreData = serializers.toFirestore(
    ArtitstRecord.serializer,
    ArtitstRecord(
      (a) => a
        ..name = name
        ..age = age
        ..homeTown = homeTown
        ..recordLable = recordLable
        ..bio = bio
        ..albums = null
        ..photoUrl = photoUrl,
    ),
  );

  return firestoreData;
}
