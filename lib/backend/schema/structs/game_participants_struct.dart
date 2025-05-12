// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GameParticipantsStruct extends FFFirebaseStruct {
  GameParticipantsStruct({
    DocumentReference? id,
    int? betAmount,
    DateTime? joinedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _betAmount = betAmount,
        _joinedAt = joinedAt,
        super(firestoreUtilData);

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  set id(DocumentReference? val) => _id = val;

  bool hasId() => _id != null;

  // "betAmount" field.
  int? _betAmount;
  int get betAmount => _betAmount ?? 0;
  set betAmount(int? val) => _betAmount = val;

  void incrementBetAmount(int amount) => betAmount = betAmount + amount;

  bool hasBetAmount() => _betAmount != null;

  // "joinedAt" field.
  DateTime? _joinedAt;
  DateTime? get joinedAt => _joinedAt;
  set joinedAt(DateTime? val) => _joinedAt = val;

  bool hasJoinedAt() => _joinedAt != null;

  static GameParticipantsStruct fromMap(Map<String, dynamic> data) =>
      GameParticipantsStruct(
        id: data['id'] as DocumentReference?,
        betAmount: castToType<int>(data['betAmount']),
        joinedAt: data['joinedAt'] as DateTime?,
      );

  static GameParticipantsStruct? maybeFromMap(dynamic data) => data is Map
      ? GameParticipantsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'betAmount': _betAmount,
        'joinedAt': _joinedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.DocumentReference,
        ),
        'betAmount': serializeParam(
          _betAmount,
          ParamType.int,
        ),
        'joinedAt': serializeParam(
          _joinedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static GameParticipantsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GameParticipantsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user_profile'],
        ),
        betAmount: deserializeParam(
          data['betAmount'],
          ParamType.int,
          false,
        ),
        joinedAt: deserializeParam(
          data['joinedAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'GameParticipantsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GameParticipantsStruct &&
        id == other.id &&
        betAmount == other.betAmount &&
        joinedAt == other.joinedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([id, betAmount, joinedAt]);
}

GameParticipantsStruct createGameParticipantsStruct({
  DocumentReference? id,
  int? betAmount,
  DateTime? joinedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GameParticipantsStruct(
      id: id,
      betAmount: betAmount,
      joinedAt: joinedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GameParticipantsStruct? updateGameParticipantsStruct(
  GameParticipantsStruct? gameParticipants, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gameParticipants
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGameParticipantsStructData(
  Map<String, dynamic> firestoreData,
  GameParticipantsStruct? gameParticipants,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gameParticipants == null) {
    return;
  }
  if (gameParticipants.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gameParticipants.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gameParticipantsData =
      getGameParticipantsFirestoreData(gameParticipants, forFieldValue);
  final nestedData =
      gameParticipantsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gameParticipants.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGameParticipantsFirestoreData(
  GameParticipantsStruct? gameParticipants, [
  bool forFieldValue = false,
]) {
  if (gameParticipants == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gameParticipants.toMap());

  // Add any Firestore field values
  gameParticipants.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGameParticipantsListFirestoreData(
  List<GameParticipantsStruct>? gameParticipantss,
) =>
    gameParticipantss
        ?.map((e) => getGameParticipantsFirestoreData(e, true))
        .toList() ??
    [];
