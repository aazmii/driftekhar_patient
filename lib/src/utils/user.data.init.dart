import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driftekhar_patient/src/services/auth.service/auth.service.dart';
import 'package:driftekhar_patient/src/utils/device.info/device.info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Initialize user data in Firestore, if user does not exist in the
/// 'users' collection, create a new document with the user's FCM token
/// and device id. If the user exists, check if the FCM token has changed,
/// if it has, update the document with the new token.
Future initUserData() async {
  // if (FirebaseAuth.instance.currentUser != null) return;
  await AuthService.signInAnonymously();
  final token = await FirebaseMessaging.instance.getToken();
  final deviceId = await getUniqueDeviceId();

  //check 'User' Collection if user exists or not
  final docSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(deviceId).get();
  if (docSnapshot.exists) {
    //check 'FCMToken' Collection if fcmToken change or not
    if (docSnapshot.data()?['FCMToken'] != token) {
      await docSnapshot.reference.update({
        // 'userId': user?.uid,
        'FCMToken': token,
        'lastUpdated': FieldValue.serverTimestamp(),
      });
    }
  } else {
    FirebaseFirestore.instance.collection('users').doc(deviceId).set({
      // 'userId': user?.uid,
      'FCMToken': token,
      'lastUpdated': FieldValue.serverTimestamp(),
    });
  }
}
