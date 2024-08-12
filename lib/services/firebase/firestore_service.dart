import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sustainaville/data/game_save_data.dart';
import 'package:sustainaville/services/auth/auth_service.dart';
import 'package:sustainaville/services/user/user_data.dart';

part 'firestore_service.g.dart';

@riverpod
FirestoreService firestoreService(FirestoreServiceRef ref) {
  return FirestoreService(firestore: FirebaseFirestore.instance);
}

class FirestoreService {
  final FirebaseFirestore firestore;

  CollectionReference<GameSaveData>? get _savedGameRef {
    final userId = AuthService(auth: FirebaseAuth.instance).getUserId();
    if (userId == null) return null;

    return FirebaseFirestore.instance.collection('users').doc(userId).collection('saves').withConverter(
          fromFirestore: (snapshot, _) => GameSaveData.fromJson({'slot': snapshot.id, ...snapshot.data()!}),
          toFirestore: (data, _) => data.toJson()
            ..remove('slot')
            ..['createdAt'] = FieldValue.serverTimestamp(),
        );
  }

  DocumentReference<GameSaveData>? _savedGameSlotRef(String slot) {
    return _savedGameRef?.doc(slot);
  }

  CollectionReference<UserData>? get _usersRef {
    return FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
  }

  DocumentReference<UserData>? get _userRef {
    final userId = AuthService(auth: FirebaseAuth.instance).getUserId();
    if (userId == null) return null;

    return _usersRef?.doc(userId);
  }

  FirestoreService({required this.firestore});

  Future<bool> saveGame(GameSaveData saveData, String slot) async {
    final ref = _savedGameSlotRef(slot);
    if (ref == null) return false;

    bool saved = false;
    try {
      await ref.set(saveData);
      saved = true;
    } catch (e, s) {
      print('Saving Error: $e\n$s');
    }

    return saved;
  }

  Future<GameSaveData?> loadGame(String slot) async {
    final ref = _savedGameSlotRef(slot);
    if (ref == null) return null;

    try {
      final snapshot = await ref.get();
      return snapshot.data();
    } catch (_) {}

    return null;
  }

  Future<List<GameSaveData>> loadAllGames() async {
    final saves = <GameSaveData>[];
    try {
      final snapshots = await _savedGameRef?.get();
      if (snapshots != null) {
        for (final doc in snapshots.docs) {
          try {
            saves.add(doc.data());
          } catch (_) {}
        }
      }
    } catch (_) {}

    return saves;
  }

  Future<UserData?> getUserData() async {
    final ref = _userRef;
    if (ref == null) return null;

    try {
      final snapshot = await ref.get();
      return snapshot.data();
    } catch (_) {}
    return null;
  }

  Future<bool> setUserData(UserData data) async {
    final ref = _userRef;
    if (ref == null) return false;

    bool saved = false;
    try {
      ref.set(data);
      saved = true;
    } catch (_) {}

    return saved;
  }
}
