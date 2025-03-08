// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TasksParams implements DiagnosticableTreeMixin {

 String? get sortBy; bool get ascending; TaskPriority? get priorityFilter; bool? get isCompleted;
/// Create a copy of TasksParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksParamsCopyWith<TasksParams> get copyWith => _$TasksParamsCopyWithImpl<TasksParams>(this as TasksParams, _$identity);

  /// Serializes this TasksParams to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TasksParams'))
    ..add(DiagnosticsProperty('sortBy', sortBy))..add(DiagnosticsProperty('ascending', ascending))..add(DiagnosticsProperty('priorityFilter', priorityFilter))..add(DiagnosticsProperty('isCompleted', isCompleted));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksParams&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.ascending, ascending) || other.ascending == ascending)&&(identical(other.priorityFilter, priorityFilter) || other.priorityFilter == priorityFilter)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortBy,ascending,priorityFilter,isCompleted);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TasksParams(sortBy: $sortBy, ascending: $ascending, priorityFilter: $priorityFilter, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $TasksParamsCopyWith<$Res>  {
  factory $TasksParamsCopyWith(TasksParams value, $Res Function(TasksParams) _then) = _$TasksParamsCopyWithImpl;
@useResult
$Res call({
 String? sortBy, bool ascending, TaskPriority? priorityFilter, bool? isCompleted
});




}
/// @nodoc
class _$TasksParamsCopyWithImpl<$Res>
    implements $TasksParamsCopyWith<$Res> {
  _$TasksParamsCopyWithImpl(this._self, this._then);

  final TasksParams _self;
  final $Res Function(TasksParams) _then;

/// Create a copy of TasksParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sortBy = freezed,Object? ascending = null,Object? priorityFilter = freezed,Object? isCompleted = freezed,}) {
  return _then(_self.copyWith(
sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,priorityFilter: freezed == priorityFilter ? _self.priorityFilter : priorityFilter // ignore: cast_nullable_to_non_nullable
as TaskPriority?,isCompleted: freezed == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TasksParams extends TasksParams with DiagnosticableTreeMixin {
   _TasksParams({this.sortBy, this.ascending = true, this.priorityFilter, this.isCompleted}): super._();
  factory _TasksParams.fromJson(Map<String, dynamic> json) => _$TasksParamsFromJson(json);

@override final  String? sortBy;
@override@JsonKey() final  bool ascending;
@override final  TaskPriority? priorityFilter;
@override final  bool? isCompleted;

/// Create a copy of TasksParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksParamsCopyWith<_TasksParams> get copyWith => __$TasksParamsCopyWithImpl<_TasksParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasksParamsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TasksParams'))
    ..add(DiagnosticsProperty('sortBy', sortBy))..add(DiagnosticsProperty('ascending', ascending))..add(DiagnosticsProperty('priorityFilter', priorityFilter))..add(DiagnosticsProperty('isCompleted', isCompleted));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksParams&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.ascending, ascending) || other.ascending == ascending)&&(identical(other.priorityFilter, priorityFilter) || other.priorityFilter == priorityFilter)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortBy,ascending,priorityFilter,isCompleted);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TasksParams(sortBy: $sortBy, ascending: $ascending, priorityFilter: $priorityFilter, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$TasksParamsCopyWith<$Res> implements $TasksParamsCopyWith<$Res> {
  factory _$TasksParamsCopyWith(_TasksParams value, $Res Function(_TasksParams) _then) = __$TasksParamsCopyWithImpl;
@override @useResult
$Res call({
 String? sortBy, bool ascending, TaskPriority? priorityFilter, bool? isCompleted
});




}
/// @nodoc
class __$TasksParamsCopyWithImpl<$Res>
    implements _$TasksParamsCopyWith<$Res> {
  __$TasksParamsCopyWithImpl(this._self, this._then);

  final _TasksParams _self;
  final $Res Function(_TasksParams) _then;

/// Create a copy of TasksParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortBy = freezed,Object? ascending = null,Object? priorityFilter = freezed,Object? isCompleted = freezed,}) {
  return _then(_TasksParams(
sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,priorityFilter: freezed == priorityFilter ? _self.priorityFilter : priorityFilter // ignore: cast_nullable_to_non_nullable
as TaskPriority?,isCompleted: freezed == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
