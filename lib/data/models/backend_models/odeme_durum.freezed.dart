// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odeme_durum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OdemeDurumRequest _$OdemeDurumRequestFromJson(Map<String, dynamic> json) {
  return _OdemeDurumRequest.fromJson(json);
}

/// @nodoc
mixin _$OdemeDurumRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;
  String get odemeId => throw _privateConstructorUsedError;

  /// Serializes this OdemeDurumRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdemeDurumRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdemeDurumRequestCopyWith<OdemeDurumRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdemeDurumRequestCopyWith<$Res> {
  factory $OdemeDurumRequestCopyWith(
    OdemeDurumRequest value,
    $Res Function(OdemeDurumRequest) then,
  ) = _$OdemeDurumRequestCopyWithImpl<$Res, OdemeDurumRequest>;
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String odemeId});

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$OdemeDurumRequestCopyWithImpl<$Res, $Val extends OdemeDurumRequest>
    implements $OdemeDurumRequestCopyWith<$Res> {
  _$OdemeDurumRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdemeDurumRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null, Object? odemeId = null}) {
    return _then(
      _value.copyWith(
            oturumBilgileri: null == oturumBilgileri
                ? _value.oturumBilgileri
                : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                      as OturumBilgileri,
            odemeId: null == odemeId
                ? _value.odemeId
                : odemeId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of OdemeDurumRequest
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
abstract class _$$OdemeDurumRequestImplCopyWith<$Res>
    implements $OdemeDurumRequestCopyWith<$Res> {
  factory _$$OdemeDurumRequestImplCopyWith(
    _$OdemeDurumRequestImpl value,
    $Res Function(_$OdemeDurumRequestImpl) then,
  ) = __$$OdemeDurumRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String odemeId});

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$OdemeDurumRequestImplCopyWithImpl<$Res>
    extends _$OdemeDurumRequestCopyWithImpl<$Res, _$OdemeDurumRequestImpl>
    implements _$$OdemeDurumRequestImplCopyWith<$Res> {
  __$$OdemeDurumRequestImplCopyWithImpl(
    _$OdemeDurumRequestImpl _value,
    $Res Function(_$OdemeDurumRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OdemeDurumRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null, Object? odemeId = null}) {
    return _then(
      _$OdemeDurumRequestImpl(
        oturumBilgileri: null == oturumBilgileri
            ? _value.oturumBilgileri
            : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                  as OturumBilgileri,
        odemeId: null == odemeId
            ? _value.odemeId
            : odemeId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OdemeDurumRequestImpl implements _OdemeDurumRequest {
  const _$OdemeDurumRequestImpl({
    required this.oturumBilgileri,
    required this.odemeId,
  });

  factory _$OdemeDurumRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdemeDurumRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;
  @override
  final String odemeId;

  @override
  String toString() {
    return 'OdemeDurumRequest(oturumBilgileri: $oturumBilgileri, odemeId: $odemeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdemeDurumRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri) &&
            (identical(other.odemeId, odemeId) || other.odemeId == odemeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oturumBilgileri, odemeId);

  /// Create a copy of OdemeDurumRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdemeDurumRequestImplCopyWith<_$OdemeDurumRequestImpl> get copyWith =>
      __$$OdemeDurumRequestImplCopyWithImpl<_$OdemeDurumRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OdemeDurumRequestImplToJson(this);
  }
}

abstract class _OdemeDurumRequest implements OdemeDurumRequest {
  const factory _OdemeDurumRequest({
    required final OturumBilgileri oturumBilgileri,
    required final String odemeId,
  }) = _$OdemeDurumRequestImpl;

  factory _OdemeDurumRequest.fromJson(Map<String, dynamic> json) =
      _$OdemeDurumRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;
  @override
  String get odemeId;

  /// Create a copy of OdemeDurumRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdemeDurumRequestImplCopyWith<_$OdemeDurumRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OdemeDurumResponse _$OdemeDurumResponseFromJson(Map<String, dynamic> json) {
  return _OdemeDurumResponse.fromJson(json);
}

/// @nodoc
mixin _$OdemeDurumResponse {
  String? get basIslemTarihi => throw _privateConstructorUsedError;
  String? get basOdemeId => throw _privateConstructorUsedError;
  int? get basPaydeskKodu => throw _privateConstructorUsedError;
  double? get basTon => throw _privateConstructorUsedError;
  double? get basTutar => throw _privateConstructorUsedError;
  String? get guncellemeTarihi => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get kayitTarihi => throw _privateConstructorUsedError;
  int? get kurumId => throw _privateConstructorUsedError;
  int? get otrmAboneNo => throw _privateConstructorUsedError;
  String? get otrmCihazId => throw _privateConstructorUsedError;
  String? get otrmCihazModel => throw _privateConstructorUsedError;
  String? get otrmKartSeriNo => throw _privateConstructorUsedError;
  String? get otrmOturumTarihi => throw _privateConstructorUsedError;
  String? get otrmSayfa => throw _privateConstructorUsedError;
  String? get otrmUygulamaVersiyonu => throw _privateConstructorUsedError;

  /// Serializes this OdemeDurumResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdemeDurumResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdemeDurumResponseCopyWith<OdemeDurumResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdemeDurumResponseCopyWith<$Res> {
  factory $OdemeDurumResponseCopyWith(
    OdemeDurumResponse value,
    $Res Function(OdemeDurumResponse) then,
  ) = _$OdemeDurumResponseCopyWithImpl<$Res, OdemeDurumResponse>;
  @useResult
  $Res call({
    String? basIslemTarihi,
    String? basOdemeId,
    int? basPaydeskKodu,
    double? basTon,
    double? basTutar,
    String? guncellemeTarihi,
    int? id,
    String? kayitTarihi,
    int? kurumId,
    int? otrmAboneNo,
    String? otrmCihazId,
    String? otrmCihazModel,
    String? otrmKartSeriNo,
    String? otrmOturumTarihi,
    String? otrmSayfa,
    String? otrmUygulamaVersiyonu,
  });
}

/// @nodoc
class _$OdemeDurumResponseCopyWithImpl<$Res, $Val extends OdemeDurumResponse>
    implements $OdemeDurumResponseCopyWith<$Res> {
  _$OdemeDurumResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdemeDurumResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basIslemTarihi = freezed,
    Object? basOdemeId = freezed,
    Object? basPaydeskKodu = freezed,
    Object? basTon = freezed,
    Object? basTutar = freezed,
    Object? guncellemeTarihi = freezed,
    Object? id = freezed,
    Object? kayitTarihi = freezed,
    Object? kurumId = freezed,
    Object? otrmAboneNo = freezed,
    Object? otrmCihazId = freezed,
    Object? otrmCihazModel = freezed,
    Object? otrmKartSeriNo = freezed,
    Object? otrmOturumTarihi = freezed,
    Object? otrmSayfa = freezed,
    Object? otrmUygulamaVersiyonu = freezed,
  }) {
    return _then(
      _value.copyWith(
            basIslemTarihi: freezed == basIslemTarihi
                ? _value.basIslemTarihi
                : basIslemTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            basOdemeId: freezed == basOdemeId
                ? _value.basOdemeId
                : basOdemeId // ignore: cast_nullable_to_non_nullable
                      as String?,
            basPaydeskKodu: freezed == basPaydeskKodu
                ? _value.basPaydeskKodu
                : basPaydeskKodu // ignore: cast_nullable_to_non_nullable
                      as int?,
            basTon: freezed == basTon
                ? _value.basTon
                : basTon // ignore: cast_nullable_to_non_nullable
                      as double?,
            basTutar: freezed == basTutar
                ? _value.basTutar
                : basTutar // ignore: cast_nullable_to_non_nullable
                      as double?,
            guncellemeTarihi: freezed == guncellemeTarihi
                ? _value.guncellemeTarihi
                : guncellemeTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            kayitTarihi: freezed == kayitTarihi
                ? _value.kayitTarihi
                : kayitTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            kurumId: freezed == kurumId
                ? _value.kurumId
                : kurumId // ignore: cast_nullable_to_non_nullable
                      as int?,
            otrmAboneNo: freezed == otrmAboneNo
                ? _value.otrmAboneNo
                : otrmAboneNo // ignore: cast_nullable_to_non_nullable
                      as int?,
            otrmCihazId: freezed == otrmCihazId
                ? _value.otrmCihazId
                : otrmCihazId // ignore: cast_nullable_to_non_nullable
                      as String?,
            otrmCihazModel: freezed == otrmCihazModel
                ? _value.otrmCihazModel
                : otrmCihazModel // ignore: cast_nullable_to_non_nullable
                      as String?,
            otrmKartSeriNo: freezed == otrmKartSeriNo
                ? _value.otrmKartSeriNo
                : otrmKartSeriNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            otrmOturumTarihi: freezed == otrmOturumTarihi
                ? _value.otrmOturumTarihi
                : otrmOturumTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            otrmSayfa: freezed == otrmSayfa
                ? _value.otrmSayfa
                : otrmSayfa // ignore: cast_nullable_to_non_nullable
                      as String?,
            otrmUygulamaVersiyonu: freezed == otrmUygulamaVersiyonu
                ? _value.otrmUygulamaVersiyonu
                : otrmUygulamaVersiyonu // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OdemeDurumResponseImplCopyWith<$Res>
    implements $OdemeDurumResponseCopyWith<$Res> {
  factory _$$OdemeDurumResponseImplCopyWith(
    _$OdemeDurumResponseImpl value,
    $Res Function(_$OdemeDurumResponseImpl) then,
  ) = __$$OdemeDurumResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? basIslemTarihi,
    String? basOdemeId,
    int? basPaydeskKodu,
    double? basTon,
    double? basTutar,
    String? guncellemeTarihi,
    int? id,
    String? kayitTarihi,
    int? kurumId,
    int? otrmAboneNo,
    String? otrmCihazId,
    String? otrmCihazModel,
    String? otrmKartSeriNo,
    String? otrmOturumTarihi,
    String? otrmSayfa,
    String? otrmUygulamaVersiyonu,
  });
}

/// @nodoc
class __$$OdemeDurumResponseImplCopyWithImpl<$Res>
    extends _$OdemeDurumResponseCopyWithImpl<$Res, _$OdemeDurumResponseImpl>
    implements _$$OdemeDurumResponseImplCopyWith<$Res> {
  __$$OdemeDurumResponseImplCopyWithImpl(
    _$OdemeDurumResponseImpl _value,
    $Res Function(_$OdemeDurumResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OdemeDurumResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basIslemTarihi = freezed,
    Object? basOdemeId = freezed,
    Object? basPaydeskKodu = freezed,
    Object? basTon = freezed,
    Object? basTutar = freezed,
    Object? guncellemeTarihi = freezed,
    Object? id = freezed,
    Object? kayitTarihi = freezed,
    Object? kurumId = freezed,
    Object? otrmAboneNo = freezed,
    Object? otrmCihazId = freezed,
    Object? otrmCihazModel = freezed,
    Object? otrmKartSeriNo = freezed,
    Object? otrmOturumTarihi = freezed,
    Object? otrmSayfa = freezed,
    Object? otrmUygulamaVersiyonu = freezed,
  }) {
    return _then(
      _$OdemeDurumResponseImpl(
        basIslemTarihi: freezed == basIslemTarihi
            ? _value.basIslemTarihi
            : basIslemTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        basOdemeId: freezed == basOdemeId
            ? _value.basOdemeId
            : basOdemeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        basPaydeskKodu: freezed == basPaydeskKodu
            ? _value.basPaydeskKodu
            : basPaydeskKodu // ignore: cast_nullable_to_non_nullable
                  as int?,
        basTon: freezed == basTon
            ? _value.basTon
            : basTon // ignore: cast_nullable_to_non_nullable
                  as double?,
        basTutar: freezed == basTutar
            ? _value.basTutar
            : basTutar // ignore: cast_nullable_to_non_nullable
                  as double?,
        guncellemeTarihi: freezed == guncellemeTarihi
            ? _value.guncellemeTarihi
            : guncellemeTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        kayitTarihi: freezed == kayitTarihi
            ? _value.kayitTarihi
            : kayitTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        kurumId: freezed == kurumId
            ? _value.kurumId
            : kurumId // ignore: cast_nullable_to_non_nullable
                  as int?,
        otrmAboneNo: freezed == otrmAboneNo
            ? _value.otrmAboneNo
            : otrmAboneNo // ignore: cast_nullable_to_non_nullable
                  as int?,
        otrmCihazId: freezed == otrmCihazId
            ? _value.otrmCihazId
            : otrmCihazId // ignore: cast_nullable_to_non_nullable
                  as String?,
        otrmCihazModel: freezed == otrmCihazModel
            ? _value.otrmCihazModel
            : otrmCihazModel // ignore: cast_nullable_to_non_nullable
                  as String?,
        otrmKartSeriNo: freezed == otrmKartSeriNo
            ? _value.otrmKartSeriNo
            : otrmKartSeriNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        otrmOturumTarihi: freezed == otrmOturumTarihi
            ? _value.otrmOturumTarihi
            : otrmOturumTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        otrmSayfa: freezed == otrmSayfa
            ? _value.otrmSayfa
            : otrmSayfa // ignore: cast_nullable_to_non_nullable
                  as String?,
        otrmUygulamaVersiyonu: freezed == otrmUygulamaVersiyonu
            ? _value.otrmUygulamaVersiyonu
            : otrmUygulamaVersiyonu // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OdemeDurumResponseImpl implements _OdemeDurumResponse {
  const _$OdemeDurumResponseImpl({
    this.basIslemTarihi,
    this.basOdemeId,
    this.basPaydeskKodu,
    this.basTon,
    this.basTutar,
    this.guncellemeTarihi,
    this.id,
    this.kayitTarihi,
    this.kurumId,
    this.otrmAboneNo,
    this.otrmCihazId,
    this.otrmCihazModel,
    this.otrmKartSeriNo,
    this.otrmOturumTarihi,
    this.otrmSayfa,
    this.otrmUygulamaVersiyonu,
  });

  factory _$OdemeDurumResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdemeDurumResponseImplFromJson(json);

  @override
  final String? basIslemTarihi;
  @override
  final String? basOdemeId;
  @override
  final int? basPaydeskKodu;
  @override
  final double? basTon;
  @override
  final double? basTutar;
  @override
  final String? guncellemeTarihi;
  @override
  final int? id;
  @override
  final String? kayitTarihi;
  @override
  final int? kurumId;
  @override
  final int? otrmAboneNo;
  @override
  final String? otrmCihazId;
  @override
  final String? otrmCihazModel;
  @override
  final String? otrmKartSeriNo;
  @override
  final String? otrmOturumTarihi;
  @override
  final String? otrmSayfa;
  @override
  final String? otrmUygulamaVersiyonu;

  @override
  String toString() {
    return 'OdemeDurumResponse(basIslemTarihi: $basIslemTarihi, basOdemeId: $basOdemeId, basPaydeskKodu: $basPaydeskKodu, basTon: $basTon, basTutar: $basTutar, guncellemeTarihi: $guncellemeTarihi, id: $id, kayitTarihi: $kayitTarihi, kurumId: $kurumId, otrmAboneNo: $otrmAboneNo, otrmCihazId: $otrmCihazId, otrmCihazModel: $otrmCihazModel, otrmKartSeriNo: $otrmKartSeriNo, otrmOturumTarihi: $otrmOturumTarihi, otrmSayfa: $otrmSayfa, otrmUygulamaVersiyonu: $otrmUygulamaVersiyonu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdemeDurumResponseImpl &&
            (identical(other.basIslemTarihi, basIslemTarihi) ||
                other.basIslemTarihi == basIslemTarihi) &&
            (identical(other.basOdemeId, basOdemeId) ||
                other.basOdemeId == basOdemeId) &&
            (identical(other.basPaydeskKodu, basPaydeskKodu) ||
                other.basPaydeskKodu == basPaydeskKodu) &&
            (identical(other.basTon, basTon) || other.basTon == basTon) &&
            (identical(other.basTutar, basTutar) ||
                other.basTutar == basTutar) &&
            (identical(other.guncellemeTarihi, guncellemeTarihi) ||
                other.guncellemeTarihi == guncellemeTarihi) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kayitTarihi, kayitTarihi) ||
                other.kayitTarihi == kayitTarihi) &&
            (identical(other.kurumId, kurumId) || other.kurumId == kurumId) &&
            (identical(other.otrmAboneNo, otrmAboneNo) ||
                other.otrmAboneNo == otrmAboneNo) &&
            (identical(other.otrmCihazId, otrmCihazId) ||
                other.otrmCihazId == otrmCihazId) &&
            (identical(other.otrmCihazModel, otrmCihazModel) ||
                other.otrmCihazModel == otrmCihazModel) &&
            (identical(other.otrmKartSeriNo, otrmKartSeriNo) ||
                other.otrmKartSeriNo == otrmKartSeriNo) &&
            (identical(other.otrmOturumTarihi, otrmOturumTarihi) ||
                other.otrmOturumTarihi == otrmOturumTarihi) &&
            (identical(other.otrmSayfa, otrmSayfa) ||
                other.otrmSayfa == otrmSayfa) &&
            (identical(other.otrmUygulamaVersiyonu, otrmUygulamaVersiyonu) ||
                other.otrmUygulamaVersiyonu == otrmUygulamaVersiyonu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    basIslemTarihi,
    basOdemeId,
    basPaydeskKodu,
    basTon,
    basTutar,
    guncellemeTarihi,
    id,
    kayitTarihi,
    kurumId,
    otrmAboneNo,
    otrmCihazId,
    otrmCihazModel,
    otrmKartSeriNo,
    otrmOturumTarihi,
    otrmSayfa,
    otrmUygulamaVersiyonu,
  );

  /// Create a copy of OdemeDurumResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdemeDurumResponseImplCopyWith<_$OdemeDurumResponseImpl> get copyWith =>
      __$$OdemeDurumResponseImplCopyWithImpl<_$OdemeDurumResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OdemeDurumResponseImplToJson(this);
  }
}

abstract class _OdemeDurumResponse implements OdemeDurumResponse {
  const factory _OdemeDurumResponse({
    final String? basIslemTarihi,
    final String? basOdemeId,
    final int? basPaydeskKodu,
    final double? basTon,
    final double? basTutar,
    final String? guncellemeTarihi,
    final int? id,
    final String? kayitTarihi,
    final int? kurumId,
    final int? otrmAboneNo,
    final String? otrmCihazId,
    final String? otrmCihazModel,
    final String? otrmKartSeriNo,
    final String? otrmOturumTarihi,
    final String? otrmSayfa,
    final String? otrmUygulamaVersiyonu,
  }) = _$OdemeDurumResponseImpl;

  factory _OdemeDurumResponse.fromJson(Map<String, dynamic> json) =
      _$OdemeDurumResponseImpl.fromJson;

  @override
  String? get basIslemTarihi;
  @override
  String? get basOdemeId;
  @override
  int? get basPaydeskKodu;
  @override
  double? get basTon;
  @override
  double? get basTutar;
  @override
  String? get guncellemeTarihi;
  @override
  int? get id;
  @override
  String? get kayitTarihi;
  @override
  int? get kurumId;
  @override
  int? get otrmAboneNo;
  @override
  String? get otrmCihazId;
  @override
  String? get otrmCihazModel;
  @override
  String? get otrmKartSeriNo;
  @override
  String? get otrmOturumTarihi;
  @override
  String? get otrmSayfa;
  @override
  String? get otrmUygulamaVersiyonu;

  /// Create a copy of OdemeDurumResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdemeDurumResponseImplCopyWith<_$OdemeDurumResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
