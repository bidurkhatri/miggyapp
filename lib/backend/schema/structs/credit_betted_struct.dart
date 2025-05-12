// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// This data type stores information about the value of the bets placed by
/// each user in a game session.
///
/// It contains the amount of credits placed and the card the bet was placed
/// for e.g {399533 credits on Diamond}
class CreditBettedStruct extends FFFirebaseStruct {
  CreditBettedStruct({
    double? amountBetPlaced,
    String? cardPlacedOn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _amountBetPlaced = amountBetPlaced,
        _cardPlacedOn = cardPlacedOn,
        super(firestoreUtilData);

  // "AmountBetPlaced" field.
  double? _amountBetPlaced;
  double get amountBetPlaced => _amountBetPlaced ?? 0.0;
  set amountBetPlaced(double? val) => _amountBetPlaced = val;

  void incrementAmountBetPlaced(double amount) =>
      amountBetPlaced = amountBetPlaced + amount;

  bool hasAmountBetPlaced() => _amountBetPlaced != null;

  // "cardPlacedOn" field.
  String? _cardPlacedOn;
  String get cardPlacedOn => _cardPlacedOn ?? '';
  set cardPlacedOn(String? val) => _cardPlacedOn = val;

  bool hasCardPlacedOn() => _cardPlacedOn != null;

  static CreditBettedStruct fromMap(Map<String, dynamic> data) =>
      CreditBettedStruct(
        amountBetPlaced: castToType<double>(data['AmountBetPlaced']),
        cardPlacedOn: data['cardPlacedOn'] as String?,
      );

  static CreditBettedStruct? maybeFromMap(dynamic data) => data is Map
      ? CreditBettedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'AmountBetPlaced': _amountBetPlaced,
        'cardPlacedOn': _cardPlacedOn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AmountBetPlaced': serializeParam(
          _amountBetPlaced,
          ParamType.double,
        ),
        'cardPlacedOn': serializeParam(
          _cardPlacedOn,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreditBettedStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreditBettedStruct(
        amountBetPlaced: deserializeParam(
          data['AmountBetPlaced'],
          ParamType.double,
          false,
        ),
        cardPlacedOn: deserializeParam(
          data['cardPlacedOn'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreditBettedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreditBettedStruct &&
        amountBetPlaced == other.amountBetPlaced &&
        cardPlacedOn == other.cardPlacedOn;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([amountBetPlaced, cardPlacedOn]);
}

CreditBettedStruct createCreditBettedStruct({
  double? amountBetPlaced,
  String? cardPlacedOn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreditBettedStruct(
      amountBetPlaced: amountBetPlaced,
      cardPlacedOn: cardPlacedOn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreditBettedStruct? updateCreditBettedStruct(
  CreditBettedStruct? creditBetted, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    creditBetted
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreditBettedStructData(
  Map<String, dynamic> firestoreData,
  CreditBettedStruct? creditBetted,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (creditBetted == null) {
    return;
  }
  if (creditBetted.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && creditBetted.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creditBettedData =
      getCreditBettedFirestoreData(creditBetted, forFieldValue);
  final nestedData =
      creditBettedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = creditBetted.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreditBettedFirestoreData(
  CreditBettedStruct? creditBetted, [
  bool forFieldValue = false,
]) {
  if (creditBetted == null) {
    return {};
  }
  final firestoreData = mapToFirestore(creditBetted.toMap());

  // Add any Firestore field values
  creditBetted.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreditBettedListFirestoreData(
  List<CreditBettedStruct>? creditBetteds,
) =>
    creditBetteds?.map((e) => getCreditBettedFirestoreData(e, true)).toList() ??
    [];
