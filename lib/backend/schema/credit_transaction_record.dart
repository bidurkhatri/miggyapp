import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditTransactionRecord extends FirestoreRecord {
  CreditTransactionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount_of_credit" field.
  double? _amountOfCredit;
  double get amountOfCredit => _amountOfCredit ?? 0.0;
  bool hasAmountOfCredit() => _amountOfCredit != null;

  // "date_transferred" field.
  DateTime? _dateTransferred;
  DateTime? get dateTransferred => _dateTransferred;
  bool hasDateTransferred() => _dateTransferred != null;

  // "admin_concerned" field.
  bool? _adminConcerned;
  bool get adminConcerned => _adminConcerned ?? false;
  bool hasAdminConcerned() => _adminConcerned != null;

  // "credit" field.
  bool? _credit;
  bool get credit => _credit ?? false;
  bool hasCredit() => _credit != null;

  // "second_party" field.
  String? _secondParty;
  String get secondParty => _secondParty ?? '';
  bool hasSecondParty() => _secondParty != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _amountOfCredit = castToType<double>(snapshotData['amount_of_credit']);
    _dateTransferred = snapshotData['date_transferred'] as DateTime?;
    _adminConcerned = snapshotData['admin_concerned'] as bool?;
    _credit = snapshotData['credit'] as bool?;
    _secondParty = snapshotData['second_party'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('credit_transaction')
          : FirebaseFirestore.instance.collectionGroup('credit_transaction');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('credit_transaction').doc(id);

  static Stream<CreditTransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditTransactionRecord.fromSnapshot(s));

  static Future<CreditTransactionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CreditTransactionRecord.fromSnapshot(s));

  static CreditTransactionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditTransactionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditTransactionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditTransactionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditTransactionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditTransactionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditTransactionRecordData({
  double? amountOfCredit,
  DateTime? dateTransferred,
  bool? adminConcerned,
  bool? credit,
  String? secondParty,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount_of_credit': amountOfCredit,
      'date_transferred': dateTransferred,
      'admin_concerned': adminConcerned,
      'credit': credit,
      'second_party': secondParty,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditTransactionRecordDocumentEquality
    implements Equality<CreditTransactionRecord> {
  const CreditTransactionRecordDocumentEquality();

  @override
  bool equals(CreditTransactionRecord? e1, CreditTransactionRecord? e2) {
    return e1?.amountOfCredit == e2?.amountOfCredit &&
        e1?.dateTransferred == e2?.dateTransferred &&
        e1?.adminConcerned == e2?.adminConcerned &&
        e1?.credit == e2?.credit &&
        e1?.secondParty == e2?.secondParty;
  }

  @override
  int hash(CreditTransactionRecord? e) => const ListEquality().hash([
        e?.amountOfCredit,
        e?.dateTransferred,
        e?.adminConcerned,
        e?.credit,
        e?.secondParty
      ]);

  @override
  bool isValidKey(Object? o) => o is CreditTransactionRecord;
}
