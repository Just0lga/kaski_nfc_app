// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StartPaymentRequest _$StartPaymentRequestFromJson(Map<String, dynamic> json) {
  return _StartPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$StartPaymentRequest {
  String? get merchantId => throw _privateConstructorUsedError;
  String? get merchantPassword => throw _privateConstructorUsedError;
  String? get pan => throw _privateConstructorUsedError;
  String? get expiry => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get successUrl => throw _privateConstructorUsedError;
  String? get failureUrl => throw _privateConstructorUsedError;

  /// Serializes this StartPaymentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartPaymentRequestCopyWith<StartPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartPaymentRequestCopyWith<$Res> {
  factory $StartPaymentRequestCopyWith(
    StartPaymentRequest value,
    $Res Function(StartPaymentRequest) then,
  ) = _$StartPaymentRequestCopyWithImpl<$Res, StartPaymentRequest>;
  @useResult
  $Res call({
    String? merchantId,
    String? merchantPassword,
    String? pan,
    String? expiry,
    double? amount,
    String? currency,
    String? brand,
    String? successUrl,
    String? failureUrl,
  });
}

/// @nodoc
class _$StartPaymentRequestCopyWithImpl<$Res, $Val extends StartPaymentRequest>
    implements $StartPaymentRequestCopyWith<$Res> {
  _$StartPaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = freezed,
    Object? merchantPassword = freezed,
    Object? pan = freezed,
    Object? expiry = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? brand = freezed,
    Object? successUrl = freezed,
    Object? failureUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            merchantId: freezed == merchantId
                ? _value.merchantId
                : merchantId // ignore: cast_nullable_to_non_nullable
                      as String?,
            merchantPassword: freezed == merchantPassword
                ? _value.merchantPassword
                : merchantPassword // ignore: cast_nullable_to_non_nullable
                      as String?,
            pan: freezed == pan
                ? _value.pan
                : pan // ignore: cast_nullable_to_non_nullable
                      as String?,
            expiry: freezed == expiry
                ? _value.expiry
                : expiry // ignore: cast_nullable_to_non_nullable
                      as String?,
            amount: freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
            successUrl: freezed == successUrl
                ? _value.successUrl
                : successUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            failureUrl: freezed == failureUrl
                ? _value.failureUrl
                : failureUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StartPaymentRequestImplCopyWith<$Res>
    implements $StartPaymentRequestCopyWith<$Res> {
  factory _$$StartPaymentRequestImplCopyWith(
    _$StartPaymentRequestImpl value,
    $Res Function(_$StartPaymentRequestImpl) then,
  ) = __$$StartPaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? merchantId,
    String? merchantPassword,
    String? pan,
    String? expiry,
    double? amount,
    String? currency,
    String? brand,
    String? successUrl,
    String? failureUrl,
  });
}

/// @nodoc
class __$$StartPaymentRequestImplCopyWithImpl<$Res>
    extends _$StartPaymentRequestCopyWithImpl<$Res, _$StartPaymentRequestImpl>
    implements _$$StartPaymentRequestImplCopyWith<$Res> {
  __$$StartPaymentRequestImplCopyWithImpl(
    _$StartPaymentRequestImpl _value,
    $Res Function(_$StartPaymentRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = freezed,
    Object? merchantPassword = freezed,
    Object? pan = freezed,
    Object? expiry = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? brand = freezed,
    Object? successUrl = freezed,
    Object? failureUrl = freezed,
  }) {
    return _then(
      _$StartPaymentRequestImpl(
        merchantId: freezed == merchantId
            ? _value.merchantId
            : merchantId // ignore: cast_nullable_to_non_nullable
                  as String?,
        merchantPassword: freezed == merchantPassword
            ? _value.merchantPassword
            : merchantPassword // ignore: cast_nullable_to_non_nullable
                  as String?,
        pan: freezed == pan
            ? _value.pan
            : pan // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiry: freezed == expiry
            ? _value.expiry
            : expiry // ignore: cast_nullable_to_non_nullable
                  as String?,
        amount: freezed == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
        successUrl: freezed == successUrl
            ? _value.successUrl
            : successUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        failureUrl: freezed == failureUrl
            ? _value.failureUrl
            : failureUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StartPaymentRequestImpl implements _StartPaymentRequest {
  const _$StartPaymentRequestImpl({
    this.merchantId,
    this.merchantPassword,
    this.pan,
    this.expiry,
    this.amount,
    this.currency,
    this.brand,
    this.successUrl,
    this.failureUrl,
  });

  factory _$StartPaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartPaymentRequestImplFromJson(json);

  @override
  final String? merchantId;
  @override
  final String? merchantPassword;
  @override
  final String? pan;
  @override
  final String? expiry;
  @override
  final double? amount;
  @override
  final String? currency;
  @override
  final String? brand;
  @override
  final String? successUrl;
  @override
  final String? failureUrl;

  @override
  String toString() {
    return 'StartPaymentRequest(merchantId: $merchantId, merchantPassword: $merchantPassword, pan: $pan, expiry: $expiry, amount: $amount, currency: $currency, brand: $brand, successUrl: $successUrl, failureUrl: $failureUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartPaymentRequestImpl &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.merchantPassword, merchantPassword) ||
                other.merchantPassword == merchantPassword) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.successUrl, successUrl) ||
                other.successUrl == successUrl) &&
            (identical(other.failureUrl, failureUrl) ||
                other.failureUrl == failureUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    merchantId,
    merchantPassword,
    pan,
    expiry,
    amount,
    currency,
    brand,
    successUrl,
    failureUrl,
  );

  /// Create a copy of StartPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartPaymentRequestImplCopyWith<_$StartPaymentRequestImpl> get copyWith =>
      __$$StartPaymentRequestImplCopyWithImpl<_$StartPaymentRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StartPaymentRequestImplToJson(this);
  }
}

abstract class _StartPaymentRequest implements StartPaymentRequest {
  const factory _StartPaymentRequest({
    final String? merchantId,
    final String? merchantPassword,
    final String? pan,
    final String? expiry,
    final double? amount,
    final String? currency,
    final String? brand,
    final String? successUrl,
    final String? failureUrl,
  }) = _$StartPaymentRequestImpl;

  factory _StartPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$StartPaymentRequestImpl.fromJson;

  @override
  String? get merchantId;
  @override
  String? get merchantPassword;
  @override
  String? get pan;
  @override
  String? get expiry;
  @override
  double? get amount;
  @override
  String? get currency;
  @override
  String? get brand;
  @override
  String? get successUrl;
  @override
  String? get failureUrl;

  /// Create a copy of StartPaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartPaymentRequestImplCopyWith<_$StartPaymentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
