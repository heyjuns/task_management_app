part of '../task_list_screen.dart';

class _ErrorView extends ConsumerWidget {
  final Object error;

  const _ErrorView({required this.error});

  String _getErrorMessage(Object error) {
    if (error is TaskFailure) {
      return 'Failed to load tasks. Please check your internet connection.';
    } else if (error is TaskUnexpected) {
      return 'You don’t have permission to access these tasks.';
    } else {
      return 'Something went wrong. Please try again later.';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 48),
          SizedBox(height: 8),
          AppText.bodyMedium(_getErrorMessage(error)),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(taskNotifierProvider.notifier)
                  .loadTasks(TasksParams.init());
            },
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}
