import 'package:drift/drift.dart';

class TodoDataTable extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named("title")();
  TextColumn get isCompleted => text().named("isCompleted")();
}