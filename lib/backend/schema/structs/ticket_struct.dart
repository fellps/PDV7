// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketStruct extends BaseStruct {
  TicketStruct({
    int? id,
    String? name,
    double? amount,
    int? batch,
    String? type,
    String? gender,
    int? totalItems,
  })  : _id = id,
        _name = name,
        _amount = amount,
        _batch = batch,
        _type = type,
        _gender = gender,
        _totalItems = totalItems;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '-';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;
  void incrementAmount(double amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "batch" field.
  int? _batch;
  int get batch => _batch ?? 0;
  set batch(int? val) => _batch = val;
  void incrementBatch(int amount) => _batch = batch + amount;
  bool hasBatch() => _batch != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '-';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '-';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "totalItems" field.
  int? _totalItems;
  int get totalItems => _totalItems ?? 0;
  set totalItems(int? val) => _totalItems = val;
  void incrementTotalItems(int amount) => _totalItems = totalItems + amount;
  bool hasTotalItems() => _totalItems != null;

  static TicketStruct fromMap(Map<String, dynamic> data) => TicketStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
        batch: castToType<int>(data['batch']),
        type: data['type'] as String?,
        gender: data['gender'] as String?,
        totalItems: castToType<int>(data['totalItems']),
      );

  static TicketStruct? maybeFromMap(dynamic data) =>
      data is Map ? TicketStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'amount': _amount,
        'batch': _batch,
        'type': _type,
        'gender': _gender,
        'totalItems': _totalItems,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'batch': serializeParam(
          _batch,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'totalItems': serializeParam(
          _totalItems,
          ParamType.int,
        ),
      }.withoutNulls;

  static TicketStruct fromSerializableMap(Map<String, dynamic> data) =>
      TicketStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        batch: deserializeParam(
          data['batch'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        totalItems: deserializeParam(
          data['totalItems'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TicketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TicketStruct &&
        id == other.id &&
        name == other.name &&
        amount == other.amount &&
        batch == other.batch &&
        type == other.type &&
        gender == other.gender &&
        totalItems == other.totalItems;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, amount, batch, type, gender, totalItems]);
}

TicketStruct createTicketStruct({
  int? id,
  String? name,
  double? amount,
  int? batch,
  String? type,
  String? gender,
  int? totalItems,
}) =>
    TicketStruct(
      id: id,
      name: name,
      amount: amount,
      batch: batch,
      type: type,
      gender: gender,
      totalItems: totalItems,
    );
