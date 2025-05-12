import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _FriendRequests = prefs
              .getStringList('ff_FriendRequests')
              ?.map((x) {
                try {
                  return FriendRequestStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _FriendRequests;
    });
    _safeInit(() {
      _postPhotos = prefs.getStringList('ff_postPhotos') ?? _postPhotos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _photo = '';
  String get photo => _photo;
  set photo(String value) {
    _photo = value;
  }

  List<FriendRequestStruct> _FriendRequests = [];
  List<FriendRequestStruct> get FriendRequests => _FriendRequests;
  set FriendRequests(List<FriendRequestStruct> value) {
    _FriendRequests = value;
    prefs.setStringList(
        'ff_FriendRequests', value.map((x) => x.serialize()).toList());
  }

  void addToFriendRequests(FriendRequestStruct value) {
    FriendRequests.add(value);
    prefs.setStringList('ff_FriendRequests',
        _FriendRequests.map((x) => x.serialize()).toList());
  }

  void removeFromFriendRequests(FriendRequestStruct value) {
    FriendRequests.remove(value);
    prefs.setStringList('ff_FriendRequests',
        _FriendRequests.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFriendRequests(int index) {
    FriendRequests.removeAt(index);
    prefs.setStringList('ff_FriendRequests',
        _FriendRequests.map((x) => x.serialize()).toList());
  }

  void updateFriendRequestsAtIndex(
    int index,
    FriendRequestStruct Function(FriendRequestStruct) updateFn,
  ) {
    FriendRequests[index] = updateFn(_FriendRequests[index]);
    prefs.setStringList('ff_FriendRequests',
        _FriendRequests.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFriendRequests(int index, FriendRequestStruct value) {
    FriendRequests.insert(index, value);
    prefs.setStringList('ff_FriendRequests',
        _FriendRequests.map((x) => x.serialize()).toList());
  }

  List<String> _postPhotos = [];
  List<String> get postPhotos => _postPhotos;
  set postPhotos(List<String> value) {
    _postPhotos = value;
    prefs.setStringList('ff_postPhotos', value);
  }

  void addToPostPhotos(String value) {
    postPhotos.add(value);
    prefs.setStringList('ff_postPhotos', _postPhotos);
  }

  void removeFromPostPhotos(String value) {
    postPhotos.remove(value);
    prefs.setStringList('ff_postPhotos', _postPhotos);
  }

  void removeAtIndexFromPostPhotos(int index) {
    postPhotos.removeAt(index);
    prefs.setStringList('ff_postPhotos', _postPhotos);
  }

  void updatePostPhotosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    postPhotos[index] = updateFn(_postPhotos[index]);
    prefs.setStringList('ff_postPhotos', _postPhotos);
  }

  void insertAtIndexInPostPhotos(int index, String value) {
    postPhotos.insert(index, value);
    prefs.setStringList('ff_postPhotos', _postPhotos);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
