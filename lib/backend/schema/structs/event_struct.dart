// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventStruct extends BaseStruct {
  EventStruct({
    int? id,
    String? name,
    String? eventAddress,
    String? eventImage,
    String? startDate,
  })  : _id = id,
        _name = name,
        _eventAddress = eventAddress,
        _eventImage = eventImage,
        _startDate = startDate;

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

  // "eventAddress" field.
  String? _eventAddress;
  String get eventAddress => _eventAddress ?? '';
  set eventAddress(String? val) => _eventAddress = val;
  bool hasEventAddress() => _eventAddress != null;

  // "eventImage" field.
  String? _eventImage;
  String get eventImage => _eventImage ?? '';
  set eventImage(String? val) => _eventImage = val;
  bool hasEventImage() => _eventImage != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  static EventStruct fromMap(Map<String, dynamic> data) => EventStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        eventAddress: data['eventAddress'] as String?,
        eventImage: data['eventImage'] as String?,
        startDate: data['startDate'] as String?,
      );

  static EventStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'eventAddress': _eventAddress,
        'eventImage': _eventImage,
        'startDate': _startDate,
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
        'eventAddress': serializeParam(
          _eventAddress,
          ParamType.String,
        ),
        'eventImage': serializeParam(
          _eventImage,
          ParamType.String,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventStruct(
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
        eventAddress: deserializeParam(
          data['eventAddress'],
          ParamType.String,
          false,
        ),
        eventImage: deserializeParam(
          data['eventImage'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventStruct &&
        id == other.id &&
        name == other.name &&
        eventAddress == other.eventAddress &&
        eventImage == other.eventImage &&
        startDate == other.startDate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, eventAddress, eventImage, startDate]);
}

EventStruct createEventStruct({
  int? id,
  String? name,
  String? eventAddress,
  String? eventImage,
  String? startDate,
}) =>
    EventStruct(
      id: id,
      name: name,
      eventAddress: eventAddress,
      eventImage: eventImage,
      startDate: startDate,
    );
