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

abstract class Tenant implements _i1.SerializableModel {
  Tenant._({
    _i1.UuidValue? id,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Tenant({
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _TenantImpl;

  factory Tenant.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tenant(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      email: jsonSerialization['email'] as String,
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  String firstName;

  String lastName;

  String email;

  /// Returns a shallow copy of this [Tenant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Tenant copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
    String? email,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Tenant',
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TenantImpl extends Tenant {
  _TenantImpl({
    _i1.UuidValue? id,
    required String firstName,
    required String lastName,
    required String email,
  }) : super._(
         id: id,
         firstName: firstName,
         lastName: lastName,
         email: email,
       );

  /// Returns a shallow copy of this [Tenant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Tenant copyWith({
    _i1.UuidValue? id,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    return Tenant(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }
}
