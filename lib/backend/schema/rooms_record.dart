import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomsRecord extends FirestoreRecord {
  RoomsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "room_name" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  bool hasRoomName() => _roomName != null;

  // "room_category" field.
  String? _roomCategory;
  String get roomCategory => _roomCategory ?? '';
  bool hasRoomCategory() => _roomCategory != null;

  // "no_of_max_participant" field.
  int? _noOfMaxParticipant;
  int get noOfMaxParticipant => _noOfMaxParticipant ?? 0;
  bool hasNoOfMaxParticipant() => _noOfMaxParticipant != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "last_message_info" field.
  LastMessageStruct? _lastMessageInfo;
  LastMessageStruct get lastMessageInfo =>
      _lastMessageInfo ?? LastMessageStruct();
  bool hasLastMessageInfo() => _lastMessageInfo != null;

  void _initializeFields() {
    _roomName = snapshotData['room_name'] as String?;
    _roomCategory = snapshotData['room_category'] as String?;
    _noOfMaxParticipant =
        castToType<int>(snapshotData['no_of_max_participant']);
    _participants = getDataList(snapshotData['participants']);
    _lastMessageInfo = snapshotData['last_message_info'] is LastMessageStruct
        ? snapshotData['last_message_info']
        : LastMessageStruct.maybeFromMap(snapshotData['last_message_info']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rooms');

  static Stream<RoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RoomsRecord.fromSnapshot(s));

  static Future<RoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RoomsRecord.fromSnapshot(s));

  static RoomsRecord fromSnapshot(DocumentSnapshot snapshot) => RoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RoomsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRoomsRecordData({
  String? roomName,
  String? roomCategory,
  int? noOfMaxParticipant,
  LastMessageStruct? lastMessageInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'room_name': roomName,
      'room_category': roomCategory,
      'no_of_max_participant': noOfMaxParticipant,
      'last_message_info': LastMessageStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "last_message_info" field.
  addLastMessageStructData(firestoreData, lastMessageInfo, 'last_message_info');

  return firestoreData;
}

class RoomsRecordDocumentEquality implements Equality<RoomsRecord> {
  const RoomsRecordDocumentEquality();

  @override
  bool equals(RoomsRecord? e1, RoomsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.roomName == e2?.roomName &&
        e1?.roomCategory == e2?.roomCategory &&
        e1?.noOfMaxParticipant == e2?.noOfMaxParticipant &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.lastMessageInfo == e2?.lastMessageInfo;
  }

  @override
  int hash(RoomsRecord? e) => const ListEquality().hash([
        e?.roomName,
        e?.roomCategory,
        e?.noOfMaxParticipant,
        e?.participants,
        e?.lastMessageInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is RoomsRecord;
}
