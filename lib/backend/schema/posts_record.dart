import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "users_liked" field.
  List<DocumentReference>? _usersLiked;
  List<DocumentReference> get usersLiked => _usersLiked ?? const [];
  bool hasUsersLiked() => _usersLiked != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "hasReaction" field.
  bool? _hasReaction;
  bool get hasReaction => _hasReaction ?? false;
  bool hasHasReaction() => _hasReaction != null;

  // "post_Image" field.
  List<String>? _postImage;
  List<String> get postImage => _postImage ?? const [];
  bool hasPostImage() => _postImage != null;

  void _initializeFields() {
    _postDescription = snapshotData['post_description'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _usersLiked = getDataList(snapshotData['users_liked']);
    _postedBy = snapshotData['posted_by'] as DocumentReference?;
    _username = snapshotData['username'] as String?;
    _hasReaction = snapshotData['hasReaction'] as bool?;
    _postImage = getDataList(snapshotData['post_Image']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? postDescription,
  DateTime? timePosted,
  DocumentReference? postedBy,
  String? username,
  bool? hasReaction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_description': postDescription,
      'time_posted': timePosted,
      'posted_by': postedBy,
      'username': username,
      'hasReaction': hasReaction,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.usersLiked, e2?.usersLiked) &&
        e1?.postedBy == e2?.postedBy &&
        e1?.username == e2?.username &&
        e1?.hasReaction == e2?.hasReaction &&
        listEquality.equals(e1?.postImage, e2?.postImage);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.postDescription,
        e?.timePosted,
        e?.usersLiked,
        e?.postedBy,
        e?.username,
        e?.hasReaction,
        e?.postImage
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
