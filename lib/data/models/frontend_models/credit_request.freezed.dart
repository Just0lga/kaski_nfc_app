// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreditRequest _$CreditRequestFromJson(Map<String, dynamic> json) {
  return _CreditRequest.fromJson(json);
}

/// @nodoc
mixin _$CreditRequest {
  double get credit => throw _privateConstructorUsedError;
  double get reserveCreditLimit => throw _privateConstructorUsedError;
  double get criticalCreditLimit => throw _privateConstructorUsedError;
  OperationType get operationType => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;

  /// Serializes this CreditRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreditRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreditRequestCopyWith<CreditRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditRequestCopyWith<$Res> {
  factory $CreditRequestCopyWith(
    CreditRequest value,
    $Res Function(CreditRequest) then,
  ) = _$CreditRequestCopyWithImpl<$Res, CreditRequest>;
  @useResult
  $Res call({
    double credit,
    double reserveCreditLimit,
    double criticalCreditLimit,
    OperationType operationType,
    String? requestId,
  });
}

/// @nodoc
class _$CreditRequestCopyWithImpl<$Res, $Val extends CreditRequest>
    implements $CreditRequestCopyWith<$Res> {
  _$CreditRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreditRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credit = null,
    Object? reserveCreditLimit = null,
    Object? criticalCreditLimit = null,
    Object? operationType = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _value.copyWith(
            credit: null == credit
                ? _value.credit
                : credit // ignore: cast_nullable_to_non_nullable
                      as double,
            reserveCreditLimit: null == reserveCreditLimit
                ? _value.reserveCreditLimit
                : reserveCreditLimit // ignore: cast_nullable_to_non_nullable
                      as double,
            criticalCreditLimit: null == criticalCreditLimit
                ? _value.criticalCreditLimit
                : criticalCreditLimit // ignore: cast_nullable_to_non_nullable
                      as double,
            operationType: null == operationType
                ? _value.operationType
                : operationType // ignore: cast_nullable_to_non_nullable
                      as OperationType,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreditRequestImplCopyWith<$Res>
    implements $CreditRequestCopyWith<$Res> {
  factory _$$CreditRequestImplCopyWith(
    _$CreditRequestImpl value,
    $Res Function(_$CreditRequestImpl) then,
  ) = __$$CreditRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double credit,
    double reserveCreditLimit,
    double criticalCreditLimit,
    OperationType operationType,
    String? requestId,
  });
}

/// @nodoc
class __$$CreditRequestImplCopyWithImpl<$Res>
    extends _$CreditRequestCopyWithImpl<$Res, _$CreditRequestImpl>
    implements _$$CreditRequestImplCopyWith<$Res> {
  __$$CreditRequestImplCopyWithImpl(
    _$CreditRequestImpl _value,
    $Res Function(_$CreditRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreditRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credit = null,
    Object? reserveCreditLimit = null,
    Object? criticalCreditLimit = null,
    Object? operationType = null,
    Object? requestId = freezed,
  }) {
    return _then(
      _$CreditRequestImpl(
        credit: null == credit
            ? _value.credit
            : credit // ignore: cast_nullable_to_non_nullable
                  as double,
        reserveCreditLimit: null == reserveCreditLimit
            ? _value.reserveCreditLimit
            : reserveCreditLimit // ignore: cast_nullable_to_non_nullable
                  as double,
        criticalCreditLimit: null == criticalCreditLimit
            ? _value.criticalCreditLimit
            : criticalCreditLimit // ignore: cast_nullable_to_non_nullable
                  as double,
        operationType: null == operationType
            ? _value.operationType
            : operationType // ignore: cast_nullable_to_non_nullable
                  as OperationType,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditRequestImpl implements _CreditRequest {
  const _$CreditRequestImpl({
    this.credit = 0.0,
    this.reserveCreditLimit = 0.0,
    this.criticalCreditLimit = 0.0,
    this.operationType = OperationType.none,
    this.requestId,
  });

  factory _$CreditRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditRequestImplFromJson(json);

  @override
  @JsonKey()
  final double credit;
  @override
  @JsonKey()
  final double reserveCreditLimit;
  @override
  @JsonKey()
  final double criticalCreditLimit;
  @override
  @JsonKey()
  final OperationType operationType;
  @override
  final String? requestId;

  @override
  String toString() {
    return 'CreditRequest(credit: $credit, reserveCreditLimit: $reserveCreditLimit, criticalCreditLimit: $criticalCreditLimit, operationType: $operationType, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditRequestImpl &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.reserveCreditLimit, reserveCreditLimit) ||
                other.reserveCreditLimit == reserveCreditLimit) &&
            (identical(other.criticalCreditLimit, criticalCreditLimit) ||
                other.criticalCreditLimit == criticalCreditLimit) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    credit,
    reserveCreditLimit,
    criticalCreditLimit,
    operationType,
    requestId,
  );

  /// Create a copy of CreditRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditRequestImplCopyWith<_$CreditRequestImpl> get copyWith =>
      __$$CreditRequestImplCopyWithImpl<_$CreditRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditRequestImplToJson(this);
  }
}

abstract class _CreditRequest implements CreditRequest {
  const factory _CreditRequest({
    final double credit,
    final double reserveCreditLimit,
    final double criticalCreditLimit,
    final OperationType operationType,
    final String? requestId,
  }) = _$CreditRequestImpl;

  factory _CreditRequest.fromJson(Map<String, dynamic> json) =
      _$CreditRequestImpl.fromJson;

  @override
  double get credit;
  @override
  double get reserveCreditLimit;
  @override
  double get criticalCreditLimit;
  @override
  OperationType get operationType;
  @override
  String? get requestId;

  /// Create a copy of CreditRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreditRequestImplCopyWith<_$CreditRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
