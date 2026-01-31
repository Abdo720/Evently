import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:to_do/Models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/Models/user_model.dart';

class Firebasefunctions {
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, _) => value.tojson(),
    );
  }

  static CollectionReference<EventModel> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection("Events")
        .withConverter<EventModel>(
      fromFirestore: (snapshot, _) {
        return EventModel.fromjeson(snapshot.data()!);
      },
      toFirestore: (value, _) => value.tojson(),
    );
  }

  static Future<UserModel?> getCurrentUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;
    final doc = await getUsersCollection().doc(uid).get();
    return doc.data();
  }

  static Stream<QuerySnapshot<EventModel>> getFavorite() {
    var collection = getEventsCollection();
    return collection.where("isFavorite", isEqualTo: true).where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
  }

  static Stream<QuerySnapshot<EventModel>> getEvent({String? category}) {
    var collection = getEventsCollection();
    if (category == null || category == "ALL") {
      return collection.where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
    } else {
      return collection.where("category", isEqualTo: category).where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
    }
  }

  static Future<void> updateEvent(EventModel event) {
    var collection = getEventsCollection();
    var refDoc = collection.doc(event.id);
    return refDoc.update(event.tojson());
  }

  static Future<void> deleteEvent(EventModel event) {
    var collection = getEventsCollection();
    var refDoc = collection.doc(event.id);
    return refDoc.delete();
  }

  static Future<void> createEvent(EventModel event) {
    var collection = getEventsCollection();
    var refColl = collection.doc();
    event.id = refColl.id;
    return refColl.set(event);
  }

  static Future<void> saveUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static createUser(
    String email,
    String password,
    String name, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      saveUser(UserModel(name: name, email: email, id: credential.user!.uid));
      onSuccess();
      await credential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      } else {
        onError(e.code);
      }
    } catch (e) {
      onError(e);
    }
  }

  static signIn(
    String email,
    String password, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Email Not Verified");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      } else {
        onError(e.code);
      }
    } catch (e) {
      onError(e);
    }
  }

  static resetPassword(
    String email, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else {
        onError(e.code);
      }
    } catch (e) {
      onError(e);
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
