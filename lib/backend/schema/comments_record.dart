import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_description" field.
  String? _commentDescription;
  String get commentDescription => _commentDescription ?? '';
  bool hasCommentDescription() => _commentDescription != null;

  // "commented_at" field.
  DateTime? _commentedAt;
  DateTime? get commentedAt => _commentedAt;
  bool hasCommentedAt() => _commentedAt != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "liked_users" field.
  List<DocumentReference>? _likedUsers;
  List<DocumentReference> get likedUsers => _likedUsers ?? const [];
  bool hasLikedUsers() => _likedUsers != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentDescription = snapshotData['comment_description'] as String?;
    _commentedAt = snapshotData['commented_at'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _likedUsers = getDataList(snapshotData['liked_users']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? commentDescription,
  DateTime? commentedAt,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_description': commentDescription,
      'commented_at': commentedAt,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentDescription == e2?.commentDescription &&
        e1?.commentedAt == e2?.commentedAt &&
        e1?.userId == e2?.userId &&
        listEquality.equals(e1?.likedUsers, e2?.likedUsers);
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality()
      .hash([e?.commentDescription, e?.commentedAt, e?.userId, e?.likedUsers]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
