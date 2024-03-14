import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projecthealthapp/common/auth.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String userId = Auth().currentUser!.uid;

  Future<void> AddInitialUserData({required String name}) async {
    await _db.collection('users').add({'userId': userId, 'name': name});
  }

  Future<void> addGeneralQuestions({
    required String birthDate,
    required String gender,
    required String height,
    required String weight,
  }) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // currently assuming there's only one document per userId
        String documentId = querySnapshot.docs.first.id;

        await _db.collection('users').doc(documentId).update({
          'birthDate': birthDate,
          'gender': gender,
          'height': height,
          'weight': weight,
        });
      } else {
        print("No document found with userId: $userId");
        // Handle the case where no document matches the userId later
      }
    } catch (e) {
      print("Error adding general questions: $e");
      // Handle the error later
    }
  }

  Future<void> addPreference({required String preference}) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        await _db.collection('users').doc(documentId).update({
          'foodPreference': preference,
        });
      } else {
        print("No document found with userId: $userId");
      }
    } catch (e) {
      print("Error adding general questions: $e");
    }
  }

  Future<void> addHealthProblems({required List<String> healthProblems}) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // currently assuming there's only one document per userId
        String documentId = querySnapshot.docs.first.id;

        await _db.collection('users').doc(documentId).update({
          'healthProblems': healthProblems,
        });
      } else {
        print("No document found with userId: $userId");
        // Handle the case where no document matches the userId later
      }
    } catch (e) {
      print("Error adding general questions: $e");
      // Handle the error later
    }
  }

  Future<void> addGoals({required List<String> goals}) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // currently assuming there's only one document per userId
        String documentId = querySnapshot.docs.first.id;

        await _db.collection('users').doc(documentId).update({
          'goals': goals,
        });
      } else {
        print("No document found with userId: $userId");
        // Handle the case where no document matches the userId later
      }
    } catch (e) {
      print("Error adding general questions: $e");
      // Handle the error later
    }
  }

  Future<void> addTimeSpent({required String timeSpent}) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('users')
          .where('userId', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        await _db.collection('users').doc(documentId).update({
          'timeSpent': timeSpent,
        });
      } else {
        print("No document found with userId: $userId");
      }
    } catch (e) {
      print("Error adding general questions: $e");
    }
  }
}
