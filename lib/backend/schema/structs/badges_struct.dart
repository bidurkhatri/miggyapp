// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// data type for different achievable badges within the app
class BadgesStruct extends FFFirebaseStruct {
  BadgesStruct({
    String? badgeName,
    String? badgeImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _badgeName = badgeName,
        _badgeImage = badgeImage,
        super(firestoreUtilData);

  // "badge_name" field.
  String? _badgeName;
  String get badgeName => _badgeName ?? '';
  set badgeName(String? val) => _badgeName = val;

  bool hasBadgeName() => _badgeName != null;

  // "badge_image" field.
  String? _badgeImage;
  String get badgeImage => _badgeImage ?? '';
  set badgeImage(String? val) => _badgeImage = val;

  bool hasBadgeImage() => _badgeImage != null;

  static BadgesStruct fromMap(Map<String, dynamic> data) => BadgesStruct(
        badgeName: data['badge_name'] as String?,
        badgeImage: data['badge_image'] as String?,
      );

  static BadgesStruct? maybeFromMap(dynamic data) =>
      data is Map ? BadgesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'badge_name': _badgeName,
        'badge_image': _badgeImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'badge_name': serializeParam(
          _badgeName,
          ParamType.String,
        ),
        'badge_image': serializeParam(
          _badgeImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static BadgesStruct fromSerializableMap(Map<String, dynamic> data) =>
      BadgesStruct(
        badgeName: deserializeParam(
          data['badge_name'],
          ParamType.String,
          false,
        ),
        badgeImage: deserializeParam(
          data['badge_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BadgesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BadgesStruct &&
        badgeName == other.badgeName &&
        badgeImage == other.badgeImage;
  }

  @override
  int get hashCode => const ListEquality().hash([badgeName, badgeImage]);
}

BadgesStruct createBadgesStruct({
  String? badgeName,
  String? badgeImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BadgesStruct(
      badgeName: badgeName,
      badgeImage: badgeImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BadgesStruct? updateBadgesStruct(
  BadgesStruct? badges, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    badges
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBadgesStructData(
  Map<String, dynamic> firestoreData,
  BadgesStruct? badges,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (badges == null) {
    return;
  }
  if (badges.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && badges.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final badgesData = getBadgesFirestoreData(badges, forFieldValue);
  final nestedData = badgesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = badges.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBadgesFirestoreData(
  BadgesStruct? badges, [
  bool forFieldValue = false,
]) {
  if (badges == null) {
    return {};
  }
  final firestoreData = mapToFirestore(badges.toMap());

  // Add any Firestore field values
  badges.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBadgesListFirestoreData(
  List<BadgesStruct>? badgess,
) =>
    badgess?.map((e) => getBadgesFirestoreData(e, true)).toList() ?? [];
