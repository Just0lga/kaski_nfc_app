// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odeme_baslat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OdemeBaslatRequest _$OdemeBaslatRequestFromJson(Map<String, dynamic> json) {
  return _OdemeBaslatRequest.fromJson(json);
}

/// @nodoc
mixin _$OdemeBaslatRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;
  String? get islemBaslangicTarihi => throw _privateConstructorUsedError;
  int? get paydeskKodu => throw _privateConstructorUsedError;
  KartBilgileri? get kartBilgileri => throw _privateConstructorUsedError;
  double? get ton => throw _privateConstructorUsedError;
  double? get tutar => throw _privateConstructorUsedError;

  /// Serializes this OdemeBaslatRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdemeBaslatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdemeBaslatRequestCopyWith<OdemeBaslatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdemeBaslatRequestCopyWith<$Res> {
  factory $OdemeBaslatRequestCopyWith(
    OdemeBaslatRequest value,
    $Res Function(OdemeBaslatRequest) then,
  ) = _$OdemeBaslatRequestCopyWithImpl<$Res, OdemeBaslatRequest>;
  @useResult
  $Res call({
    OturumBilgileri oturumBilgileri,
    String? islemBaslangicTarihi,
    int? paydeskKodu,
    KartBilgileri? kartBilgileri,
    double? ton,
    double? tutar,
  });

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
  $KartBilgileriCopyWith<$Res>? get kartBilgileri;
}

