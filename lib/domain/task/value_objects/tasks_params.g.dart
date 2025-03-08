// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksParams _$TasksParamsFromJson(Map<String, dynamic> json) => _TasksParams(
  sortBy: json['sortBy'] as String?,
  ascending: json['ascending'] as bool? ?? true,
  priorityFilter: $enumDecodeNullable(
    _$TaskPriorityEnumMap,
    json['priorityFilter'],
  ),
  isCompleted: json['isCompleted'] as bool?,
);

Map<String, dynamic> _$TasksParamsToJson(_TasksParams instance) =>
    <String, dynamic>{
      'sortBy': instance.sortBy,
      'ascending': instance.ascending,
      'priorityFilter': _$TaskPriorityEnumMap[instance.priorityFilter],
      'isCompleted': instance.isCompleted,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};
