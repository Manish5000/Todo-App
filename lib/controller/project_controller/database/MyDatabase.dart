
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'my_database_table.dart';

part 'MyDatabase.g.dart';

@DriftDatabase(tables: [TodoDataTable])
class MyDatabase extends _$MyDatabase {
  static const int schemaVersionCode = 2;
  static final MyDatabase _singleton = MyDatabase._internal();

  factory MyDatabase() {
    return _singleton;
  }

  MyDatabase._internal() : super(_openConnection());

  @override
  int get schemaVersion => schemaVersionCode;

  /// Insert Data 
  Future<int> insertTodoTask(TodoDataTableCompanion list) => into(todoDataTable).insert(list);

  /// Get Data
  Future<List<TodoDataTableData>> getTodoList() => select(todoDataTable).get();

  /// Update Date
  Future updateTodoList(TodoDataTableCompanion list) => update(todoDataTable).replace(list);

  /// Delete Data
  Future deleteTodoList(TodoDataTableCompanion list) => delete(todoDataTable).delete(list);
  
  /// Delete Todo
  Future deleteTodo(int todoId) async {
    return transaction(() async {
      return await (delete(todoDataTable)..where((val) => val.id.equals(todoId))).go();
    });
  }
  
  Future<int> updateTodoIsCompletedValue({required int todoId,required String isCompleted}) async {
    return transaction(() async {
      return await (update(todoDataTable)..where((t) => t.id.equals(todoId))).write(
        TodoDataTableCompanion(isCompleted: Value(isCompleted)),
      );
    });
  }
  
  /// Delete All Data 
  Future deleteEverything() async{
    await delete(todoDataTable).go();
  }

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ph_data_1.sqlite'));
    return NativeDatabase(file);
  });
}