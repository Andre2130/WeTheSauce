// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AlbumRecord> _$albumRecordSerializer = new _$AlbumRecordSerializer();

class _$AlbumRecordSerializer implements StructuredSerializer<AlbumRecord> {
  @override
  final Iterable<Type> types = const [AlbumRecord, _$AlbumRecord];
  @override
  final String wireName = 'AlbumRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AlbumRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.artitst;
    if (value != null) {
      result
        ..add('artitst')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.coverArt;
    if (value != null) {
      result
        ..add('cover_art')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.features;
    if (value != null) {
      result
        ..add('features')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.sauce;
    if (value != null) {
      result
        ..add('sauce')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.releaseDate;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.artistName;
    if (value != null) {
      result
        ..add('artist_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AlbumRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'artitst':
          result.artitst = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'cover_art':
          result.coverArt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'features':
          result.features.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'sauce':
          result.sauce.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'artist_name':
          result.artistName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AlbumRecord extends AlbumRecord {
  @override
  final String? title;
  @override
  final DocumentReference<Object?>? artitst;
  @override
  final String? coverArt;
  @override
  final BuiltList<DocumentReference<Object?>>? features;
  @override
  final BuiltList<String>? sauce;
  @override
  final DateTime? releaseDate;
  @override
  final String? artistName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AlbumRecord([void Function(AlbumRecordBuilder)? updates]) =>
      (new AlbumRecordBuilder()..update(updates))._build();

  _$AlbumRecord._(
      {this.title,
      this.artitst,
      this.coverArt,
      this.features,
      this.sauce,
      this.releaseDate,
      this.artistName,
      this.ffRef})
      : super._();

  @override
  AlbumRecord rebuild(void Function(AlbumRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumRecordBuilder toBuilder() => new AlbumRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AlbumRecord &&
        title == other.title &&
        artitst == other.artitst &&
        coverArt == other.coverArt &&
        features == other.features &&
        sauce == other.sauce &&
        releaseDate == other.releaseDate &&
        artistName == other.artistName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, title.hashCode), artitst.hashCode),
                            coverArt.hashCode),
                        features.hashCode),
                    sauce.hashCode),
                releaseDate.hashCode),
            artistName.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AlbumRecord')
          ..add('title', title)
          ..add('artitst', artitst)
          ..add('coverArt', coverArt)
          ..add('features', features)
          ..add('sauce', sauce)
          ..add('releaseDate', releaseDate)
          ..add('artistName', artistName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AlbumRecordBuilder implements Builder<AlbumRecord, AlbumRecordBuilder> {
  _$AlbumRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DocumentReference<Object?>? _artitst;
  DocumentReference<Object?>? get artitst => _$this._artitst;
  set artitst(DocumentReference<Object?>? artitst) => _$this._artitst = artitst;

  String? _coverArt;
  String? get coverArt => _$this._coverArt;
  set coverArt(String? coverArt) => _$this._coverArt = coverArt;

  ListBuilder<DocumentReference<Object?>>? _features;
  ListBuilder<DocumentReference<Object?>> get features =>
      _$this._features ??= new ListBuilder<DocumentReference<Object?>>();
  set features(ListBuilder<DocumentReference<Object?>>? features) =>
      _$this._features = features;

  ListBuilder<String>? _sauce;
  ListBuilder<String> get sauce => _$this._sauce ??= new ListBuilder<String>();
  set sauce(ListBuilder<String>? sauce) => _$this._sauce = sauce;

  DateTime? _releaseDate;
  DateTime? get releaseDate => _$this._releaseDate;
  set releaseDate(DateTime? releaseDate) => _$this._releaseDate = releaseDate;

  String? _artistName;
  String? get artistName => _$this._artistName;
  set artistName(String? artistName) => _$this._artistName = artistName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AlbumRecordBuilder() {
    AlbumRecord._initializeBuilder(this);
  }

  AlbumRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _artitst = $v.artitst;
      _coverArt = $v.coverArt;
      _features = $v.features?.toBuilder();
      _sauce = $v.sauce?.toBuilder();
      _releaseDate = $v.releaseDate;
      _artistName = $v.artistName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AlbumRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AlbumRecord;
  }

  @override
  void update(void Function(AlbumRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AlbumRecord build() => _build();

  _$AlbumRecord _build() {
    _$AlbumRecord _$result;
    try {
      _$result = _$v ??
          new _$AlbumRecord._(
              title: title,
              artitst: artitst,
              coverArt: coverArt,
              features: _features?.build(),
              sauce: _sauce?.build(),
              releaseDate: releaseDate,
              artistName: artistName,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'features';
        _features?.build();
        _$failedField = 'sauce';
        _sauce?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AlbumRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
