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
import 'dart:async' as _i2;
import 'package:ratemylandlord_client/src/protocol/landlord.dart' as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointLandlords extends _i1.EndpointRef {
  EndpointLandlords(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'landlords';

  _i2.Future<List<_i3.Landlord>> list() =>
      caller.callServerEndpoint<List<_i3.Landlord>>(
        'landlords',
        'list',
        {},
      );

  _i2.Future<void> deleteAll() => caller.callServerEndpoint<void>(
    'landlords',
    'deleteAll',
    {},
  );

  _i2.Future<List<_i3.Landlord>> find({
    required String firstName,
    required String lastName,
  }) => caller.callServerEndpoint<List<_i3.Landlord>>(
    'landlords',
    'find',
    {
      'firstName': firstName,
      'lastName': lastName,
    },
  );

  _i2.Future<_i3.Landlord> create({
    required String firstName,
    required String lastName,
  }) => caller.callServerEndpoint<_i3.Landlord>(
    'landlords',
    'create',
    {
      'firstName': firstName,
      'lastName': lastName,
    },
  );
}

class Modules {
  Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i5.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    landlords = EndpointLandlords(this);
    modules = Modules(this);
  }

  late final EndpointLandlords landlords;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'landlords': landlords,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'auth': modules.auth,
  };
}
