import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<TicketStruct> _Cart = [];
  List<TicketStruct> get Cart => _Cart;
  set Cart(List<TicketStruct> value) {
    _Cart = value;
  }

  void addToCart(TicketStruct value) {
    _Cart.add(value);
  }

  void removeFromCart(TicketStruct value) {
    _Cart.remove(value);
  }

  void removeAtIndexFromCart(int index) {
    _Cart.removeAt(index);
  }

  void updateCartAtIndex(
    int index,
    TicketStruct Function(TicketStruct) updateFn,
  ) {
    _Cart[index] = updateFn(_Cart[index]);
  }

  void insertAtIndexInCart(int index, TicketStruct value) {
    _Cart.insert(index, value);
  }

  double _CartTotal = 0.0;
  double get CartTotal => _CartTotal;
  set CartTotal(double value) {
    _CartTotal = value;
  }
}
