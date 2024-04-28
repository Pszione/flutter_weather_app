// import 'dart:developer';
//
// import '../../../../imports.dart';
//
// class AuthDatasourcePlatforge implements IAuthDatasource {
//   FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
//
//   static const _collectionName = 'auth';
//
//   @override
//   bool isLoggedIn() {
//     return firebaseAuth.isSignedIn;
//   }
//
//   @override
//   String getUserId() {
//     return firebaseAuth.uid!;
//   }
//
//   @override
//   String getToken() {
//     return firebaseAuth.token!;
//   }
//
//   @override
//   Future<void> logout() async {
//     if (!isLoggedIn()) {
//       return;
//     }
//     await firebaseAuth.logout();
//   }
// }
