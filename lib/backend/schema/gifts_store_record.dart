import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GiftsStoreRecord extends FirestoreRecord {
  GiftsStoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "giftName" field.
  String? _giftName;
  String get giftName => _giftName ?? '';
  bool hasGiftName() => _giftName != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _giftName = snapshotData['giftName'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('giftsStore');

  static Stream<GiftsStoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GiftsStoreRecord.fromSnapshot(s));

  static Future<GiftsStoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GiftsStoreRecord.fromSnapshot(s));

  static GiftsStoreRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GiftsStoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GiftsStoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GiftsStoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GiftsStoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GiftsStoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGiftsStoreRecordData({
  String? image,
  String? giftName,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'giftName': giftName,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class GiftsStoreRecordDocumentEquality implements Equality<GiftsStoreRecord> {
  const GiftsStoreRecordDocumentEquality();

  @override
  bool equals(GiftsStoreRecord? e1, GiftsStoreRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.giftName == e2?.giftName &&
        e1?.price == e2?.price;
  }

  @override
  int hash(GiftsStoreRecord? e) =>
      const ListEquality().hash([e?.image, e?.giftName, e?.price]);

  @override
  bool isValidKey(Object? o) => o is GiftsStoreRecord;
}
