import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WeTheSauceFirebaseUser {
  WeTheSauceFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WeTheSauceFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WeTheSauceFirebaseUser> weTheSauceFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WeTheSauceFirebaseUser>(
            (user) => currentUser = WeTheSauceFirebaseUser(user));
