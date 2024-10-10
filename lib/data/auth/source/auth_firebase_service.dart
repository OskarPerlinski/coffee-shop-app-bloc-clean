import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/data/auth/models/user_creation_req.dart';
import 'package:coffee_shop/data/auth/models/user_signin_req.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set(
        {
          'username': user.username,
          'email': user.email,
        },
      );

      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email already in use';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credentail') {
        message = 'Wrong password or email';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(
        'Password reset email is sent',
      );
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
}
