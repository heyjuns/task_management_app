import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/domain.dart';

class TaskFilterModal extends HookWidget {
  final Function(TasksParams params) onApply;

  const TaskFilterModal({super.key, required this.onApply});

  @override
  Widget build(BuildContext context) {
    final filterType = useState<FilterType?>(null);
    final priorityFilter = useState<TaskPriority?>(null);
    final isCompleted = useState<bool>(false);
    final ascending = useState<bool>(true);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filter and Sort Tasks'),
          const SizedBox(height: 16),
          const Text('Select a filter:'),
          Row(
            children: [
              Radio<FilterType>(
                value: FilterType.priority,
                groupValue: filterType.value,
                onChanged: (value) {
                  filterType.value = value;
                  priorityFilter.value = null;
                  isCompleted.value = false;
                },
              ),
              const Text('Priority'),
              const SizedBox(width: 16),
              Radio<FilterType>(
                value: FilterType.completed,
                groupValue: filterType.value,
                onChanged: (value) {
                  filterType.value = value;
                  priorityFilter.value = null;
                  isCompleted.value = false;
                },
              ),
              const Text('Completed'),
            ],
          ),
          filterType.value == FilterType.priority
              ? Row(
                children: [
                  const Text('Priority Filter:'),
                  const SizedBox(width: 8),
                  DropdownButton<TaskPriority>(
                    value: priorityFilter.value,
                    hint: const Text('Select'),
                    items: [
                      DropdownMenuItem(
                        value: TaskPriority.low,
                        child: Text('Low'),
                      ),
                      DropdownMenuItem(
                        value: TaskPriority.medium,
                        child: Text('Medium'),
                      ),
                      DropdownMenuItem(
                        value: TaskPriority.high,
                        child: Text('High'),
                      ),
                    ],
                    onChanged: (value) => priorityFilter.value = value,
                  ),
                ],
              )
              : filterType.value == FilterType.completed
              ? Row(
                children: [
                  const Text('Completed:'),
                  const SizedBox(width: 8),
                  Checkbox(
                    tristate: false,
                    value: isCompleted.value,
                    onChanged: (value) => isCompleted.value = value!,
                  ),
                ],
              )
              : Container(),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Order by Due Date:'),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  ascending.value ? Icons.arrow_upward : Icons.arrow_downward,
                ),
                onPressed: () => ascending.value = !ascending.value,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              TasksParams params;
              if (filterType.value == FilterType.priority) {
                params = TasksParams(
                  sortBy: 'dueDate',
                  ascending: ascending.value,
                  priorityFilter: priorityFilter.value,
                );
              } else if (filterType.value == FilterType.completed) {
                params = TasksParams(
                  sortBy: 'dueDate',
                  ascending: ascending.value,
                  isCompleted: isCompleted.value,
                );
              } else {
                params = TasksParams(
                  sortBy: 'dueDate',
                  ascending: ascending.value,
                );
              }
              onApply(params);
              Navigator.of(context).pop();
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
