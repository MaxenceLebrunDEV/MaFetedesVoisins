import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'plats_record.g.dart';

abstract class PlatsRecord implements Built<PlatsRecord, PlatsRecordBuilder> {
  static Serializer<PlatsRecord> get serializer => _$platsRecordSerializer;

  String? get name;

  String? get description;

  int? get quantity;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PlatsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..quantity = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plats');

  static Stream<PlatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PlatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PlatsRecord._();
  factory PlatsRecord([void Function(PlatsRecordBuilder) updates]) =
      _$PlatsRecord;

  static PlatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPlatsRecordData({
  String? name,
  String? description,
  int? quantity,
}) {
  final firestoreData = serializers.toFirestore(
    PlatsRecord.serializer,
    PlatsRecord(
      (p) => p
        ..name = name
        ..description = description
        ..quantity = quantity,
    ),
  );

  return firestoreData;
}
