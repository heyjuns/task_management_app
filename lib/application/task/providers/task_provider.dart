import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/task/task.dart';
import '../../../infrastructure/task/task.dart';
import '../notifiers/task_notifier.dart';

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
