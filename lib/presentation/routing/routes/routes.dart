import 'package:task_management_app/presentation/routing/routes/task_routes.dart';

enum Routes {
  tasks(TaskRoutes.base),
  taskEdit(TaskRoutes.edit);

  const Routes(this.path);

  final String path;
}
