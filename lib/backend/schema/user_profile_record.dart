import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileRecord extends FirestoreRecord {
  UserProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "security_question" field.
  String? _securityQuestion;
  String get securityQuestion => _securityQuestion ?? '';
  bool hasSecurityQuestion() => _securityQuestion != null;

  // "answer_security" field.
  String? _answerSecurity;
  String get answerSecurity => _answerSecurity ?? '';
  bool hasAnswerSecurity() => _answerSecurity != null;

  // "user_interests" field.
  List<String>? _userInterests;
  List<String> get userInterests => _userInterests ?? const [];
  bool hasUserInterests() => _userInterests != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "banner_url" field.
  String? _bannerUrl;
  String get bannerUrl => _bannerUrl ?? '';
  bool hasBannerUrl() => _bannerUrl != null;

  // "credit_balance" field.
  double? _creditBalance;
  double get creditBalance => _creditBalance ?? 0.0;
  bool hasCreditBalance() => _creditBalance != null;

  // "my_badges" field.
  List<BadgesStruct>? _myBadges;
  List<BadgesStruct> get myBadges => _myBadges ?? const [];
  bool hasMyBadges() => _myBadges != null;

  // "blocked_users" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "in_chatrooms" field.
  List<DocumentReference>? _inChatrooms;
  List<DocumentReference> get inChatrooms => _inChatrooms ?? const [];
  bool hasInChatrooms() => _inChatrooms != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "levelling" field.
  int? _levelling;
  int get levelling => _levelling ?? 0;
  bool hasLevelling() => _levelling != null;

  // "last_logged_In" field.
  DateTime? _lastLoggedIn;
  DateTime? get lastLoggedIn => _lastLoggedIn;
  bool hasLastLoggedIn() => _lastLoggedIn != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "userBio" field.
  String? _userBio;
  String get userBio => _userBio ?? '';
  bool hasUserBio() => _userBio != null;

  // "isOnline" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  bool hasIsOnline() => _isOnline != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _gender = snapshotData['gender'] as String?;
    _country = snapshotData['country'] as String?;
    _securityQuestion = snapshotData['security_question'] as String?;
    _answerSecurity = snapshotData['answer_security'] as String?;
    _userInterests = getDataList(snapshotData['user_interests']);
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _bannerUrl = snapshotData['banner_url'] as String?;
    _creditBalance = castToType<double>(snapshotData['credit_balance']);
    _myBadges = getStructList(
      snapshotData['my_badges'],
      BadgesStruct.fromMap,
    );
    _blockedUsers = getDataList(snapshotData['blocked_users']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _inChatrooms = getDataList(snapshotData['in_chatrooms']);
    _fullName = snapshotData['full_name'] as String?;
    _levelling = castToType<int>(snapshotData['levelling']);
    _lastLoggedIn = snapshotData['last_logged_In'] as DateTime?;
    _friends = getDataList(snapshotData['friends']);
    _userBio = snapshotData['userBio'] as String?;
    _isOnline = snapshotData['isOnline'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_profile');

  static Stream<UserProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProfileRecord.fromSnapshot(s));

  static Future<UserProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProfileRecord.fromSnapshot(s));

  static UserProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProfileRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? gender,
  String? country,
  String? securityQuestion,
  String? answerSecurity,
  String? bannerUrl,
  double? creditBalance,
  String? phoneNumber,
  String? fullName,
  int? levelling,
  DateTime? lastLoggedIn,
  String? userBio,
  bool? isOnline,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'gender': gender,
      'country': country,
      'security_question': securityQuestion,
      'answer_security': answerSecurity,
      'banner_url': bannerUrl,
      'credit_balance': creditBalance,
      'phone_number': phoneNumber,
      'full_name': fullName,
      'levelling': levelling,
      'last_logged_In': lastLoggedIn,
      'userBio': userBio,
      'isOnline': isOnline,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserProfileRecordDocumentEquality implements Equality<UserProfileRecord> {
  const UserProfileRecordDocumentEquality();

  @override
  bool equals(UserProfileRecord? e1, UserProfileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.gender == e2?.gender &&
        e1?.country == e2?.country &&
        e1?.securityQuestion == e2?.securityQuestion &&
        e1?.answerSecurity == e2?.answerSecurity &&
        listEquality.equals(e1?.userInterests, e2?.userInterests) &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.bannerUrl == e2?.bannerUrl &&
        e1?.creditBalance == e2?.creditBalance &&
        listEquality.equals(e1?.myBadges, e2?.myBadges) &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.inChatrooms, e2?.inChatrooms) &&
        e1?.fullName == e2?.fullName &&
        e1?.levelling == e2?.levelling &&
        e1?.lastLoggedIn == e2?.lastLoggedIn &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        e1?.userBio == e2?.userBio &&
        e1?.isOnline == e2?.isOnline;
  }

  @override
  int hash(UserProfileRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.gender,
        e?.country,
        e?.securityQuestion,
        e?.answerSecurity,
        e?.userInterests,
        e?.followers,
        e?.following,
        e?.bannerUrl,
        e?.creditBalance,
        e?.myBadges,
        e?.blockedUsers,
        e?.phoneNumber,
        e?.inChatrooms,
        e?.fullName,
        e?.levelling,
        e?.lastLoggedIn,
        e?.friends,
        e?.userBio,
        e?.isOnline
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProfileRecord;
}
