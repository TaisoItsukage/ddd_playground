// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'public_customer_data_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PublicCustomerDataId {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PublicCustomerDataIdCopyWith<PublicCustomerDataId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicCustomerDataIdCopyWith<$Res> {
  factory $PublicCustomerDataIdCopyWith(PublicCustomerDataId value,
          $Res Function(PublicCustomerDataId) then) =
      _$PublicCustomerDataIdCopyWithImpl<$Res, PublicCustomerDataId>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$PublicCustomerDataIdCopyWithImpl<$Res,
        $Val extends PublicCustomerDataId>
    implements $PublicCustomerDataIdCopyWith<$Res> {
  _$PublicCustomerDataIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicCustomerDataIdCopyWith<$Res>
    implements $PublicCustomerDataIdCopyWith<$Res> {
  factory _$$_PublicCustomerDataIdCopyWith(_$_PublicCustomerDataId value,
          $Res Function(_$_PublicCustomerDataId) then) =
      __$$_PublicCustomerDataIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_PublicCustomerDataIdCopyWithImpl<$Res>
    extends _$PublicCustomerDataIdCopyWithImpl<$Res, _$_PublicCustomerDataId>
    implements _$$_PublicCustomerDataIdCopyWith<$Res> {
  __$$_PublicCustomerDataIdCopyWithImpl(_$_PublicCustomerDataId _value,
      $Res Function(_$_PublicCustomerDataId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_PublicCustomerDataId(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PublicCustomerDataId implements _PublicCustomerDataId {
  const _$_PublicCustomerDataId({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'PublicCustomerDataId(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicCustomerDataId &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicCustomerDataIdCopyWith<_$_PublicCustomerDataId> get copyWith =>
      __$$_PublicCustomerDataIdCopyWithImpl<_$_PublicCustomerDataId>(
          this, _$identity);
}

abstract class _PublicCustomerDataId implements PublicCustomerDataId {
  const factory _PublicCustomerDataId({required final String id}) =
      _$_PublicCustomerDataId;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_PublicCustomerDataIdCopyWith<_$_PublicCustomerDataId> get copyWith =>
      throw _privateConstructorUsedError;
}
