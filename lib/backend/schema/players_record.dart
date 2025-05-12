import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayersRecord extends FirestoreRecord {
  PlayersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "card_value" field.
  int? _cardValue;
  int get cardValue => _cardValue ?? 0;
  bool hasCardValue() => _cardValue != null;

  // "revealed" field.
  bool? _revealed;
  bool get revealed => _revealed ?? false;
  bool hasRevealed() => _revealed != null;

  // "joined_at" field.
  DateTime? _joinedAt;
  DateTime? get joinedAt => _joinedAt;
  bool hasJoinedAt() => _joinedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _cardValue = castToType<int>(snapshotData['card_value']);
    _revealed = snapshotData['revealed'] as bool?;
    _joinedAt = snapshotData['joined_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('players')
          : FirebaseFirestore.instance.collectionGroup('players');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('players').doc(id);

  static Stream<PlayersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlayersRecord.fromSnapshot(s));

  static Future<PlayersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlayersRecord.fromSnapshot(s));

  static PlayersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlayersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlayersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlayersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlayersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlayersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlayersRecordData({
  DocumentReference? userId,
  int? cardValue,
  bool? revealed,
  DateTime? joinedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'card_value': cardValue,
      'revealed': revealed,
      'joined_at': joinedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlayersRecordDocumentEquality implements Equality<PlayersRecord> {
  const PlayersRecordDocumentEquality();

  @override
  bool equals(PlayersRecord? e1, PlayersRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.cardValue == e2?.cardValue &&
        e1?.revealed == e2?.revealed &&
        e1?.joinedAt == e2?.joinedAt;
  }

  @override
  int hash(PlayersRecord? e) => const ListEquality()
      .hash([e?.userId, e?.cardValue, e?.revealed, e?.joinedAt]);

  @override
  bool isValidKey(Object? o) => o is PlayersRecord;
}
