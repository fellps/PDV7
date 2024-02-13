// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventStruct extends BaseStruct {
  EventStruct({
    String? name,
  }) : _name = name;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static EventStruct fromMap(Map<String, dynamic> data) => EventStruct(
        name: data['name'] as String?,
      );

  static EventStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

EventStruct createEventStruct({
  String? name,
}) =>
    EventStruct(
      name: name,
    );
