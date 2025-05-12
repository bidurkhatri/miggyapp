// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FriendRequestStruct extends FFFirebaseStruct {
  FriendRequestStruct({
    DocumentReference? to,
    DateTime? timeSent,
    bool? accepted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _to = to,
        _timeSent = timeSent,
        _accepted = accepted,
        super(firestoreUtilData);

  // "to" field.
  DocumentReference? _to;
  DocumentReference? get to => _to;
  set to(DocumentReference? val) => _to = val;

  bool hasTo() => _to != null;

  // "timeSent" field.
  DateTime? _timeSent;
  DateTime? get timeSent => _timeSent;
  set timeSent(DateTime? val) => _timeSent = val;

  bool hasTimeSent() => _timeSent != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  set accepted(bool? val) => _accepted = val;

  bool hasAccepted() => _accepted != null;

  static FriendRequestStruct fromMap(Map<String, dynamic> data) =>
      FriendRequestStruct(
        to: data['to'] as DocumentReference?,
        timeSent: data['timeSent'] as DateTime?,
        accepted: data['accepted'] as bool?,
      );

  static FriendRequestStruct? maybeFromMap(dynamic data) => data is Map
      ? FriendRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'to': _to,
        'timeSent': _timeSent,
        'accepted': _accepted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'to': serializeParam(
          _to,
          ParamType.DocumentReference,
        ),
        'timeSent': serializeParam(
          _timeSent,
          ParamType.DateTime,
        ),
        'accepted': serializeParam(
          _accepted,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FriendRequestStruct fromSerializableMap(Map<String, dynamic> data) =>
      FriendRequestStruct(
        to: deserializeParam(
          data['to'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user_profile'],
        ),
        timeSent: deserializeParam(
          data['timeSent'],
          ParamType.DateTime,
          false,
        ),
        accepted: deserializeParam(
          data['accepted'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FriendRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FriendRequestStruct &&
        to == other.to &&
        timeSent == other.timeSent &&
        accepted == other.accepted;
  }

  @override
  int get hashCode => const ListEquality().hash([to, timeSent, accepted]);
}

FriendRequestStruct createFriendRequestStruct({
  DocumentReference? to,
  DateTime? timeSent,
  bool? accepted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FriendRequestStruct(
      to: to,
      timeSent: timeSent,
      accepted: accepted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FriendRequestStruct? updateFriendRequestStruct(
  FriendRequestStruct? friendRequest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    friendRequest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFriendRequestStructData(
  Map<String, dynamic> firestoreData,
  FriendRequestStruct? friendRequest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (friendRequest == null) {
    return;
  }
  if (friendRequest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && friendRequest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final friendRequestData =
      getFriendRequestFirestoreData(friendRequest, forFieldValue);
  final nestedData =
      friendRequestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = friendRequest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFriendRequestFirestoreData(
  FriendRequestStruct? friendRequest, [
  bool forFieldValue = false,
]) {
  if (friendRequest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(friendRequest.toMap());

  // Add any Firestore field values
  friendRequest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFriendRequestListFirestoreData(
  List<FriendRequestStruct>? friendRequests,
) =>
    friendRequests
        ?.map((e) => getFriendRequestFirestoreData(e, true))
        .toList() ??
    [];
