import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudStorage {
  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;

  final posts = FirebaseFirestore.instance.collection(
    "notes",
  );
}
