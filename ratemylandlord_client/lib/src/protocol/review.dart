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

abstract class Review implements _i1.SerializableModel {
  Review._({
    _i1.UuidValue? id,
    required this.landlordId,
    required this.tenantId,
    required this.rating,
    required this.comment,
  }) : id = id ?? _i1.Uuid().v4obj();

  factory Review({
    _i1.UuidValue? id,
    required _i1.UuidValue landlordId,
    required _i1.UuidValue tenantId,
    required int rating,
    required String comment,
  }) = _ReviewImpl;

  factory Review.fromJson(Map<String, dynamic> jsonSerialization) {
    return Review(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      landlordId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['landlordId'],
      ),
      tenantId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['tenantId'],
      ),
      rating: jsonSerialization['rating'] as int,
      comment: jsonSerialization['comment'] as String,
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue landlordId;

  _i1.UuidValue tenantId;

  int rating;

  String comment;

  /// Returns a shallow copy of this [Review]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Review copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? landlordId,
    _i1.UuidValue? tenantId,
    int? rating,
    String? comment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Review',
      'id': id.toJson(),
      'landlordId': landlordId.toJson(),
      'tenantId': tenantId.toJson(),
      'rating': rating,
      'comment': comment,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ReviewImpl extends Review {
  _ReviewImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue landlordId,
    required _i1.UuidValue tenantId,
    required int rating,
    required String comment,
  }) : super._(
         id: id,
         landlordId: landlordId,
         tenantId: tenantId,
         rating: rating,
         comment: comment,
       );

  /// Returns a shallow copy of this [Review]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Review copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? landlordId,
    _i1.UuidValue? tenantId,
    int? rating,
    String? comment,
  }) {
    return Review(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      tenantId: tenantId ?? this.tenantId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
    );
  }
}
