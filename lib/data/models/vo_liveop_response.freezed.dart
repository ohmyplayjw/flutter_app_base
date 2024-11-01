// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vo_liveop_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveopResponse _$LiveopResponseFromJson(Map<String, dynamic> json) {
  return _LiveopResponse.fromJson(json);
}

/// @nodoc
mixin _$LiveopResponse {
  LiveopHeader get header => throw _privateConstructorUsedError;
  Map<String, dynamic> get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveopResponseCopyWith<LiveopResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveopResponseCopyWith<$Res> {
  factory $LiveopResponseCopyWith(
          LiveopResponse value, $Res Function(LiveopResponse) then) =
      _$LiveopResponseCopyWithImpl<$Res, LiveopResponse>;
  @useResult
  $Res call({LiveopHeader header, Map<String, dynamic> body});

  $LiveopHeaderCopyWith<$Res> get header;
}

/// @nodoc
class _$LiveopResponseCopyWithImpl<$Res, $Val extends LiveopResponse>
    implements $LiveopResponseCopyWith<$Res> {
  _$LiveopResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as LiveopHeader,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LiveopHeaderCopyWith<$Res> get header {
    return $LiveopHeaderCopyWith<$Res>(_value.header, (value) {
      return _then(_value.copyWith(header: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveopResponseImplCopyWith<$Res>
    implements $LiveopResponseCopyWith<$Res> {
  factory _$$LiveopResponseImplCopyWith(_$LiveopResponseImpl value,
          $Res Function(_$LiveopResponseImpl) then) =
      __$$LiveopResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LiveopHeader header, Map<String, dynamic> body});

  @override
  $LiveopHeaderCopyWith<$Res> get header;
}

/// @nodoc
class __$$LiveopResponseImplCopyWithImpl<$Res>
    extends _$LiveopResponseCopyWithImpl<$Res, _$LiveopResponseImpl>
    implements _$$LiveopResponseImplCopyWith<$Res> {
  __$$LiveopResponseImplCopyWithImpl(
      _$LiveopResponseImpl _value, $Res Function(_$LiveopResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? body = null,
  }) {
    return _then(_$LiveopResponseImpl(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as LiveopHeader,
      body: null == body
          ? _value._body
          : body // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveopResponseImpl implements _LiveopResponse {
  const _$LiveopResponseImpl(
      {required this.header, final Map<String, dynamic> body = const {}})
      : _body = body;

  factory _$LiveopResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveopResponseImplFromJson(json);

  @override
  final LiveopHeader header;
  final Map<String, dynamic> _body;
  @override
  @JsonKey()
  Map<String, dynamic> get body {
    if (_body is EqualUnmodifiableMapView) return _body;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_body);
  }

  @override
  String toString() {
    return 'LiveopResponse(header: $header, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveopResponseImpl &&
            (identical(other.header, header) || other.header == header) &&
            const DeepCollectionEquality().equals(other._body, _body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, header, const DeepCollectionEquality().hash(_body));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveopResponseImplCopyWith<_$LiveopResponseImpl> get copyWith =>
      __$$LiveopResponseImplCopyWithImpl<_$LiveopResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveopResponseImplToJson(
      this,
    );
  }
}

abstract class _LiveopResponse implements LiveopResponse {
  const factory _LiveopResponse(
      {required final LiveopHeader header,
      final Map<String, dynamic> body}) = _$LiveopResponseImpl;

  factory _LiveopResponse.fromJson(Map<String, dynamic> json) =
      _$LiveopResponseImpl.fromJson;

  @override
  LiveopHeader get header;
  @override
  Map<String, dynamic> get body;
  @override
  @JsonKey(ignore: true)
  _$$LiveopResponseImplCopyWith<_$LiveopResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiveopHeader _$LiveopHeaderFromJson(Map<String, dynamic> json) {
  return _LiveopHeader.fromJson(json);
}

/// @nodoc
mixin _$LiveopHeader {
  int get returnCode => throw _privateConstructorUsedError;
  String get returnDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveopHeaderCopyWith<LiveopHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveopHeaderCopyWith<$Res> {
  factory $LiveopHeaderCopyWith(
          LiveopHeader value, $Res Function(LiveopHeader) then) =
      _$LiveopHeaderCopyWithImpl<$Res, LiveopHeader>;
  @useResult
  $Res call({int returnCode, String returnDesc});
}

/// @nodoc
class _$LiveopHeaderCopyWithImpl<$Res, $Val extends LiveopHeader>
    implements $LiveopHeaderCopyWith<$Res> {
  _$LiveopHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnCode = null,
    Object? returnDesc = null,
  }) {
    return _then(_value.copyWith(
      returnCode: null == returnCode
          ? _value.returnCode
          : returnCode // ignore: cast_nullable_to_non_nullable
              as int,
      returnDesc: null == returnDesc
          ? _value.returnDesc
          : returnDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveopHeaderImplCopyWith<$Res>
    implements $LiveopHeaderCopyWith<$Res> {
  factory _$$LiveopHeaderImplCopyWith(
          _$LiveopHeaderImpl value, $Res Function(_$LiveopHeaderImpl) then) =
      __$$LiveopHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int returnCode, String returnDesc});
}

/// @nodoc
class __$$LiveopHeaderImplCopyWithImpl<$Res>
    extends _$LiveopHeaderCopyWithImpl<$Res, _$LiveopHeaderImpl>
    implements _$$LiveopHeaderImplCopyWith<$Res> {
  __$$LiveopHeaderImplCopyWithImpl(
      _$LiveopHeaderImpl _value, $Res Function(_$LiveopHeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnCode = null,
    Object? returnDesc = null,
  }) {
    return _then(_$LiveopHeaderImpl(
      returnCode: null == returnCode
          ? _value.returnCode
          : returnCode // ignore: cast_nullable_to_non_nullable
              as int,
      returnDesc: null == returnDesc
          ? _value.returnDesc
          : returnDesc // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveopHeaderImpl implements _LiveopHeader {
  const _$LiveopHeaderImpl(
      {required this.returnCode, required this.returnDesc});

  factory _$LiveopHeaderImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveopHeaderImplFromJson(json);

  @override
  final int returnCode;
  @override
  final String returnDesc;

  @override
  String toString() {
    return 'LiveopHeader(returnCode: $returnCode, returnDesc: $returnDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveopHeaderImpl &&
            (identical(other.returnCode, returnCode) ||
                other.returnCode == returnCode) &&
            (identical(other.returnDesc, returnDesc) ||
                other.returnDesc == returnDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, returnCode, returnDesc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveopHeaderImplCopyWith<_$LiveopHeaderImpl> get copyWith =>
      __$$LiveopHeaderImplCopyWithImpl<_$LiveopHeaderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveopHeaderImplToJson(
      this,
    );
  }
}

abstract class _LiveopHeader implements LiveopHeader {
  const factory _LiveopHeader(
      {required final int returnCode,
      required final String returnDesc}) = _$LiveopHeaderImpl;

  factory _LiveopHeader.fromJson(Map<String, dynamic> json) =
      _$LiveopHeaderImpl.fromJson;

  @override
  int get returnCode;
  @override
  String get returnDesc;
  @override
  @JsonKey(ignore: true)
  _$$LiveopHeaderImplCopyWith<_$LiveopHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
