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
  })  : _id = id,
        _name = name,
        _amount = amount,
        _batch = batch,
        _type = type,
        _gender = gender;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
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
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  static TicketStruct fromMap(Map<String, dynamic> data) => TicketStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
        batch: castToType<int>(data['batch']),
        type: data['type'] as String?,
        gender: data['gender'] as String?,
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
        gender == other.gender;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, amount, batch, type, gender]);
}

TicketStruct createTicketStruct({
  int? id,
  String? name,
  double? amount,
  int? batch,
  String? type,
  String? gender,
}) =>
    TicketStruct(
      id: id,
      name: name,
      amount: amount,
      batch: batch,
      type: type,
      gender: gender,
    );
