/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Landlord
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = LandlordTable();

  static const db = LandlordRepository._();

  @override
  _i1.UuidValue id;

  String firstName;

  String lastName;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  static LandlordInclude include() {
    return LandlordInclude._();
  }

  static LandlordIncludeList includeList({
    _i1.WhereExpressionBuilder<LandlordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LandlordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LandlordTable>? orderByList,
    LandlordInclude? include,
  }) {
    return LandlordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Landlord.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Landlord.t),
      include: include,
    );
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

class LandlordTable extends _i1.Table<_i1.UuidValue> {
  LandlordTable({super.tableRelation}) : super(tableName: 'landlords') {
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
  }

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  @override
  List<_i1.Column> get columns => [
        id,
        firstName,
        lastName,
      ];
}

class LandlordInclude extends _i1.IncludeObject {
  LandlordInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => Landlord.t;
}

class LandlordIncludeList extends _i1.IncludeList {
  LandlordIncludeList._({
    _i1.WhereExpressionBuilder<LandlordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Landlord.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Landlord.t;
}

class LandlordRepository {
  const LandlordRepository._();

  /// Returns a list of [Landlord]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Landlord>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LandlordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LandlordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LandlordTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Landlord>(
      where: where?.call(Landlord.t),
      orderBy: orderBy?.call(Landlord.t),
      orderByList: orderByList?.call(Landlord.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Landlord] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Landlord?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LandlordTable>? where,
    int? offset,
    _i1.OrderByBuilder<LandlordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LandlordTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Landlord>(
      where: where?.call(Landlord.t),
      orderBy: orderBy?.call(Landlord.t),
      orderByList: orderByList?.call(Landlord.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Landlord] by its [id] or null if no such row exists.
  Future<Landlord?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Landlord>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Landlord]s in the list and returns the inserted rows.
  ///
  /// The returned [Landlord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Landlord>> insert(
    _i1.Session session,
    List<Landlord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Landlord>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Landlord] and returns the inserted row.
  ///
  /// The returned [Landlord] will have its `id` field set.
  Future<Landlord> insertRow(
    _i1.Session session,
    Landlord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Landlord>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Landlord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Landlord>> update(
    _i1.Session session,
    List<Landlord> rows, {
    _i1.ColumnSelections<LandlordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Landlord>(
      rows,
      columns: columns?.call(Landlord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Landlord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Landlord> updateRow(
    _i1.Session session,
    Landlord row, {
    _i1.ColumnSelections<LandlordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Landlord>(
      row,
      columns: columns?.call(Landlord.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Landlord]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Landlord>> delete(
    _i1.Session session,
    List<Landlord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Landlord>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Landlord].
  Future<Landlord> deleteRow(
    _i1.Session session,
    Landlord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Landlord>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Landlord>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LandlordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Landlord>(
      where: where(Landlord.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LandlordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Landlord>(
      where: where?.call(Landlord.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
