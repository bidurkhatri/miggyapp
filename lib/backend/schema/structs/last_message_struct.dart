// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// Information about the last message that was sent to a specific room
class LastMessageStruct extends FFFirebaseStruct {
  LastMessageStruct({
    String? lastMessage,
    DateTime? lastMessageTime,
    DocumentReference? lastMessageSentBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lastMessage = lastMessage,
        _lastMessageTime = lastMessageTime,
        _lastMessageSentBy = lastMessageSentBy,
        super(firestoreUtilData);

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  set lastMessage(String? val) => _lastMessage = val;

  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  set lastMessageTime(DateTime? val) => _lastMessageTime = val;

  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_sentBy" field.
  DocumentReference? _lastMessageSentBy;
  DocumentReference? get lastMessageSentBy => _lastMessageSentBy;
  set lastMessageSentBy(DocumentReference? val) => _lastMessageSentBy = val;

  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  static LastMessageStruct fromMap(Map<String, dynamic> data) =>
      LastMessageStruct(
        lastMessage: data['last_message'] as String?,
        lastMessageTime: data['last_message_time'] as DateTime?,
        lastMessageSentBy: data['last_message_sentBy'] as DocumentReference?,
      );

  static LastMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? LastMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'last_message': _lastMessage,
        'last_message_time': _lastMessageTime,
        'last_message_sentBy': _lastMessageSentBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'last_message': serializeParam(
          _lastMessage,
          ParamType.String,
        ),
        'last_message_time': serializeParam(
          _lastMessageTime,
          ParamType.DateTime,
        ),
        'last_message_sentBy': serializeParam(
          _lastMessageSentBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static LastMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      LastMessageStruct(
        lastMessage: deserializeParam(
          data['last_message'],
          ParamType.String,
          false,
        ),
        lastMessageTime: deserializeParam(
          data['last_message_time'],
          ParamType.DateTime,
          false,
        ),
        lastMessageSentBy: deserializeParam(
          data['last_message_sentBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user_profile'],
        ),
      );

  @override
  String toString() => 'LastMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LastMessageStruct &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        lastMessageSentBy == other.lastMessageSentBy;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([lastMessage, lastMessageTime, lastMessageSentBy]);
}

LastMessageStruct createLastMessageStruct({
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LastMessageStruct(
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      lastMessageSentBy: lastMessageSentBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LastMessageStruct? updateLastMessageStruct(
  LastMessageStruct? lastMessageStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lastMessageStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLastMessageStructData(
  Map<String, dynamic> firestoreData,
  LastMessageStruct? lastMessageStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lastMessageStruct == null) {
    return;
  }
  if (lastMessageStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lastMessageStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lastMessageStructData =
      getLastMessageFirestoreData(lastMessageStruct, forFieldValue);
  final nestedData =
      lastMessageStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lastMessageStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLastMessageFirestoreData(
  LastMessageStruct? lastMessageStruct, [
  bool forFieldValue = false,
]) {
  if (lastMessageStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lastMessageStruct.toMap());

  // Add any Firestore field values
  lastMessageStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLastMessageListFirestoreData(
  List<LastMessageStruct>? lastMessageStructs,
) =>
    lastMessageStructs
        ?.map((e) => getLastMessageFirestoreData(e, true))
        .toList() ??
    [];
