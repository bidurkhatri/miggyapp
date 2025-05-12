// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// This datatype would be passed as an argument passed into the custom
/// function that would calculate the winner of the game session.
class UserBetInfoStruct extends FFFirebaseStruct {
  UserBetInfoStruct({
    DocumentReference? userId,
    List<CreditBettedStruct>? betPlaced,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _betPlaced = betPlaced,
        super(firestoreUtilData);

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  set userId(DocumentReference? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "betPlaced" field.
  List<CreditBettedStruct>? _betPlaced;
  List<CreditBettedStruct> get betPlaced => _betPlaced ?? const [];
  set betPlaced(List<CreditBettedStruct>? val) => _betPlaced = val;

  void updateBetPlaced(Function(List<CreditBettedStruct>) updateFn) {
    updateFn(_betPlaced ??= []);
  }

  bool hasBetPlaced() => _betPlaced != null;

  static UserBetInfoStruct fromMap(Map<String, dynamic> data) =>
      UserBetInfoStruct(
        userId: data['userId'] as DocumentReference?,
        betPlaced: getStructList(
          data['betPlaced'],
          CreditBettedStruct.fromMap,
        ),
      );

  static UserBetInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? UserBetInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'betPlaced': _betPlaced?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.DocumentReference,
        ),
        'betPlaced': serializeParam(
          _betPlaced,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserBetInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserBetInfoStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user_profile'],
        ),
        betPlaced: deserializeStructParam<CreditBettedStruct>(
          data['betPlaced'],
          ParamType.DataStruct,
          true,
          structBuilder: CreditBettedStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserBetInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserBetInfoStruct &&
        userId == other.userId &&
        listEquality.equals(betPlaced, other.betPlaced);
  }

  @override
  int get hashCode => const ListEquality().hash([userId, betPlaced]);
}

UserBetInfoStruct createUserBetInfoStruct({
  DocumentReference? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserBetInfoStruct(
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserBetInfoStruct? updateUserBetInfoStruct(
  UserBetInfoStruct? userBetInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userBetInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserBetInfoStructData(
  Map<String, dynamic> firestoreData,
  UserBetInfoStruct? userBetInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userBetInfo == null) {
    return;
  }
  if (userBetInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userBetInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userBetInfoData =
      getUserBetInfoFirestoreData(userBetInfo, forFieldValue);
  final nestedData =
      userBetInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userBetInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserBetInfoFirestoreData(
  UserBetInfoStruct? userBetInfo, [
  bool forFieldValue = false,
]) {
  if (userBetInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userBetInfo.toMap());

  // Add any Firestore field values
  userBetInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserBetInfoListFirestoreData(
  List<UserBetInfoStruct>? userBetInfos,
) =>
    userBetInfos?.map((e) => getUserBetInfoFirestoreData(e, true)).toList() ??
    [];
