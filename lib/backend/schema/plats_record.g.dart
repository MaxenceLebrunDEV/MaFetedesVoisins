// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlatsRecord> _$platsRecordSerializer = new _$PlatsRecordSerializer();

class _$PlatsRecordSerializer implements StructuredSerializer<PlatsRecord> {
  @override
  final Iterable<Type> types = const [PlatsRecord, _$PlatsRecord];
  @override
  final String wireName = 'PlatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlatsRecord object,
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  PlatsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlatsRecordBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$PlatsRecord extends PlatsRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? quantity;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PlatsRecord([void Function(PlatsRecordBuilder)? updates]) =>
      (new PlatsRecordBuilder()..update(updates))._build();

  _$PlatsRecord._({this.name, this.description, this.quantity, this.ffRef})
      : super._();

  @override
  PlatsRecord rebuild(void Function(PlatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlatsRecordBuilder toBuilder() => new PlatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlatsRecord &&
        name == other.name &&
        description == other.description &&
        quantity == other.quantity &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlatsRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('quantity', quantity)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PlatsRecordBuilder implements Builder<PlatsRecord, PlatsRecordBuilder> {
  _$PlatsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PlatsRecordBuilder() {
    PlatsRecord._initializeBuilder(this);
  }

  PlatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _quantity = $v.quantity;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlatsRecord;
  }

  @override
  void update(void Function(PlatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlatsRecord build() => _build();

  _$PlatsRecord _build() {
    final _$result = _$v ??
        new _$PlatsRecord._(
            name: name,
            description: description,
            quantity: quantity,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
