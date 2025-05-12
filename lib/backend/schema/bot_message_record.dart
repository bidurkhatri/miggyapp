import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotMessageRecord extends FirestoreRecord {
  BotMessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "room" field.
  DocumentReference? _room;
  DocumentReference? get room => _room;
  bool hasRoom() => _room != null;

  // "botName" field.
  String? _botName;
  String get botName => _botName ?? '';
  bool hasBotName() => _botName != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _timeCreated = snapshotData['timeCreated'] as DateTime?;
    _room = snapshotData['room'] as DocumentReference?;
    _botName = snapshotData['botName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BotMessage');

  static Stream<BotMessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BotMessageRecord.fromSnapshot(s));

  static Future<BotMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BotMessageRecord.fromSnapshot(s));

  static BotMessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BotMessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BotMessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BotMessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BotMessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BotMessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBotMessageRecordData({
  String? message,
  DateTime? timeCreated,
  DocumentReference? room,
  String? botName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'timeCreated': timeCreated,
      'room': room,
      'botName': botName,
    }.withoutNulls,
  );

  return firestoreData;
}

class BotMessageRecordDocumentEquality implements Equality<BotMessageRecord> {
  const BotMessageRecordDocumentEquality();

  @override
  bool equals(BotMessageRecord? e1, BotMessageRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.room == e2?.room &&
        e1?.botName == e2?.botName;
  }

  @override
  int hash(BotMessageRecord? e) => const ListEquality()
      .hash([e?.message, e?.timeCreated, e?.room, e?.botName]);

  @override
  bool isValidKey(Object? o) => o is BotMessageRecord;
}
