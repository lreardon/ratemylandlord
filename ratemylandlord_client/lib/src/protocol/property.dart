/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Property implements _i1.SerializableModel {
  Property._({
    _i1.UuidValue? id,
    required this.apn,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Property({
    _i1.UuidValue? id,
    required String apn,
  }) = _PropertyImpl;

  factory Property.fromJson(Map<String, dynamic> jsonSerialization) {
    return Property(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      apn: jsonSerialization['apn'] as String,
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  String apn;

  /// Returns a shallow copy of this [Property]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Property copyWith({
    _i1.UuidValue? id,
    String? apn,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Property',
      'id': id.toJson(),
      'apn': apn,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PropertyImpl extends Property {
  _PropertyImpl({
    _i1.UuidValue? id,
    required String apn,
  }) : super._(
         id: id,
         apn: apn,
       );

  /// Returns a shallow copy of this [Property]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Property copyWith({
    _i1.UuidValue? id,
    String? apn,
  }) {
    return Property(
      id: id ?? this.id,
      apn: apn ?? this.apn,
    );
  }
}
