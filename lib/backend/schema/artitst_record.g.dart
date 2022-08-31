// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artitst_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArtitstRecord> _$artitstRecordSerializer =
    new _$ArtitstRecordSerializer();

class _$ArtitstRecordSerializer implements StructuredSerializer<ArtitstRecord> {
  @override
  final Iterable<Type> types = const [ArtitstRecord, _$ArtitstRecord];
  @override
  final String wireName = 'ArtitstRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArtitstRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.homeTown;
    if (value != null) {
      result
        ..add('home_town')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recordLable;
    if (value != null) {
      result
        ..add('record_lable')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.albums;
    if (value != null) {
      result
        ..add('albums')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
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
  ArtitstRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtitstRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'home_town':
          result.homeTown = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'record_lable':
          result.recordLable = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'albums':
          result.albums.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
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

class _$ArtitstRecord extends ArtitstRecord {
  @override
  final String? name;
  @override
  final int? age;
  @override
  final String? homeTown;
  @override
  final String? recordLable;
  @override
  final String? bio;
  @override
  final BuiltList<DocumentReference<Object?>>? albums;
  @override
  final String? photoUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ArtitstRecord([void Function(ArtitstRecordBuilder)? updates]) =>
      (new ArtitstRecordBuilder()..update(updates))._build();

  _$ArtitstRecord._(
      {this.name,
      this.age,
      this.homeTown,
      this.recordLable,
      this.bio,
      this.albums,
      this.photoUrl,
      this.ffRef})
      : super._();

  @override
  ArtitstRecord rebuild(void Function(ArtitstRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtitstRecordBuilder toBuilder() => new ArtitstRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtitstRecord &&
        name == other.name &&
        age == other.age &&
        homeTown == other.homeTown &&
        recordLable == other.recordLable &&
        bio == other.bio &&
        albums == other.albums &&
        photoUrl == other.photoUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), age.hashCode),
                            homeTown.hashCode),
                        recordLable.hashCode),
                    bio.hashCode),
                albums.hashCode),
            photoUrl.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArtitstRecord')
          ..add('name', name)
          ..add('age', age)
          ..add('homeTown', homeTown)
          ..add('recordLable', recordLable)
          ..add('bio', bio)
          ..add('albums', albums)
          ..add('photoUrl', photoUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ArtitstRecordBuilder
    implements Builder<ArtitstRecord, ArtitstRecordBuilder> {
  _$ArtitstRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _age;
  int? get age => _$this._age;
  set age(int? age) => _$this._age = age;

  String? _homeTown;
  String? get homeTown => _$this._homeTown;
  set homeTown(String? homeTown) => _$this._homeTown = homeTown;

  String? _recordLable;
  String? get recordLable => _$this._recordLable;
  set recordLable(String? recordLable) => _$this._recordLable = recordLable;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  ListBuilder<DocumentReference<Object?>>? _albums;
  ListBuilder<DocumentReference<Object?>> get albums =>
      _$this._albums ??= new ListBuilder<DocumentReference<Object?>>();
  set albums(ListBuilder<DocumentReference<Object?>>? albums) =>
      _$this._albums = albums;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ArtitstRecordBuilder() {
    ArtitstRecord._initializeBuilder(this);
  }

  ArtitstRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _age = $v.age;
      _homeTown = $v.homeTown;
      _recordLable = $v.recordLable;
      _bio = $v.bio;
      _albums = $v.albums?.toBuilder();
      _photoUrl = $v.photoUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtitstRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArtitstRecord;
  }

  @override
  void update(void Function(ArtitstRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArtitstRecord build() => _build();

  _$ArtitstRecord _build() {
    _$ArtitstRecord _$result;
    try {
      _$result = _$v ??
          new _$ArtitstRecord._(
              name: name,
              age: age,
              homeTown: homeTown,
              recordLable: recordLable,
              bio: bio,
              albums: _albums?.build(),
              photoUrl: photoUrl,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'albums';
        _albums?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ArtitstRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
