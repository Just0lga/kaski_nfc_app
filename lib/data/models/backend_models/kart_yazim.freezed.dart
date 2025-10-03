// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kart_yazim.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KartYazimRequest _$KartYazimRequestFromJson(Map<String, dynamic> json) {
  return _KartYazimRequest.fromJson(json);
}

/// @nodoc
mixin _$KartYazimRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;
  String? get odemeId => throw _privateConstructorUsedError;
  String? get sonuc => throw _privateConstructorUsedError;
  int? get paydeskKodu => throw _privateConstructorUsedError;

  /// Serializes this KartYazimRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KartYazimRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KartYazimRequestCopyWith<KartYazimRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KartYazimRequestCopyWith<$Res> {
  factory $KartYazimRequestCopyWith(
    KartYazimRequest value,
    $Res Function(KartYazimRequest) then,
  ) = _$KartYazimRequestCopyWithImpl<$Res, KartYazimRequest>;
  @useResult
  $Res call({
    OturumBilgileri oturumBilgileri,
    String? odemeId,
    String? sonuc,
    int? paydeskKodu,
  });

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$KartYazimRequestCopyWithImpl<$Res, $Val extends KartYazimRequest>
    implements $KartYazimRequestCopyWith<$Res> {
  _$KartYazimRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KartYazimRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? odemeId = freezed,
    Object? sonuc = freezed,
    Object? paydeskKodu = freezed,
  }) {
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
            sonuc: freezed == sonuc
                ? _value.sonuc
                : sonuc // ignore: cast_nullable_to_non_nullable
                      as String?,
            paydeskKodu: freezed == paydeskKodu
                ? _value.paydeskKodu
                : paydeskKodu // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of KartYazimRequest
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
abstract class _$$KartYazimRequestImplCopyWith<$Res>
    implements $KartYazimRequestCopyWith<$Res> {
  factory _$$KartYazimRequestImplCopyWith(
    _$KartYazimRequestImpl value,
    $Res Function(_$KartYazimRequestImpl) then,
  ) = __$$KartYazimRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    OturumBilgileri oturumBilgileri,
    String? odemeId,
    String? sonuc,
    int? paydeskKodu,
  });

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$KartYazimRequestImplCopyWithImpl<$Res>
    extends _$KartYazimRequestCopyWithImpl<$Res, _$KartYazimRequestImpl>
    implements _$$KartYazimRequestImplCopyWith<$Res> {
  __$$KartYazimRequestImplCopyWithImpl(
    _$KartYazimRequestImpl _value,
    $Res Function(_$KartYazimRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KartYazimRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? odemeId = freezed,
    Object? sonuc = freezed,
    Object? paydeskKodu = freezed,
  }) {
    return _then(
      _$KartYazimRequestImpl(
        oturumBilgileri: null == oturumBilgileri
            ? _value.oturumBilgileri
            : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                  as OturumBilgileri,
        odemeId: freezed == odemeId
            ? _value.odemeId
            : odemeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sonuc: freezed == sonuc
            ? _value.sonuc
            : sonuc // ignore: cast_nullable_to_non_nullable
                  as String?,
        paydeskKodu: freezed == paydeskKodu
            ? _value.paydeskKodu
            : paydeskKodu // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KartYazimRequestImpl implements _KartYazimRequest {
  const _$KartYazimRequestImpl({
    required this.oturumBilgileri,
    this.odemeId,
    this.sonuc,
    this.paydeskKodu,
  });

  factory _$KartYazimRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$KartYazimRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;
  @override
  final String? odemeId;
  @override
  final String? sonuc;
  @override
  final int? paydeskKodu;

  @override
  String toString() {
    return 'KartYazimRequest(oturumBilgileri: $oturumBilgileri, odemeId: $odemeId, sonuc: $sonuc, paydeskKodu: $paydeskKodu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KartYazimRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri) &&
            (identical(other.odemeId, odemeId) || other.odemeId == odemeId) &&
            (identical(other.sonuc, sonuc) || other.sonuc == sonuc) &&
            (identical(other.paydeskKodu, paydeskKodu) ||
                other.paydeskKodu == paydeskKodu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, oturumBilgileri, odemeId, sonuc, paydeskKodu);

  /// Create a copy of KartYazimRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KartYazimRequestImplCopyWith<_$KartYazimRequestImpl> get copyWith =>
      __$$KartYazimRequestImplCopyWithImpl<_$KartYazimRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KartYazimRequestImplToJson(this);
  }
}

abstract class _KartYazimRequest implements KartYazimRequest {
  const factory _KartYazimRequest({
    required final OturumBilgileri oturumBilgileri,
    final String? odemeId,
    final String? sonuc,
    final int? paydeskKodu,
  }) = _$KartYazimRequestImpl;

  factory _KartYazimRequest.fromJson(Map<String, dynamic> json) =
      _$KartYazimRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;
  @override
  String? get odemeId;
  @override
  String? get sonuc;
  @override
  int? get paydeskKodu;

  /// Create a copy of KartYazimRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KartYazimRequestImplCopyWith<_$KartYazimRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KartYazimResponse _$KartYazimResponseFromJson(Map<String, dynamic> json) {
  return _KartYazimResponse.fromJson(json);
}

/// @nodoc
mixin _$KartYazimResponse {
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;

  /// Serializes this KartYazimResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KartYazimResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KartYazimResponseCopyWith<KartYazimResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KartYazimResponseCopyWith<$Res> {
  factory $KartYazimResponseCopyWith(
    KartYazimResponse value,
    $Res Function(KartYazimResponse) then,
  ) = _$KartYazimResponseCopyWithImpl<$Res, KartYazimResponse>;
  @useResult
  $Res call({String? hata, String? hataAciklama});
}

/// @nodoc
class _$KartYazimResponseCopyWithImpl<$Res, $Val extends KartYazimResponse>
    implements $KartYazimResponseCopyWith<$Res> {
  _$KartYazimResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KartYazimResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hata = freezed, Object? hataAciklama = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KartYazimResponseImplCopyWith<$Res>
    implements $KartYazimResponseCopyWith<$Res> {
  factory _$$KartYazimResponseImplCopyWith(
    _$KartYazimResponseImpl value,
    $Res Function(_$KartYazimResponseImpl) then,
  ) = __$$KartYazimResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hata, String? hataAciklama});
}

/// @nodoc
class __$$KartYazimResponseImplCopyWithImpl<$Res>
    extends _$KartYazimResponseCopyWithImpl<$Res, _$KartYazimResponseImpl>
    implements _$$KartYazimResponseImplCopyWith<$Res> {
  __$$KartYazimResponseImplCopyWithImpl(
    _$KartYazimResponseImpl _value,
    $Res Function(_$KartYazimResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KartYazimResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hata = freezed, Object? hataAciklama = freezed}) {
    return _then(
      _$KartYazimResponseImpl(
        hata: freezed == hata
            ? _value.hata
            : hata // ignore: cast_nullable_to_non_nullable
                  as String?,
        hataAciklama: freezed == hataAciklama
            ? _value.hataAciklama
            : hataAciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KartYazimResponseImpl implements _KartYazimResponse {
  const _$KartYazimResponseImpl({this.hata, this.hataAciklama});

  factory _$KartYazimResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$KartYazimResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;

  @override
  String toString() {
    return 'KartYazimResponse(hata: $hata, hataAciklama: $hataAciklama)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KartYazimResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hata, hataAciklama);

  /// Create a copy of KartYazimResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KartYazimResponseImplCopyWith<_$KartYazimResponseImpl> get copyWith =>
      __$$KartYazimResponseImplCopyWithImpl<_$KartYazimResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KartYazimResponseImplToJson(this);
  }
}

abstract class _KartYazimResponse implements KartYazimResponse {
  const factory _KartYazimResponse({
    final String? hata,
    final String? hataAciklama,
  }) = _$KartYazimResponseImpl;

  factory _KartYazimResponse.fromJson(Map<String, dynamic> json) =
      _$KartYazimResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;

  /// Create a copy of KartYazimResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KartYazimResponseImplCopyWith<_$KartYazimResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
