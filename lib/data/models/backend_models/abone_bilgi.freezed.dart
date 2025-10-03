// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abone_bilgi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AboneBilgiRequest _$AboneBilgiRequestFromJson(Map<String, dynamic> json) {
  return _AboneBilgiRequest.fromJson(json);
}

/// @nodoc
mixin _$AboneBilgiRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;

  /// Serializes this AboneBilgiRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AboneBilgiRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboneBilgiRequestCopyWith<AboneBilgiRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboneBilgiRequestCopyWith<$Res> {
  factory $AboneBilgiRequestCopyWith(
    AboneBilgiRequest value,
    $Res Function(AboneBilgiRequest) then,
  ) = _$AboneBilgiRequestCopyWithImpl<$Res, AboneBilgiRequest>;
  @useResult
  $Res call({OturumBilgileri oturumBilgileri});

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$AboneBilgiRequestCopyWithImpl<$Res, $Val extends AboneBilgiRequest>
    implements $AboneBilgiRequestCopyWith<$Res> {
  _$AboneBilgiRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboneBilgiRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null}) {
    return _then(
      _value.copyWith(
            oturumBilgileri: null == oturumBilgileri
                ? _value.oturumBilgileri
                : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                      as OturumBilgileri,
          )
          as $Val,
    );
  }

  /// Create a copy of AboneBilgiRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri {
    return $OturumBilgileriCopyWith<$Res>(_value.oturumBilgileri, (value) {
      return _then(_value.copyWith(oturumBilgileri: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AboneBilgiRequestImplCopyWith<$Res>
    implements $AboneBilgiRequestCopyWith<$Res> {
  factory _$$AboneBilgiRequestImplCopyWith(
    _$AboneBilgiRequestImpl value,
    $Res Function(_$AboneBilgiRequestImpl) then,
  ) = __$$AboneBilgiRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OturumBilgileri oturumBilgileri});

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$AboneBilgiRequestImplCopyWithImpl<$Res>
    extends _$AboneBilgiRequestCopyWithImpl<$Res, _$AboneBilgiRequestImpl>
    implements _$$AboneBilgiRequestImplCopyWith<$Res> {
  __$$AboneBilgiRequestImplCopyWithImpl(
    _$AboneBilgiRequestImpl _value,
    $Res Function(_$AboneBilgiRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AboneBilgiRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null}) {
    return _then(
      _$AboneBilgiRequestImpl(
        oturumBilgileri: null == oturumBilgileri
            ? _value.oturumBilgileri
            : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                  as OturumBilgileri,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AboneBilgiRequestImpl implements _AboneBilgiRequest {
  const _$AboneBilgiRequestImpl({required this.oturumBilgileri});

  factory _$AboneBilgiRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboneBilgiRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;

  @override
  String toString() {
    return 'AboneBilgiRequest(oturumBilgileri: $oturumBilgileri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboneBilgiRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oturumBilgileri);

  /// Create a copy of AboneBilgiRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboneBilgiRequestImplCopyWith<_$AboneBilgiRequestImpl> get copyWith =>
      __$$AboneBilgiRequestImplCopyWithImpl<_$AboneBilgiRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AboneBilgiRequestImplToJson(this);
  }
}

abstract class _AboneBilgiRequest implements AboneBilgiRequest {
  const factory _AboneBilgiRequest({
    required final OturumBilgileri oturumBilgileri,
  }) = _$AboneBilgiRequestImpl;

  factory _AboneBilgiRequest.fromJson(Map<String, dynamic> json) =
      _$AboneBilgiRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;

  /// Create a copy of AboneBilgiRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboneBilgiRequestImplCopyWith<_$AboneBilgiRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AboneBilgiResponse _$AboneBilgiResponseFromJson(Map<String, dynamic> json) {
  return _AboneBilgiResponse.fromJson(json);
}

/// @nodoc
mixin _$AboneBilgiResponse {
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;
  String? get ad => throw _privateConstructorUsedError;
  String? get soyad => throw _privateConstructorUsedError;

  /// Serializes this AboneBilgiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AboneBilgiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboneBilgiResponseCopyWith<AboneBilgiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboneBilgiResponseCopyWith<$Res> {
  factory $AboneBilgiResponseCopyWith(
    AboneBilgiResponse value,
    $Res Function(AboneBilgiResponse) then,
  ) = _$AboneBilgiResponseCopyWithImpl<$Res, AboneBilgiResponse>;
  @useResult
  $Res call({String? hata, String? hataAciklama, String? ad, String? soyad});
}

/// @nodoc
class _$AboneBilgiResponseCopyWithImpl<$Res, $Val extends AboneBilgiResponse>
    implements $AboneBilgiResponseCopyWith<$Res> {
  _$AboneBilgiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboneBilgiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? ad = freezed,
    Object? soyad = freezed,
  }) {
    return _then(
      _value.copyWith(
            hata: freezed == hata
                ? _value.hata
                : hata // ignore: cast_nullable_to_non_nullable
                      as String?,
            hataAciklama: freezed == hataAciklama
                ? _value.hataAciklama
                : hataAciklama // ignore: cast_nullable_to_non_nullable
                      as String?,
            ad: freezed == ad
                ? _value.ad
                : ad // ignore: cast_nullable_to_non_nullable
                      as String?,
            soyad: freezed == soyad
                ? _value.soyad
                : soyad // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AboneBilgiResponseImplCopyWith<$Res>
    implements $AboneBilgiResponseCopyWith<$Res> {
  factory _$$AboneBilgiResponseImplCopyWith(
    _$AboneBilgiResponseImpl value,
    $Res Function(_$AboneBilgiResponseImpl) then,
  ) = __$$AboneBilgiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hata, String? hataAciklama, String? ad, String? soyad});
}

/// @nodoc
class __$$AboneBilgiResponseImplCopyWithImpl<$Res>
    extends _$AboneBilgiResponseCopyWithImpl<$Res, _$AboneBilgiResponseImpl>
    implements _$$AboneBilgiResponseImplCopyWith<$Res> {
  __$$AboneBilgiResponseImplCopyWithImpl(
    _$AboneBilgiResponseImpl _value,
    $Res Function(_$AboneBilgiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AboneBilgiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? ad = freezed,
    Object? soyad = freezed,
  }) {
    return _then(
      _$AboneBilgiResponseImpl(
        hata: freezed == hata
            ? _value.hata
            : hata // ignore: cast_nullable_to_non_nullable
                  as String?,
        hataAciklama: freezed == hataAciklama
            ? _value.hataAciklama
            : hataAciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
        ad: freezed == ad
            ? _value.ad
            : ad // ignore: cast_nullable_to_non_nullable
                  as String?,
        soyad: freezed == soyad
            ? _value.soyad
            : soyad // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AboneBilgiResponseImpl implements _AboneBilgiResponse {
  const _$AboneBilgiResponseImpl({
    this.hata,
    this.hataAciklama,
    this.ad,
    this.soyad,
  });

  factory _$AboneBilgiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboneBilgiResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;
  @override
  final String? ad;
  @override
  final String? soyad;

  @override
  String toString() {
    return 'AboneBilgiResponse(hata: $hata, hataAciklama: $hataAciklama, ad: $ad, soyad: $soyad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboneBilgiResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama) &&
            (identical(other.ad, ad) || other.ad == ad) &&
            (identical(other.soyad, soyad) || other.soyad == soyad));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hata, hataAciklama, ad, soyad);

  /// Create a copy of AboneBilgiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboneBilgiResponseImplCopyWith<_$AboneBilgiResponseImpl> get copyWith =>
      __$$AboneBilgiResponseImplCopyWithImpl<_$AboneBilgiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AboneBilgiResponseImplToJson(this);
  }
}

abstract class _AboneBilgiResponse implements AboneBilgiResponse {
  const factory _AboneBilgiResponse({
    final String? hata,
    final String? hataAciklama,
    final String? ad,
    final String? soyad,
  }) = _$AboneBilgiResponseImpl;

  factory _AboneBilgiResponse.fromJson(Map<String, dynamic> json) =
      _$AboneBilgiResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;
  @override
  String? get ad;
  @override
  String? get soyad;

  /// Create a copy of AboneBilgiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboneBilgiResponseImplCopyWith<_$AboneBilgiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
