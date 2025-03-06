import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/domain/data_sources/task_firebase_data_source.dart';
import 'package:task_management_app/domain/data_sources/task_local_data_source.dart';
import 'package:task_management_app/domain/repositories/task_repository.dart';
import 'package:task_management_app/infrastructure/data_sources/task_firebase_data_source_impl.dart';
import 'package:task_management_app/infrastructure/data_sources/task_local_data_source_impl.dart';
import 'package:task_management_app/infrastructure/repositories/task_repository_impl.dart';

final firebaseTaskDataSourceProvider = Provider<TaskFirebaseDataSource>(
  (ref) => TaskFirebaseDataSourceImpl(),
);
final localTaskDataSourceProvider = Provider<TaskLocalDataSource>(
  (ref) => TaskLocalDataSourceImpl(),
);

final taskRepositoryProvider = Provider<TaskRepository>(
  (ref) => TaskRepositoryImpl(
    ref.read(firebaseTaskDataSourceProvider),
    ref.read(localTaskDataSourceProvider),
  ),
);
