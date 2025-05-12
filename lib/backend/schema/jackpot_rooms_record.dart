import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JackpotRoomsRecord extends FirestoreRecord {
  JackpotRoomsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "total_pot" field.
  int? _totalPot;
  int get totalPot => _totalPot ?? 0;
  bool hasTotalPot() => _totalPot != null;

  // "winning_user_id" field.
  DocumentReference? _winningUserId;
  DocumentReference? get winningUserId => _winningUserId;
  bool hasWinningUserId() => _winningUserId != null;

  // "room_id" field.
  DocumentReference? _roomId;
  DocumentReference? get roomId => _roomId;
  bool hasRoomId() => _roomId != null;

  // "participants" field.
  List<GameParticipantsStruct>? _participants;
  List<GameParticipantsStruct> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _totalPot = castToType<int>(snapshotData['total_pot']);
    _winningUserId = snapshotData['winning_user_id'] as DocumentReference?;
    _roomId = snapshotData['room_id'] as DocumentReference?;
    _participants = getStructList(
      snapshotData['participants'],
      GameParticipantsStruct.fromMap,
    );
    _isActive = snapshotData['isActive'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jackpot_rooms');

  static Stream<JackpotRoomsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JackpotRoomsRecord.fromSnapshot(s));

  static Future<JackpotRoomsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JackpotRoomsRecord.fromSnapshot(s));

  static JackpotRoomsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JackpotRoomsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JackpotRoomsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JackpotRoomsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JackpotRoomsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JackpotRoomsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJackpotRoomsRecordData({
  DateTime? createdAt,
  int? totalPot,
  DocumentReference? winningUserId,
  DocumentReference? roomId,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'total_pot': totalPot,
      'winning_user_id': winningUserId,
      'room_id': roomId,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class JackpotRoomsRecordDocumentEquality
    implements Equality<JackpotRoomsRecord> {
  const JackpotRoomsRecordDocumentEquality();

  @override
  bool equals(JackpotRoomsRecord? e1, JackpotRoomsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.totalPot == e2?.totalPot &&
        e1?.winningUserId == e2?.winningUserId &&
        e1?.roomId == e2?.roomId &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(JackpotRoomsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.totalPot,
        e?.winningUserId,
        e?.roomId,
        e?.participants,
        e?.isActive
      ]);

  @override
  bool isValidKey(Object? o) => o is JackpotRoomsRecord;
}
