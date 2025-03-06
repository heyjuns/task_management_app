import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/task/task.dart';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id TEXT PRIMARY KEY,
        title TEXT,
        description TEXT,
        dueDate TEXT,
        priority TEXT,
        isCompleted INTEGER
      )
    ''');
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return TaskEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        dueDate: DateTime.parse(maps[i]['dueDate']),
        priority: TaskPriority.values.byName(maps[i]['priority']),
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });
  }

  @override
  Future<void> insertTask(TaskEntity task) async {
    final db = await database;
    await db.insert('tasks', {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'dueDate': task.dueDate.toIso8601String(),
      'priority': task.priority.name,
      'isCompleted': task.isCompleted ? 1 : 0,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final db = await database;
    await db.update(
      'tasks',
      {
        'title': task.title,
        'description': task.description,
        'dueDate': task.dueDate.toIso8601String(),
        'priority': task.priority.name,
        'isCompleted': task.isCompleted ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  @override
  Future<void> deleteTask(String id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
