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
import 'landlord.dart' as _i2;
import 'review.dart' as _i3;
import 'tenant.dart' as _i4;
import 'package:ratemylandlord_client/src/protocol/landlord.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
export 'landlord.dart';
export 'review.dart';
export 'tenant.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Landlord) {
      return _i2.Landlord.fromJson(data) as T;
    }
    if (t == _i3.Review) {
      return _i3.Review.fromJson(data) as T;
    }
    if (t == _i4.Tenant) {
      return _i4.Tenant.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Landlord?>()) {
      return (data != null ? _i2.Landlord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Review?>()) {
      return (data != null ? _i3.Review.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Tenant?>()) {
      return (data != null ? _i4.Tenant.fromJson(data) : null) as T;
    }
    if (t == List<_i5.Landlord>) {
      return (data as List).map((e) => deserialize<_i5.Landlord>(e)).toList()
          as T;
    }
    try {
      return _i6.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Landlord => 'Landlord',
      _i3.Review => 'Review',
      _i4.Tenant => 'Tenant',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'ratemylandlord.',
        '',
      );
    }

    switch (data) {
      case _i2.Landlord():
        return 'Landlord';
      case _i3.Review():
        return 'Review';
      case _i4.Tenant():
        return 'Tenant';
    }
    className = _i6.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Landlord') {
      return deserialize<_i2.Landlord>(data['data']);
    }
    if (dataClassName == 'Review') {
      return deserialize<_i3.Review>(data['data']);
    }
    if (dataClassName == 'Tenant') {
      return deserialize<_i4.Tenant>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i6.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
