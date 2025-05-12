import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LowcardGamesRecord extends FirestoreRecord {
  LowcardGamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "winner_user_id" field.
  DocumentReference? _winnerUserId;
  DocumentReference? get winnerUserId => _winnerUserId;
  bool hasWinnerUserId() => _winnerUserId != null;

  // "winning_card" field.
  int? _winningCard;
  int get winningCard => _winningCard ?? 0;
  bool hasWinningCard() => _winningCard != null;

  // "room_id" field.
  DocumentReference? _roomId;
  DocumentReference? get roomId => _roomId;
  bool hasRoomId() => _roomId != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _winnerUserId = snapshotData['winner_user_id'] as DocumentReference?;
    _winningCard = castToType<int>(snapshotData['winning_card']);
    _roomId = snapshotData['room_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lowcard_games');

  static Stream<LowcardGamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LowcardGamesRecord.fromSnapshot(s));

  static Future<LowcardGamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LowcardGamesRecord.fromSnapshot(s));

  static LowcardGamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LowcardGamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LowcardGamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LowcardGamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LowcardGamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LowcardGamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLowcardGamesRecordData({
  String? status,
  DateTime? createdAt,
  DocumentReference? winnerUserId,
  int? winningCard,
  DocumentReference? roomId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'created_at': createdAt,
      'winner_user_id': winnerUserId,
      'winning_card': winningCard,
      'room_id': roomId,
    }.withoutNulls,
  );

  return firestoreData;
}

class LowcardGamesRecordDocumentEquality
    implements Equality<LowcardGamesRecord> {
  const LowcardGamesRecordDocumentEquality();

  @override
  bool equals(LowcardGamesRecord? e1, LowcardGamesRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.winnerUserId == e2?.winnerUserId &&
        e1?.winningCard == e2?.winningCard &&
        e1?.roomId == e2?.roomId;
  }

  @override
  int hash(LowcardGamesRecord? e) => const ListEquality().hash(
      [e?.status, e?.createdAt, e?.winnerUserId, e?.winningCard, e?.roomId]);

  @override
  bool isValidKey(Object? o) => o is LowcardGamesRecord;
}
