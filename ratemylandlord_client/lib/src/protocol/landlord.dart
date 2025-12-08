/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Landlord implements _i1.SerializableModel {
  Landlord._({
    _i1.UuidValue? id,
    required this.firstName,
    required this.lastName,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Landlord({
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
  }) = _LandlordImpl;

  factory Landlord.fromJson(Map<String, dynamic> jsonSerialization) {
    return Landlord(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue id;

  String firstName;

  String lastName;

  /// Returns a shallow copy of this [Landlord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Landlord copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LandlordImpl extends Landlord {
  _LandlordImpl({
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
  }) : super._(
          id: id,
          firstName: firstName,
          lastName: lastName,
        );

  /// Returns a shallow copy of this [Landlord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Landlord copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
  }) {
    return Landlord(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
