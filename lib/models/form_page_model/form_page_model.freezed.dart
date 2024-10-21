// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormPageModel {
  String get title => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  BaseForm get body => throw _privateConstructorUsedError;
  FormPageState get state => throw _privateConstructorUsedError;

  /// Create a copy of FormPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormPageModelCopyWith<FormPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormPageModelCopyWith<$Res> {
  factory $FormPageModelCopyWith(
          FormPageModel value, $Res Function(FormPageModel) then) =
      _$FormPageModelCopyWithImpl<$Res, FormPageModel>;
  @useResult
  $Res call(
      {String title, String subTitle, BaseForm body, FormPageState state});
}

/// @nodoc
class _$FormPageModelCopyWithImpl<$Res, $Val extends FormPageModel>
    implements $FormPageModelCopyWith<$Res> {
  _$FormPageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? body = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as BaseForm,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FormPageState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormPageModelImplCopyWith<$Res>
    implements $FormPageModelCopyWith<$Res> {
  factory _$$FormPageModelImplCopyWith(
          _$FormPageModelImpl value, $Res Function(_$FormPageModelImpl) then) =
      __$$FormPageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String subTitle, BaseForm body, FormPageState state});
}

/// @nodoc
class __$$FormPageModelImplCopyWithImpl<$Res>
    extends _$FormPageModelCopyWithImpl<$Res, _$FormPageModelImpl>
    implements _$$FormPageModelImplCopyWith<$Res> {
  __$$FormPageModelImplCopyWithImpl(
      _$FormPageModelImpl _value, $Res Function(_$FormPageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormPageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subTitle = null,
    Object? body = null,
    Object? state = null,
  }) {
    return _then(_$FormPageModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as BaseForm,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FormPageState,
    ));
  }
}

/// @nodoc

class _$FormPageModelImpl implements _FormPageModel {
  const _$FormPageModelImpl(
      {required this.title,
      required this.subTitle,
      required this.body,
      this.state = FormPageState.pending});

  @override
  final String title;
  @override
  final String subTitle;
  @override
  final BaseForm body;
  @override
  @JsonKey()
  final FormPageState state;

  @override
  String toString() {
    return 'FormPageModel(title: $title, subTitle: $subTitle, body: $body, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormPageModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, subTitle, body, state);

  /// Create a copy of FormPageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormPageModelImplCopyWith<_$FormPageModelImpl> get copyWith =>
      __$$FormPageModelImplCopyWithImpl<_$FormPageModelImpl>(this, _$identity);
}

abstract class _FormPageModel implements FormPageModel {
  const factory _FormPageModel(
      {required final String title,
      required final String subTitle,
      required final BaseForm body,
      final FormPageState state}) = _$FormPageModelImpl;

  @override
  String get title;
  @override
  String get subTitle;
  @override
  BaseForm get body;
  @override
  FormPageState get state;

  /// Create a copy of FormPageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormPageModelImplCopyWith<_$FormPageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
