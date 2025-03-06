// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) => _TaskEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  dueDate: DateTime.parse(json['dueDate'] as String),
  priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
  isCompleted: json['isCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$TaskEntityToJson(_TaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate.toIso8601String(),
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'isCompleted': instance.isCompleted,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};