/// @nodoc
class _$OdemeBaslatRequestCopyWithImpl<$Res, $Val extends OdemeBaslatRequest>
    implements $OdemeBaslatRequestCopyWith<$Res> {
  _$OdemeBaslatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdemeBaslatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? islemBaslangicTarihi = freezed,
    Object? paydeskKodu = freezed,
    Object? kartBilgileri = freezed,
    Object? ton = freezed,
    Object? tutar = freezed,
  }) {
    return _then(
      _value.copyWith(
            oturumBilgileri: null == oturumBilgileri
                ? _value.oturumBilgileri
                : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                      as OturumBilgileri,
            islemBaslangicTarihi: freezed == islemBaslangicTarihi
                ? _value.islemBaslangicTarihi
                : islemBaslangicTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            paydeskKodu: freezed == paydeskKodu
                ? _value.paydeskKodu
                : paydeskKodu // ignore: cast_nullable_to_non_nullable
                      as int?,
            kartBilgileri: freezed == kartBilgileri
                ? _value.kartBilgileri
                : kartBilgileri // ignore: cast_nullable_to_non_nullable
                      as KartBilgileri?,
            ton: freezed == ton
                ? _value.ton
                : ton // ignore: cast_nullable_to_non_nullable
                      as double?,
            tutar: freezed == tutar
                ? _value.tutar
                : tutar // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }

  /// Create a copy of OdemeBaslatRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri {
    return $OturumBilgileriCopyWith<$Res>(_value.oturumBilgileri, (value) {
      return _then(_value.copyWith(oturumBilgileri: value) as $Val);
    });
  }

  /// Create a copy of OdemeBaslatRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KartBilgileriCopyWith<$Res>? get kartBilgileri {
    if (_value.kartBilgileri == null) {
      return null;
    }

    return $KartBilgileriCopyWith<$Res>(_value.kartBilgileri!, (value) {
      return _then(_value.copyWith(kartBilgileri: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OdemeBaslatRequestImplCopyWith<$Res>
    implements $OdemeBaslatRequestCopyWith<$Res> {
  factory _$$OdemeBaslatRequestImplCopyWith(
    _$OdemeBaslatRequestImpl value,
    $Res Function(_$OdemeBaslatRequestImpl) then,
  ) = __$$OdemeBaslatRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    OturumBilgileri oturumBilgileri,
    String? islemBaslangicTarihi,
    int? paydeskKodu,
    KartBilgileri? kartBilgileri,
    double? ton,
    double? tutar,
  });

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
  @override
  $KartBilgileriCopyWith<$Res>? get kartBilgileri;
}

/// @nodoc
class __$$OdemeBaslatRequestImplCopyWithImpl<$Res>
    extends _$OdemeBaslatRequestCopyWithImpl<$Res, _$OdemeBaslatRequestImpl>
    implements _$$OdemeBaslatRequestImplCopyWith<$Res> {
  __$$OdemeBaslatRequestImplCopyWithImpl(
    _$OdemeBaslatRequestImpl _value,
    $Res Function(_$OdemeBaslatRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OdemeBaslatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? islemBaslangicTarihi = freezed,
    Object? paydeskKodu = freezed,
    Object? kartBilgileri = freezed,
    Object? ton = freezed,
    Object? tutar = freezed,
  }) {
    return _then(
      _$OdemeBaslatRequestImpl(
        oturumBilgileri: null == oturumBilgileri
            ? _value.oturumBilgileri
            : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                  as OturumBilgileri,
        islemBaslangicTarihi: freezed == islemBaslangicTarihi
            ? _value.islemBaslangicTarihi
            : islemBaslangicTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        paydeskKodu: freezed == paydeskKodu
            ? _value.paydeskKodu
            : paydeskKodu // ignore: cast_nullable_to_non_nullable
                  as int?,
        kartBilgileri: freezed == kartBilgileri
            ? _value.kartBilgileri
            : kartBilgileri // ignore: cast_nullable_to_non_nullable
                  as KartBilgileri?,
        ton: freezed == ton
            ? _value.ton
            : ton // ignore: cast_nullable_to_non_nullable
                  as double?,
        tutar: freezed == tutar
            ? _value.tutar
            : tutar // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OdemeBaslatRequestImpl implements _OdemeBaslatRequest {
  const _$OdemeBaslatRequestImpl({
    required this.oturumBilgileri,
    this.islemBaslangicTarihi,
    this.paydeskKodu,
    this.kartBilgileri,
    this.ton,
    this.tutar,
  });

  factory _$OdemeBaslatRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdemeBaslatRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;
  @override
  final String? islemBaslangicTarihi;
  @override
  final int? paydeskKodu;
  @override
  final KartBilgileri? kartBilgileri;
  @override
  final double? ton;
  @override
  final double? tutar;

  @override
  String toString() {
    return 'OdemeBaslatRequest(oturumBilgileri: $oturumBilgileri, islemBaslangicTarihi: $islemBaslangicTarihi, paydeskKodu: $paydeskKodu, kartBilgileri: $kartBilgileri, ton: $ton, tutar: $tutar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdemeBaslatRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri) &&
            (identical(other.islemBaslangicTarihi, islemBaslangicTarihi) ||
                other.islemBaslangicTarihi == islemBaslangicTarihi) &&
            (identical(other.paydeskKodu, paydeskKodu) ||
                other.paydeskKodu == paydeskKodu) &&
            (identical(other.kartBilgileri, kartBilgileri) ||
                other.kartBilgileri == kartBilgileri) &&
            (identical(other.ton, ton) || other.ton == ton) &&
            (identical(other.tutar, tutar) || other.tutar == tutar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    oturumBilgileri,
    islemBaslangicTarihi,
    paydeskKodu,
    kartBilgileri,
    ton,
    tutar,
  );

  /// Create a copy of OdemeBaslatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdemeBaslatRequestImplCopyWith<_$OdemeBaslatRequestImpl> get copyWith =>
      __$$OdemeBaslatRequestImplCopyWithImpl<_$OdemeBaslatRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OdemeBaslatRequestImplToJson(this);
  }
}

abstract class _OdemeBaslatRequest implements OdemeBaslatRequest {
  const factory _OdemeBaslatRequest({
    required final OturumBilgileri oturumBilgileri,
    final String? islemBaslangicTarihi,
    final int? paydeskKodu,
    final KartBilgileri? kartBilgileri,
    final double? ton,
    final double? tutar,
  }) = _$OdemeBaslatRequestImpl;

  factory _OdemeBaslatRequest.fromJson(Map<String, dynamic> json) =
      _$OdemeBaslatRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;
  @override
  String? get islemBaslangicTarihi;
  @override
  int? get paydeskKodu;
  @override
  KartBilgileri? get kartBilgileri;
  @override
  double? get ton;
  @override
  double? get tutar;

  /// Create a copy of OdemeBaslatRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdemeBaslatRequestImplCopyWith<_$OdemeBaslatRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OdemeBaslatResponse _$OdemeBaslatResponseFromJson(Map<String, dynamic> json) {
  return _OdemeBaslatResponse.fromJson(json);
}

/// @nodoc
mixin _$OdemeBaslatResponse {
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;
  String? get odemeId => throw _privateConstructorUsedError;
  String? get islemUrl => throw _privateConstructorUsedError;

  /// Serializes this OdemeBaslatResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdemeBaslatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdemeBaslatResponseCopyWith<OdemeBaslatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdemeBaslatResponseCopyWith<$Res> {
  factory $OdemeBaslatResponseCopyWith(
    OdemeBaslatResponse value,
    $Res Function(OdemeBaslatResponse) then,
  ) = _$OdemeBaslatResponseCopyWithImpl<$Res, OdemeBaslatResponse>;
  @useResult
  $Res call({
    String? hata,
    String? hataAciklama,
    String? odemeId,
    String? islemUrl,
  });
}

/// @nodoc
class _$OdemeBaslatResponseCopyWithImpl<$Res, $Val extends OdemeBaslatResponse>
    implements $OdemeBaslatResponseCopyWith<$Res> {
  _$OdemeBaslatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdemeBaslatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? odemeId = freezed,
    Object? islemUrl = freezed,
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
            odemeId: freezed == odemeId
                ? _value.odemeId
                : odemeId // ignore: cast_nullable_to_non_nullable
                      as String?,
            islemUrl: freezed == islemUrl
                ? _value.islemUrl
                : islemUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OdemeBaslatResponseImplCopyWith<$Res>
    implements $OdemeBaslatResponseCopyWith<$Res> {
  factory _$$OdemeBaslatResponseImplCopyWith(
    _$OdemeBaslatResponseImpl value,
    $Res Function(_$OdemeBaslatResponseImpl) then,
  ) = __$$OdemeBaslatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? hata,
    String? hataAciklama,
    String? odemeId,
    String? islemUrl,
  });
}

/// @nodoc
class __$$OdemeBaslatResponseImplCopyWithImpl<$Res>
    extends _$OdemeBaslatResponseCopyWithImpl<$Res, _$OdemeBaslatResponseImpl>
    implements _$$OdemeBaslatResponseImplCopyWith<$Res> {
  __$$OdemeBaslatResponseImplCopyWithImpl(
    _$OdemeBaslatResponseImpl _value,
    $Res Function(_$OdemeBaslatResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OdemeBaslatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? odemeId = freezed,
    Object? islemUrl = freezed,
  }) {
    return _then(
      _$OdemeBaslatResponseImpl(
        hata: freezed == hata
            ? _value.hata
            : hata // ignore: cast_nullable_to_non_nullable
                  as String?,
        hataAciklama: freezed == hataAciklama
            ? _value.hataAciklama
            : hataAciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
        odemeId: freezed == odemeId
            ? _value.odemeId
            : odemeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        islemUrl: freezed == islemUrl
            ? _value.islemUrl
            : islemUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OdemeBaslatResponseImpl implements _OdemeBaslatResponse {
  const _$OdemeBaslatResponseImpl({
    this.hata,
    this.hataAciklama,
    this.odemeId,
    this.islemUrl,
  });

  factory _$OdemeBaslatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdemeBaslatResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;
  @override
  final String? odemeId;
  @override
  final String? islemUrl;

  @override
  String toString() {
    return 'OdemeBaslatResponse(hata: $hata, hataAciklama: $hataAciklama, odemeId: $odemeId, islemUrl: $islemUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdemeBaslatResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama) &&
            (identical(other.odemeId, odemeId) || other.odemeId == odemeId) &&
            (identical(other.islemUrl, islemUrl) ||
                other.islemUrl == islemUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hata, hataAciklama, odemeId, islemUrl);

  /// Create a copy of OdemeBaslatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdemeBaslatResponseImplCopyWith<_$OdemeBaslatResponseImpl> get copyWith =>
      __$$OdemeBaslatResponseImplCopyWithImpl<_$OdemeBaslatResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OdemeBaslatResponseImplToJson(this);
  }
}

abstract class _OdemeBaslatResponse implements OdemeBaslatResponse {
  const factory _OdemeBaslatResponse({
    final String? hata,
    final String? hataAciklama,
    final String? odemeId,
    final String? islemUrl,
  }) = _$OdemeBaslatResponseImpl;

  factory _OdemeBaslatResponse.fromJson(Map<String, dynamic> json) =
      _$OdemeBaslatResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;
  @override
  String? get odemeId;
  @override
  String? get islemUrl;

  /// Create a copy of OdemeBaslatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdemeBaslatResponseImplCopyWith<_$OdemeBaslatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
