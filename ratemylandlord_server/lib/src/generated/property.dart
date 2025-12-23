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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Property
    implements _i1.TableRow<_i1.UuidValue>, _i1.ProtocolSerialization {
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

  static final t = PropertyTable();

  static const db = PropertyRepository._();

  @override
  _i1.UuidValue id;

  String apn;

  @override
  _i1.Table<_i1.UuidValue> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Property',
      'id': id.toJson(),
      'apn': apn,
    };
  }

  static PropertyInclude include() {
    return PropertyInclude._();
  }

  static PropertyIncludeList includeList({
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyTable>? orderByList,
    PropertyInclude? include,
  }) {
    return PropertyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Property.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Property.t),
      include: include,
    );
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

class PropertyUpdateTable extends _i1.UpdateTable<PropertyTable> {
  PropertyUpdateTable(super.table);

  _i1.ColumnValue<String, String> apn(String value) => _i1.ColumnValue(
    table.apn,
    value,
  );
}

class PropertyTable extends _i1.Table<_i1.UuidValue> {
  PropertyTable({super.tableRelation}) : super(tableName: 'properties') {
    updateTable = PropertyUpdateTable(this);
    apn = _i1.ColumnString(
      'apn',
      this,
    );
  }

  late final PropertyUpdateTable updateTable;

  late final _i1.ColumnString apn;

  @override
  List<_i1.Column> get columns => [
    id,
    apn,
  ];
}

class PropertyInclude extends _i1.IncludeObject {
  PropertyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<_i1.UuidValue> get table => Property.t;
}

class PropertyIncludeList extends _i1.IncludeList {
  PropertyIncludeList._({
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Property.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue> get table => Property.t;
}

class PropertyRepository {
  const PropertyRepository._();

  /// Returns a list of [Property]s matching the given query parameters.
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
  Future<List<Property>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Property>(
      where: where?.call(Property.t),
      orderBy: orderBy?.call(Property.t),
      orderByList: orderByList?.call(Property.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Property] matching the given query parameters.
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
  Future<Property?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? offset,
    _i1.OrderByBuilder<PropertyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PropertyTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Property>(
      where: where?.call(Property.t),
      orderBy: orderBy?.call(Property.t),
      orderByList: orderByList?.call(Property.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Property] by its [id] or null if no such row exists.
  Future<Property?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Property>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Property]s in the list and returns the inserted rows.
  ///
  /// The returned [Property]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Property>> insert(
    _i1.Session session,
    List<Property> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Property>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Property] and returns the inserted row.
  ///
  /// The returned [Property] will have its `id` field set.
  Future<Property> insertRow(
    _i1.Session session,
    Property row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Property>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Property]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Property>> update(
    _i1.Session session,
    List<Property> rows, {
    _i1.ColumnSelections<PropertyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Property>(
      rows,
      columns: columns?.call(Property.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Property]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Property> updateRow(
    _i1.Session session,
    Property row, {
    _i1.ColumnSelections<PropertyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Property>(
      row,
      columns: columns?.call(Property.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Property] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Property?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<PropertyUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Property>(
      id,
      columnValues: columnValues(Property.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Property]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Property>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<PropertyUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PropertyTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PropertyTable>? orderBy,
    _i1.OrderByListBuilder<PropertyTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Property>(
      columnValues: columnValues(Property.t.updateTable),
      where: where(Property.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Property.t),
      orderByList: orderByList?.call(Property.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Property]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Property>> delete(
    _i1.Session session,
    List<Property> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Property>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Property].
  Future<Property> deleteRow(
    _i1.Session session,
    Property row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Property>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Property>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PropertyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Property>(
      where: where(Property.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PropertyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Property>(
      where: where?.call(Property.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
