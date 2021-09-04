import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  ///* GET data once from a specified path
  Future<Map<String, dynamic>?> getData(String collectionPath) async {
    assert(collectionPath.isNotEmpty);
    final doc = await firestore.doc(collectionPath).get();
    return doc.data();
  }

  ///* GET data once from a specified path with query
  Future<Map<String, dynamic>?> getDataWhere(
      String collectionPath, String key, dynamic value) async {
    assert(collectionPath.isNotEmpty);
    final snapshot = await firestore
        .collection(collectionPath)
        .where(key, isEqualTo: value)
        .get();
    print('getData: ${snapshot.docs.length}');
    return snapshot.docs.first.data();
  }

  ///* CHECK if data is unique or not with query
  Future<bool> checkUnique(
      String collectionPath, String key, dynamic value) async {
    assert(collectionPath.isNotEmpty);
    final snapshot = await firestore
        .collection(collectionPath)
        .where(key, isEqualTo: value)
        .get();
    return snapshot.docs.length == 0;
  }

  ///* GET stream of specified collection
  Stream<QuerySnapshot> getStream(String collectionPath) {
    assert(collectionPath.isNotEmpty);
    return firestore.collection(collectionPath).snapshots();
  }

  ///* GET stream of specified collection with query
  Stream<QuerySnapshot<Map<String, dynamic>?>> getStreamWhere(
      String collectionPath, String key, dynamic value) {
    assert(collectionPath.isNotEmpty);
    return firestore
        .collection(collectionPath)
        .where(key, isEqualTo: value)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>?>> getHallStreamWhere(
      String collectionPath, String key, dynamic value) {
    assert(collectionPath.isNotEmpty);
    return firestore
        .collection(collectionPath)
        .where(key, arrayContains: value)
        .snapshots();
  }

  ///* GET stream of specified collection with multiple queries
  Stream<QuerySnapshot> getStreamWhereMultiple(
      String collectionPath, {
        required String key1,
        dynamic value1,
        required String key2,
        dynamic value2,
      }) {
    assert(collectionPath.isNotEmpty);
    return firestore
        .collection(collectionPath)
        .where(key1, isEqualTo: value1)
        .where(key2, isEqualTo: value2)
        .snapshots();
  }

  ///* UPDATE or INSERT data to a specified path
  Future<void> upsert(String path, Map<String, dynamic> data) async {
    assert(path.isNotEmpty && data.isNotEmpty);
    await firestore.doc(path).set(data, SetOptions(merge: true));
  }

  ///* DELETE data from the specified path
  Future<void> delete(String path) async {
    assert(path.isNotEmpty);
    await firestore.doc(path).delete();
  }
}
