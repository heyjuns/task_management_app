import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/application/notifiers/task_notifier.dart';
import 'package:task_management_app/domain/data_sources/task_firebase_data_source.dart';
import 'package:task_management_app/domain/data_sources/task_local_data_source.dart';
import 'package:task_management_app/domain/entities/task_entity.dart';
import 'package:task_management_app/domain/repositories/task_repository.dart';
import 'package:task_management_app/domain/usecases/create_task_usecase.dart';
import 'package:task_management_app/domain/usecases/delete_task_usecase.dart';
import 'package:task_management_app/domain/usecases/get_tasks_usecase.dart';
import 'package:task_management_app/domain/usecases/update_task_usecase.dart';
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

final getTasksProvider = Provider(
  (ref) => GetTasksUseCase(ref.read(taskRepositoryProvider)),
);
final createTaskProvider = Provider(
  (ref) => CreateTaskUseCase(ref.read(taskRepositoryProvider)),
);
final updateTaskProvider = Provider(
  (ref) => UpdateTaskUseCase(ref.read(taskRepositoryProvider)),
);
final deleteTaskProvider = Provider(
  (ref) => DeleteTaskUseCase(ref.read(taskRepositoryProvider)),
);

final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, AsyncValue<List<TaskEntity>>>(
      (ref) => TaskNotifier(
        ref.read(getTasksProvider),
        ref.read(createTaskProvider),
        ref.read(updateTaskProvider),
        ref.read(deleteTaskProvider),
      ),
    );
