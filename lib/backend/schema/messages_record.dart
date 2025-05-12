import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "room_id" field.
  DocumentReference? _roomId;
  DocumentReference? get roomId => _roomId;
  bool hasRoomId() => _roomId != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "isBot" field.
  bool? _isBot;
  bool get isBot => _isBot ?? false;
  bool hasIsBot() => _isBot != null;

  // "botName" field.
  String? _botName;
  String get botName => _botName ?? '';
  bool hasBotName() => _botName != null;

  void _initializeFields() {
    _roomId = snapshotData['room_id'] as DocumentReference?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _username = snapshotData['username'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _photo = snapshotData['photo'] as String?;
    _isBot = snapshotData['isBot'] as bool?;
    _botName = snapshotData['botName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  DocumentReference? roomId,
  DocumentReference? createdBy,
  String? username,
  DateTime? createdAt,
  String? message,
  String? photo,
  bool? isBot,
  String? botName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'room_id': roomId,
      'created_by': createdBy,
      'username': username,
      'created_at': createdAt,
      'message': message,
      'photo': photo,
      'isBot': isBot,
      'botName': botName,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.roomId == e2?.roomId &&
        e1?.createdBy == e2?.createdBy &&
        e1?.username == e2?.username &&
        e1?.createdAt == e2?.createdAt &&
        e1?.message == e2?.message &&
        e1?.photo == e2?.photo &&
        e1?.isBot == e2?.isBot &&
        e1?.botName == e2?.botName;
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality().hash([
        e?.roomId,
        e?.createdBy,
        e?.username,
        e?.createdAt,
        e?.message,
        e?.photo,
        e?.isBot,
        e?.botName
      ]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
