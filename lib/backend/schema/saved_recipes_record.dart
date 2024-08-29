import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedRecipesRecord extends FirestoreRecord {
  SavedRecipesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "recipe_name" field.
  String? _recipeName;
  String get recipeName => _recipeName ?? '';
  bool hasRecipeName() => _recipeName != null;

  // "instructions" field.
  List<String>? _instructions;
  List<String> get instructions => _instructions ?? const [];
  bool hasInstructions() => _instructions != null;

  // "time_to_cook" field.
  int? _timeToCook;
  int get timeToCook => _timeToCook ?? 0;
  bool hasTimeToCook() => _timeToCook != null;

  // "price_to_cook" field.
  int? _priceToCook;
  int get priceToCook => _priceToCook ?? 0;
  bool hasPriceToCook() => _priceToCook != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _recipeName = snapshotData['recipe_name'] as String?;
    _instructions = getDataList(snapshotData['instructions']);
    _timeToCook = castToType<int>(snapshotData['time_to_cook']);
    _priceToCook = castToType<int>(snapshotData['price_to_cook']);
    _ingredients = getDataList(snapshotData['ingredients']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uid = snapshotData['uid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('saved_recipes');

  static Stream<SavedRecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedRecipesRecord.fromSnapshot(s));

  static Future<SavedRecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedRecipesRecord.fromSnapshot(s));

  static SavedRecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedRecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedRecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedRecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedRecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedRecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedRecipesRecordData({
  String? recipeName,
  int? timeToCook,
  int? priceToCook,
  DateTime? createdAt,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recipe_name': recipeName,
      'time_to_cook': timeToCook,
      'price_to_cook': priceToCook,
      'created_at': createdAt,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavedRecipesRecordDocumentEquality
    implements Equality<SavedRecipesRecord> {
  const SavedRecipesRecordDocumentEquality();

  @override
  bool equals(SavedRecipesRecord? e1, SavedRecipesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.recipeName == e2?.recipeName &&
        listEquality.equals(e1?.instructions, e2?.instructions) &&
        e1?.timeToCook == e2?.timeToCook &&
        e1?.priceToCook == e2?.priceToCook &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(SavedRecipesRecord? e) => const ListEquality().hash([
        e?.recipeName,
        e?.instructions,
        e?.timeToCook,
        e?.priceToCook,
        e?.ingredients,
        e?.createdAt,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is SavedRecipesRecord;
}
