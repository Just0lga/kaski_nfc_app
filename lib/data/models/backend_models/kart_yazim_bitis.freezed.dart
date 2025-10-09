// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kart_yazim_bitis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KartYazimBitisRequest _$KartYazimBitisRequestFromJson(
  Map<String, dynamic> json,
) {
  return _KartYazimBitisRequest.fromJson(json);
}

/// @nodoc
mixin _$KartYazimBitisRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;
  String? get odemeId => throw _privateConstructorUsedError;

  /// Serializes this KartYazimBitisRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KartYazimBitisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KartYazimBitisRequestCopyWith<KartYazimBitisRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KartYazimBitisRequestCopyWith<$Res> {
  factory $KartYazimBitisRequestCopyWith(
    KartYazimBitisRequest value,
    $Res Function(KartYazimBitisRequest) then,
  ) = _$KartYazimBitisRequestCopyWithImpl<$Res, KartYazimBitisRequest>;
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String? odemeId});

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$KartYazimBitisRequestCopyWithImpl<
  $Res,
  $Val extends KartYazimBitisRequest
>
    implements $KartYazimBitisRequestCopyWith<$Res> {
  _$KartYazimBitisRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KartYazimBitisRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null, Object? odemeId = freezed}) {
    return _then(
      _value.copyWith(
            oturumBilgileri: null == oturumBilgileri
                ? _value.oturumBilgileri
                : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                      as OturumBilgileri,
            odemeId: freezed == odemeId
                ? _value.odemeId
                : odemeId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of KartYazimBitisRequest
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
abstract class _$$KartYazimBitisRequestImplCopyWith<$Res>
    implements $KartYazimBitisRequestCopyWith<$Res> {
  factory _$$KartYazimBitisRequestImplCopyWith(
    _$KartYazimBitisRequestImpl value,
    $Res Function(_$KartYazimBitisRequestImpl) then,
  ) = __$$KartYazimBitisRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String? odemeId});

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$KartYazimBitisRequestImplCopyWithImpl<$Res>
    extends
        _$KartYazimBitisRequestCopyWithImpl<$Res, _$KartYazimBitisRequestImpl>
    implements _$$KartYazimBitisRequestImplCopyWith<$Res> {
  __$$KartYazimBitisRequestImplCopyWithImpl(
    _$KartYazimBitisRequestImpl _value,
    $Res Function(_$KartYazimBitisRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KartYazimBitisRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null, Object? odemeId = freezed}) {
    return _then(
      _$KartYazimBitisRequestImpl(
        oturumBilgileri: null == oturumBilgileri
            ? _value.oturumBilgileri
            : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                  as OturumBilgileri,
        odemeId: freezed == odemeId
            ? _value.odemeId
            : odemeId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KartYazimBitisRequestImpl implements _KartYazimBitisRequest {
  const _$KartYazimBitisRequestImpl({
    required this.oturumBilgileri,
    this.odemeId,
  });

  factory _$KartYazimBitisRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$KartYazimBitisRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;
  @override
  final String? odemeId;

  @override
  String toString() {
    return 'KartYazimBitisRequest(oturumBilgileri: $oturumBilgileri, odemeId: $odemeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KartYazimBitisRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri) &&
            (identical(other.odemeId, odemeId) || other.odemeId == odemeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oturumBilgileri, odemeId);

  /// Create a copy of KartYazimBitisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KartYazimBitisRequestImplCopyWith<_$KartYazimBitisRequestImpl>
  get copyWith =>
      __$$KartYazimBitisRequestImplCopyWithImpl<_$KartYazimBitisRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KartYazimBitisRequestImplToJson(this);
  }
}

abstract class _KartYazimBitisRequest implements KartYazimBitisRequest {
  const factory _KartYazimBitisRequest({
    required final OturumBilgileri oturumBilgileri,
    final String? odemeId,
  }) = _$KartYazimBitisRequestImpl;

  factory _KartYazimBitisRequest.fromJson(Map<String, dynamic> json) =
      _$KartYazimBitisRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;
  @override
  String? get odemeId;

  /// Create a copy of KartYazimBitisRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KartYazimBitisRequestImplCopyWith<_$KartYazimBitisRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

KartYazimBitisResponse _$KartYazimBitisResponseFromJson(
  Map<String, dynamic> json,
) {
  return _KartYazimBitisResponse.fromJson(json);
}

/// @nodoc
mixin _$KartYazimBitisResponse {
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;
  String? get durum => throw _privateConstructorUsedError;

  /// Serializes this KartYazimBitisResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KartYazimBitisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KartYazimBitisResponseCopyWith<KartYazimBitisResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KartYazimBitisResponseCopyWith<$Res> {
  factory $KartYazimBitisResponseCopyWith(
    KartYazimBitisResponse value,
    $Res Function(KartYazimBitisResponse) then,
  ) = _$KartYazimBitisResponseCopyWithImpl<$Res, KartYazimBitisResponse>;
  @useResult
  $Res call({String? hata, String? hataAciklama, String? durum});
}

/// @nodoc
class _$KartYazimBitisResponseCopyWithImpl<
  $Res,
  $Val extends KartYazimBitisResponse
>
    implements $KartYazimBitisResponseCopyWith<$Res> {
  _$KartYazimBitisResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KartYazimBitisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? durum = freezed,
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
            durum: freezed == durum
                ? _value.durum
                : durum // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KartYazimBitisResponseImplCopyWith<$Res>
    implements $KartYazimBitisResponseCopyWith<$Res> {
  factory _$$KartYazimBitisResponseImplCopyWith(
    _$KartYazimBitisResponseImpl value,
    $Res Function(_$KartYazimBitisResponseImpl) then,
  ) = __$$KartYazimBitisResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hata, String? hataAciklama, String? durum});
}

/// @nodoc
class __$$KartYazimBitisResponseImplCopyWithImpl<$Res>
    extends
        _$KartYazimBitisResponseCopyWithImpl<$Res, _$KartYazimBitisResponseImpl>
    implements _$$KartYazimBitisResponseImplCopyWith<$Res> {
  __$$KartYazimBitisResponseImplCopyWithImpl(
    _$KartYazimBitisResponseImpl _value,
    $Res Function(_$KartYazimBitisResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KartYazimBitisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? durum = freezed,
  }) {
    return _then(
      _$KartYazimBitisResponseImpl(
        hata: freezed == hata
            ? _value.hata
            : hata // ignore: cast_nullable_to_non_nullable
                  as String?,
        hataAciklama: freezed == hataAciklama
            ? _value.hataAciklama
            : hataAciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
        durum: freezed == durum
            ? _value.durum
            : durum // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KartYazimBitisResponseImpl implements _KartYazimBitisResponse {
  const _$KartYazimBitisResponseImpl({
    this.hata,
    this.hataAciklama,
    this.durum,
  });

  factory _$KartYazimBitisResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$KartYazimBitisResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;
  @override
  final String? durum;

  @override
  String toString() {
    return 'KartYazimBitisResponse(hata: $hata, hataAciklama: $hataAciklama, durum: $durum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KartYazimBitisResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama) &&
            (identical(other.durum, durum) || other.durum == durum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hata, hataAciklama, durum);

  /// Create a copy of KartYazimBitisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KartYazimBitisResponseImplCopyWith<_$KartYazimBitisResponseImpl>
  get copyWith =>
      __$$KartYazimBitisResponseImplCopyWithImpl<_$KartYazimBitisResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KartYazimBitisResponseImplToJson(this);
  }
}

abstract class _KartYazimBitisResponse implements KartYazimBitisResponse {
  const factory _KartYazimBitisResponse({
    final String? hata,
    final String? hataAciklama,
    final String? durum,
  }) = _$KartYazimBitisResponseImpl;

  factory _KartYazimBitisResponse.fromJson(Map<String, dynamic> json) =
      _$KartYazimBitisResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;
  @override
  String? get durum;

  /// Create a copy of KartYazimBitisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KartYazimBitisResponseImplCopyWith<_$KartYazimBitisResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
