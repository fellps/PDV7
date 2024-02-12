import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class Pdv7AuthUser {
  Pdv7AuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<Pdv7AuthUser> pdv7AuthUserSubject =
    BehaviorSubject.seeded(Pdv7AuthUser(loggedIn: false));
Stream<Pdv7AuthUser> pdv7AuthUserStream() =>
    pdv7AuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
