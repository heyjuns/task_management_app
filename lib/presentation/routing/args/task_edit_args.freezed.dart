// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_edit_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskEditArgs implements DiagnosticableTreeMixin {

 TaskEntity? get task;
/// Create a copy of TaskEditArgs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskEditArgsCopyWith<TaskEditArgs> get copyWith => _$TaskEditArgsCopyWithImpl<TaskEditArgs>(this as TaskEditArgs, _$identity);

  /// Serializes this TaskEditArgs to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskEditArgs'))
    ..add(DiagnosticsProperty('task', task));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEditArgs&&(identical(other.task, task) || other.task == task));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskEditArgs(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskEditArgsCopyWith<$Res>  {
  factory $TaskEditArgsCopyWith(TaskEditArgs value, $Res Function(TaskEditArgs) _then) = _$TaskEditArgsCopyWithImpl;
@useResult
$Res call({
 TaskEntity? task
});


$TaskEntityCopyWith<$Res>? get task;

}
/// @nodoc
class _$TaskEditArgsCopyWithImpl<$Res>
    implements $TaskEditArgsCopyWith<$Res> {
  _$TaskEditArgsCopyWithImpl(this._self, this._then);

  final TaskEditArgs _self;
  final $Res Function(TaskEditArgs) _then;

/// Create a copy of TaskEditArgs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = freezed,}) {
  return _then(_self.copyWith(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,
  ));
}
/// Create a copy of TaskEditArgs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
    return null;
  }

  return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _TaskEditArgs with DiagnosticableTreeMixin implements TaskEditArgs {
   _TaskEditArgs({this.task});
  factory _TaskEditArgs.fromJson(Map<String, dynamic> json) => _$TaskEditArgsFromJson(json);

@override final  TaskEntity? task;

/// Create a copy of TaskEditArgs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskEditArgsCopyWith<_TaskEditArgs> get copyWith => __$TaskEditArgsCopyWithImpl<_TaskEditArgs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskEditArgsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TaskEditArgs'))
    ..add(DiagnosticsProperty('task', task));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskEditArgs&&(identical(other.task, task) || other.task == task));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TaskEditArgs(task: $task)';
}


}

/// @nodoc
abstract mixin class _$TaskEditArgsCopyWith<$Res> implements $TaskEditArgsCopyWith<$Res> {
  factory _$TaskEditArgsCopyWith(_TaskEditArgs value, $Res Function(_TaskEditArgs) _then) = __$TaskEditArgsCopyWithImpl;
@override @useResult
$Res call({
 TaskEntity? task
});


@override $TaskEntityCopyWith<$Res>? get task;

}
/// @nodoc
class __$TaskEditArgsCopyWithImpl<$Res>
    implements _$TaskEditArgsCopyWith<$Res> {
  __$TaskEditArgsCopyWithImpl(this._self, this._then);

  final _TaskEditArgs _self;
  final $Res Function(_TaskEditArgs) _then;

/// Create a copy of TaskEditArgs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = freezed,}) {
  return _then(_TaskEditArgs(
task: freezed == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskEntity?,
  ));
}

/// Create a copy of TaskEditArgs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<$Res>? get task {
    if (_self.task == null) {
    return null;
  }

  return $TaskEntityCopyWith<$Res>(_self.task!, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

// dart format on
