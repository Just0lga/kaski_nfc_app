// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kart_yazim_baslangic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KartYazimBaslangicRequest _$KartYazimBaslangicRequestFromJson(
  Map<String, dynamic> json,
) {
  return _KartYazimBaslangicRequest.fromJson(json);
}

/// @nodoc
mixin _$KartYazimBaslangicRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;
  String? get odemeId => throw _privateConstructorUsedError;

  /// Serializes this KartYazimBaslangicRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KartYazimBaslangicRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KartYazimBaslangicRequestCopyWith<KartYazimBaslangicRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KartYazimBaslangicRequestCopyWith<$Res> {
  factory $KartYazimBaslangicRequestCopyWith(
    KartYazimBaslangicRequest value,
    $Res Function(KartYazimBaslangicRequest) then,
  ) = _$KartYazimBaslangicRequestCopyWithImpl<$Res, KartYazimBaslangicRequest>;
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String? odemeId});

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$KartYazimBaslangicRequestCopyWithImpl<
  $Res,
  $Val extends KartYazimBaslangicRequest
>
    implements $KartYazimBaslangicRequestCopyWith<$Res> {
  _$KartYazimBaslangicRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KartYazimBaslangicRequest
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

  /// Create a copy of KartYazimBaslangicRequest
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
abstract class _$$KartYazimBaslangicRequestImplCopyWith<$Res>
    implements $KartYazimBaslangicRequestCopyWith<$Res> {
  factory _$$KartYazimBaslangicRequestImplCopyWith(
    _$KartYazimBaslangicRequestImpl value,
    $Res Function(_$KartYazimBaslangicRequestImpl) then,
  ) = __$$KartYazimBaslangicRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String? odemeId});

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$KartYazimBaslangicRequestImplCopyWithImpl<$Res>
    extends
        _$KartYazimBaslangicRequestCopyWithImpl<
          $Res,
          _$KartYazimBaslangicRequestImpl
        >
    implements _$$KartYazimBaslangicRequestImplCopyWith<$Res> {
  __$$KartYazimBaslangicRequestImplCopyWithImpl(
    _$KartYazimBaslangicRequestImpl _value,
    $Res Function(_$KartYazimBaslangicRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KartYazimBaslangicRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null, Object? odemeId = freezed}) {
    return _then(
      _$KartYazimBaslangicRequestImpl(
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
class _$KartYazimBaslangicRequestImpl implements _KartYazimBaslangicRequest {
  const _$KartYazimBaslangicRequestImpl({
    required this.oturumBilgileri,
    this.odemeId,
  });

  factory _$KartYazimBaslangicRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$KartYazimBaslangicRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;
  @override
  final String? odemeId;

  @override
  String toString() {
    return 'KartYazimBaslangicRequest(oturumBilgileri: $oturumBilgileri, odemeId: $odemeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KartYazimBaslangicRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri) &&
            (identical(other.odemeId, odemeId) || other.odemeId == odemeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oturumBilgileri, odemeId);

  /// Create a copy of KartYazimBaslangicRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KartYazimBaslangicRequestImplCopyWith<_$KartYazimBaslangicRequestImpl>
  get copyWith =>
      __$$KartYazimBaslangicRequestImplCopyWithImpl<
        _$KartYazimBaslangicRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KartYazimBaslangicRequestImplToJson(this);
  }
}

abstract class _KartYazimBaslangicRequest implements KartYazimBaslangicRequest {
  const factory _KartYazimBaslangicRequest({
    required final OturumBilgileri oturumBilgileri,
    final String? odemeId,
  }) = _$KartYazimBaslangicRequestImpl;

  factory _KartYazimBaslangicRequest.fromJson(Map<String, dynamic> json) =
      _$KartYazimBaslangicRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;
  @override
  String? get odemeId;

  /// Create a copy of KartYazimBaslangicRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KartYazimBaslangicRequestImplCopyWith<_$KartYazimBaslangicRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

KartYazimBaslangicResponse _$KartYazimBaslangicResponseFromJson(
  Map<String, dynamic> json,
) {
  return _KartYazimBaslangicResponse.fromJson(json);
}

/// @nodoc
mixin _$KartYazimBaslangicResponse {
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;
  String? get durum => throw _privateConstructorUsedError;

  /// Serializes this KartYazimBaslangicResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KartYazimBaslangicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KartYazimBaslangicResponseCopyWith<KartYazimBaslangicResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KartYazimBaslangicResponseCopyWith<$Res> {
  factory $KartYazimBaslangicResponseCopyWith(
    KartYazimBaslangicResponse value,
    $Res Function(KartYazimBaslangicResponse) then,
  ) =
      _$KartYazimBaslangicResponseCopyWithImpl<
        $Res,
        KartYazimBaslangicResponse
      >;
  @useResult
  $Res call({String? hata, String? hataAciklama, String? durum});
}

/// @nodoc
class _$KartYazimBaslangicResponseCopyWithImpl<
  $Res,
  $Val extends KartYazimBaslangicResponse
>
    implements $KartYazimBaslangicResponseCopyWith<$Res> {
  _$KartYazimBaslangicResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KartYazimBaslangicResponse
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
abstract class _$$KartYazimBaslangicResponseImplCopyWith<$Res>
    implements $KartYazimBaslangicResponseCopyWith<$Res> {
  factory _$$KartYazimBaslangicResponseImplCopyWith(
    _$KartYazimBaslangicResponseImpl value,
    $Res Function(_$KartYazimBaslangicResponseImpl) then,
  ) = __$$KartYazimBaslangicResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hata, String? hataAciklama, String? durum});
}

/// @nodoc
class __$$KartYazimBaslangicResponseImplCopyWithImpl<$Res>
    extends
        _$KartYazimBaslangicResponseCopyWithImpl<
          $Res,
          _$KartYazimBaslangicResponseImpl
        >
    implements _$$KartYazimBaslangicResponseImplCopyWith<$Res> {
  __$$KartYazimBaslangicResponseImplCopyWithImpl(
    _$KartYazimBaslangicResponseImpl _value,
    $Res Function(_$KartYazimBaslangicResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KartYazimBaslangicResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? durum = freezed,
  }) {
    return _then(
      _$KartYazimBaslangicResponseImpl(
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
class _$KartYazimBaslangicResponseImpl implements _KartYazimBaslangicResponse {
  const _$KartYazimBaslangicResponseImpl({
    this.hata,
    this.hataAciklama,
    this.durum,
  });

  factory _$KartYazimBaslangicResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$KartYazimBaslangicResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;
  @override
  final String? durum;

  @override
  String toString() {
    return 'KartYazimBaslangicResponse(hata: $hata, hataAciklama: $hataAciklama, durum: $durum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KartYazimBaslangicResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama) &&
            (identical(other.durum, durum) || other.durum == durum));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hata, hataAciklama, durum);

  /// Create a copy of KartYazimBaslangicResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KartYazimBaslangicResponseImplCopyWith<_$KartYazimBaslangicResponseImpl>
  get copyWith =>
      __$$KartYazimBaslangicResponseImplCopyWithImpl<
        _$KartYazimBaslangicResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KartYazimBaslangicResponseImplToJson(this);
  }
}

abstract class _KartYazimBaslangicResponse
    implements KartYazimBaslangicResponse {
  const factory _KartYazimBaslangicResponse({
    final String? hata,
    final String? hataAciklama,
    final String? durum,
  }) = _$KartYazimBaslangicResponseImpl;

  factory _KartYazimBaslangicResponse.fromJson(Map<String, dynamic> json) =
      _$KartYazimBaslangicResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;
  @override
  String? get durum;

  /// Create a copy of KartYazimBaslangicResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KartYazimBaslangicResponseImplCopyWith<_$KartYazimBaslangicResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
