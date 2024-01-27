// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyDatabase.dart';

// ignore_for_file: type=lint
class $TodoDataTableTable extends TodoDataTable
    with TableInfo<$TodoDataTableTable, TodoDataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<String> isCompleted = GeneratedColumn<String>(
      'isCompleted', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, isCompleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_data_table';
  @override
  VerificationContext validateIntegrity(Insertable<TodoDataTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('isCompleted')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['isCompleted']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoDataTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoDataTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}isCompleted'])!,
    );
  }

  @override
  $TodoDataTableTable createAlias(String alias) {
    return $TodoDataTableTable(attachedDatabase, alias);
  }
}

class TodoDataTableData extends DataClass
    implements Insertable<TodoDataTableData> {
  final int id;
  final String title;
  final String isCompleted;
  const TodoDataTableData(
      {required this.id, required this.title, required this.isCompleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['isCompleted'] = Variable<String>(isCompleted);
    return map;
  }

  TodoDataTableCompanion toCompanion(bool nullToAbsent) {
    return TodoDataTableCompanion(
      id: Value(id),
      title: Value(title),
      isCompleted: Value(isCompleted),
    );
  }

  factory TodoDataTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoDataTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      isCompleted: serializer.fromJson<String>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'isCompleted': serializer.toJson<String>(isCompleted),
    };
  }

  TodoDataTableData copyWith({int? id, String? title, String? isCompleted}) =>
      TodoDataTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('TodoDataTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoDataTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.isCompleted == this.isCompleted);
}

class TodoDataTableCompanion extends UpdateCompanion<TodoDataTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> isCompleted;
  const TodoDataTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  TodoDataTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String isCompleted,
  })  : title = Value(title),
        isCompleted = Value(isCompleted);
  static Insertable<TodoDataTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isCompleted != null) 'isCompleted': isCompleted,
    });
  }

  TodoDataTableCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? isCompleted}) {
    return TodoDataTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isCompleted.present) {
      map['isCompleted'] = Variable<String>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoDataTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $TodoDataTableTable todoDataTable = $TodoDataTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoDataTable];
}
