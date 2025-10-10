// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gecmis_bilgiler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GecmisBilgilerRequest _$GecmisBilgilerRequestFromJson(
  Map<String, dynamic> json,
) {
  return _GecmisBilgilerRequest.fromJson(json);
}

/// @nodoc
mixin _$GecmisBilgilerRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;

  /// Serializes this GecmisBilgilerRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GecmisBilgilerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GecmisBilgilerRequestCopyWith<GecmisBilgilerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GecmisBilgilerRequestCopyWith<$Res> {
  factory $GecmisBilgilerRequestCopyWith(
    GecmisBilgilerRequest value,
    $Res Function(GecmisBilgilerRequest) then,
  ) = _$GecmisBilgilerRequestCopyWithImpl<$Res, GecmisBilgilerRequest>;
  @useResult
  $Res call({OturumBilgileri oturumBilgileri});

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$GecmisBilgilerRequestCopyWithImpl<
  $Res,
  $Val extends GecmisBilgilerRequest
>
    implements $GecmisBilgilerRequestCopyWith<$Res> {
  _$GecmisBilgilerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GecmisBilgilerRequest
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

  /// Create a copy of GecmisBilgilerRequest
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
abstract class _$$GecmisBilgilerRequestImplCopyWith<$Res>
    implements $GecmisBilgilerRequestCopyWith<$Res> {
  factory _$$GecmisBilgilerRequestImplCopyWith(
    _$GecmisBilgilerRequestImpl value,
    $Res Function(_$GecmisBilgilerRequestImpl) then,
  ) = __$$GecmisBilgilerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OturumBilgileri oturumBilgileri});

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$GecmisBilgilerRequestImplCopyWithImpl<$Res>
    extends
        _$GecmisBilgilerRequestCopyWithImpl<$Res, _$GecmisBilgilerRequestImpl>
    implements _$$GecmisBilgilerRequestImplCopyWith<$Res> {
  __$$GecmisBilgilerRequestImplCopyWithImpl(
    _$GecmisBilgilerRequestImpl _value,
    $Res Function(_$GecmisBilgilerRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GecmisBilgilerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? oturumBilgileri = null}) {
    return _then(
      _$GecmisBilgilerRequestImpl(
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
class _$GecmisBilgilerRequestImpl implements _GecmisBilgilerRequest {
  const _$GecmisBilgilerRequestImpl({required this.oturumBilgileri});

  factory _$GecmisBilgilerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GecmisBilgilerRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;

  @override
  String toString() {
    return 'GecmisBilgilerRequest(oturumBilgileri: $oturumBilgileri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GecmisBilgilerRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oturumBilgileri);

  /// Create a copy of GecmisBilgilerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GecmisBilgilerRequestImplCopyWith<_$GecmisBilgilerRequestImpl>
  get copyWith =>
      __$$GecmisBilgilerRequestImplCopyWithImpl<_$GecmisBilgilerRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GecmisBilgilerRequestImplToJson(this);
  }
}

abstract class _GecmisBilgilerRequest implements GecmisBilgilerRequest {
  const factory _GecmisBilgilerRequest({
    required final OturumBilgileri oturumBilgileri,
  }) = _$GecmisBilgilerRequestImpl;

  factory _GecmisBilgilerRequest.fromJson(Map<String, dynamic> json) =
      _$GecmisBilgilerRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;

  /// Create a copy of GecmisBilgilerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GecmisBilgilerRequestImplCopyWith<_$GecmisBilgilerRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

GecmisBilgilerResponse _$GecmisBilgilerResponseFromJson(
  Map<String, dynamic> json,
) {
  return _GecmisBilgilerResponse.fromJson(json);
}

/// @nodoc
mixin _$GecmisBilgilerResponse {
  int? get basBnkEntid => throw _privateConstructorUsedError;
  DateTime? get basIslemTarihi => throw _privateConstructorUsedError;
  String? get basOdemeId => throw _privateConstructorUsedError;
  int? get basPaydeskKodu => throw _privateConstructorUsedError;
  int? get basTon => throw _privateConstructorUsedError;
  double? get basTutar => throw _privateConstructorUsedError;
  String? get basUrl => throw _privateConstructorUsedError;
  DateTime? get guncellemeTarihi => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  DateTime? get kayitTarihi => throw _privateConstructorUsedError;
  DateTime? get krtYazimBaslangicTarihi => throw _privateConstructorUsedError;
  DateTime? get krtYazimTarihi => throw _privateConstructorUsedError;
  int? get kurumId => throw _privateConstructorUsedError;
  int? get otrmAboneNo => throw _privateConstructorUsedError;
  String? get otrmCihazId => throw _privateConstructorUsedError;
  String? get otrmCihazModel => throw _privateConstructorUsedError;
  String? get otrmKartSeriNo => throw _privateConstructorUsedError;
  DateTime? get otrmOturumTarihi => throw _privateConstructorUsedError;
  String? get otrmSayfa => throw _privateConstructorUsedError;
  String? get otrmUygulamaVersiyonu => throw _privateConstructorUsedError;
  String? get sncBanka => throw _privateConstructorUsedError;
  DateTime? get sncBankaIslemTarihi => throw _privateConstructorUsedError;
  String? get sncEkys => throw _privateConstructorUsedError;
  String? get sncEkysErr => throw _privateConstructorUsedError;
  DateTime? get sncEkysIslemTarihi => throw _privateConstructorUsedError;
  String? get sncEkysThkid => throw _privateConstructorUsedError;

  /// Serializes this GecmisBilgilerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GecmisBilgilerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GecmisBilgilerResponseCopyWith<GecmisBilgilerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GecmisBilgilerResponseCopyWith<$Res> {
  factory $GecmisBilgilerResponseCopyWith(
    GecmisBilgilerResponse value,
    $Res Function(GecmisBilgilerResponse) then,
  ) = _$GecmisBilgilerResponseCopyWithImpl<$Res, GecmisBilgilerResponse>;
  @useResult
  $Res call({
    int? basBnkEntid,
    DateTime? basIslemTarihi,
    String? basOdemeId,
    int? basPaydeskKodu,
    int? basTon,
    double? basTutar,
    String? basUrl,
    DateTime? guncellemeTarihi,
    int? id,
    DateTime? kayitTarihi,
    DateTime? krtYazimBaslangicTarihi,
    DateTime? krtYazimTarihi,
    int? kurumId,
    int? otrmAboneNo,
    String? otrmCihazId,
    String? otrmCihazModel,
    String? otrmKartSeriNo,
    DateTime? otrmOturumTarihi,
    String? otrmSayfa,
    String? otrmUygulamaVersiyonu,
    String? sncBanka,
    DateTime? sncBankaIslemTarihi,
    String? sncEkys,
    String? sncEkysErr,
    DateTime? sncEkysIslemTarihi,
    String? sncEkysThkid,
  });
}

/// @nodoc
class _$GecmisBilgilerResponseCopyWithImpl<
  $Res,
  $Val extends GecmisBilgilerResponse
>
    implements $GecmisBilgilerResponseCopyWith<$Res> {
  _$GecmisBilgilerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GecmisBilgilerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basBnkEntid = freezed,
    Object? basIslemTarihi = freezed,
    Object? basOdemeId = freezed,
    Object? basPaydeskKodu = freezed,
    Object? basTon = freezed,
    Object? basTutar = freezed,
    Object? basUrl = freezed,
    Object? guncellemeTarihi = freezed,
    Object? id = freezed,
    Object? kayitTarihi = freezed,
    Object? krtYazimBaslangicTarihi = freezed,
    Object? krtYazimTarihi = freezed,
    Object? kurumId = freezed,
    Object? otrmAboneNo = freezed,
    Object? otrmCihazId = freezed,
    Object? otrmCihazModel = freezed,
    Object? otrmKartSeriNo = freezed,
    Object? otrmOturumTarihi = freezed,
    Object? otrmSayfa = freezed,
    Object? otrmUygulamaVersiyonu = freezed,
    Object? sncBanka = freezed,
    Object? sncBankaIslemTarihi = freezed,
    Object? sncEkys = freezed,
    Object? sncEkysErr = freezed,
    Object? sncEkysIslemTarihi = freezed,
    Object? sncEkysThkid = freezed,
  }) {
    return _then(
      _value.copyWith(
            basBnkEntid: freezed == basBnkEntid
                ? _value.basBnkEntid
                : basBnkEntid // ignore: cast_nullable_to_non_nullable
                      as int?,
            basIslemTarihi: freezed == basIslemTarihi
                ? _value.basIslemTarihi
                : basIslemTarihi // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
                      as int?,
            basTutar: freezed == basTutar
                ? _value.basTutar
                : basTutar // ignore: cast_nullable_to_non_nullable
                      as double?,
            basUrl: freezed == basUrl
                ? _value.basUrl
                : basUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            guncellemeTarihi: freezed == guncellemeTarihi
                ? _value.guncellemeTarihi
                : guncellemeTarihi // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            kayitTarihi: freezed == kayitTarihi
                ? _value.kayitTarihi
                : kayitTarihi // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            krtYazimBaslangicTarihi: freezed == krtYazimBaslangicTarihi
                ? _value.krtYazimBaslangicTarihi
                : krtYazimBaslangicTarihi // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            krtYazimTarihi: freezed == krtYazimTarihi
                ? _value.krtYazimTarihi
                : krtYazimTarihi // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
                      as DateTime?,
            otrmSayfa: freezed == otrmSayfa
                ? _value.otrmSayfa
                : otrmSayfa // ignore: cast_nullable_to_non_nullable
                      as String?,
            otrmUygulamaVersiyonu: freezed == otrmUygulamaVersiyonu
                ? _value.otrmUygulamaVersiyonu
                : otrmUygulamaVersiyonu // ignore: cast_nullable_to_non_nullable
                      as String?,
            sncBanka: freezed == sncBanka
                ? _value.sncBanka
                : sncBanka // ignore: cast_nullable_to_non_nullable
                      as String?,
            sncBankaIslemTarihi: freezed == sncBankaIslemTarihi
                ? _value.sncBankaIslemTarihi
                : sncBankaIslemTarihi // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            sncEkys: freezed == sncEkys
                ? _value.sncEkys
                : sncEkys // ignore: cast_nullable_to_non_nullable
                      as String?,
            sncEkysErr: freezed == sncEkysErr
                ? _value.sncEkysErr
                : sncEkysErr // ignore: cast_nullable_to_non_nullable
                      as String?,
            sncEkysIslemTarihi: freezed == sncEkysIslemTarihi
                ? _value.sncEkysIslemTarihi
                : sncEkysIslemTarihi // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            sncEkysThkid: freezed == sncEkysThkid
                ? _value.sncEkysThkid
                : sncEkysThkid // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GecmisBilgilerResponseImplCopyWith<$Res>
    implements $GecmisBilgilerResponseCopyWith<$Res> {
  factory _$$GecmisBilgilerResponseImplCopyWith(
    _$GecmisBilgilerResponseImpl value,
    $Res Function(_$GecmisBilgilerResponseImpl) then,
  ) = __$$GecmisBilgilerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? basBnkEntid,
    DateTime? basIslemTarihi,
    String? basOdemeId,
    int? basPaydeskKodu,
    int? basTon,
    double? basTutar,
    String? basUrl,
    DateTime? guncellemeTarihi,
    int? id,
    DateTime? kayitTarihi,
    DateTime? krtYazimBaslangicTarihi,
    DateTime? krtYazimTarihi,
    int? kurumId,
    int? otrmAboneNo,
    String? otrmCihazId,
    String? otrmCihazModel,
    String? otrmKartSeriNo,
    DateTime? otrmOturumTarihi,
    String? otrmSayfa,
    String? otrmUygulamaVersiyonu,
    String? sncBanka,
    DateTime? sncBankaIslemTarihi,
    String? sncEkys,
    String? sncEkysErr,
    DateTime? sncEkysIslemTarihi,
    String? sncEkysThkid,
  });
}

/// @nodoc
class __$$GecmisBilgilerResponseImplCopyWithImpl<$Res>
    extends
        _$GecmisBilgilerResponseCopyWithImpl<$Res, _$GecmisBilgilerResponseImpl>
    implements _$$GecmisBilgilerResponseImplCopyWith<$Res> {
  __$$GecmisBilgilerResponseImplCopyWithImpl(
    _$GecmisBilgilerResponseImpl _value,
    $Res Function(_$GecmisBilgilerResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GecmisBilgilerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basBnkEntid = freezed,
    Object? basIslemTarihi = freezed,
    Object? basOdemeId = freezed,
    Object? basPaydeskKodu = freezed,
    Object? basTon = freezed,
    Object? basTutar = freezed,
    Object? basUrl = freezed,
    Object? guncellemeTarihi = freezed,
    Object? id = freezed,
    Object? kayitTarihi = freezed,
    Object? krtYazimBaslangicTarihi = freezed,
    Object? krtYazimTarihi = freezed,
    Object? kurumId = freezed,
    Object? otrmAboneNo = freezed,
    Object? otrmCihazId = freezed,
    Object? otrmCihazModel = freezed,
    Object? otrmKartSeriNo = freezed,
    Object? otrmOturumTarihi = freezed,
    Object? otrmSayfa = freezed,
    Object? otrmUygulamaVersiyonu = freezed,
    Object? sncBanka = freezed,
    Object? sncBankaIslemTarihi = freezed,
    Object? sncEkys = freezed,
    Object? sncEkysErr = freezed,
    Object? sncEkysIslemTarihi = freezed,
    Object? sncEkysThkid = freezed,
  }) {
    return _then(
      _$GecmisBilgilerResponseImpl(
        basBnkEntid: freezed == basBnkEntid
            ? _value.basBnkEntid
            : basBnkEntid // ignore: cast_nullable_to_non_nullable
                  as int?,
        basIslemTarihi: freezed == basIslemTarihi
            ? _value.basIslemTarihi
            : basIslemTarihi // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
                  as int?,
        basTutar: freezed == basTutar
            ? _value.basTutar
            : basTutar // ignore: cast_nullable_to_non_nullable
                  as double?,
        basUrl: freezed == basUrl
            ? _value.basUrl
            : basUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        guncellemeTarihi: freezed == guncellemeTarihi
            ? _value.guncellemeTarihi
            : guncellemeTarihi // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        kayitTarihi: freezed == kayitTarihi
            ? _value.kayitTarihi
            : kayitTarihi // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        krtYazimBaslangicTarihi: freezed == krtYazimBaslangicTarihi
            ? _value.krtYazimBaslangicTarihi
            : krtYazimBaslangicTarihi // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        krtYazimTarihi: freezed == krtYazimTarihi
            ? _value.krtYazimTarihi
            : krtYazimTarihi // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
                  as DateTime?,
        otrmSayfa: freezed == otrmSayfa
            ? _value.otrmSayfa
            : otrmSayfa // ignore: cast_nullable_to_non_nullable
                  as String?,
        otrmUygulamaVersiyonu: freezed == otrmUygulamaVersiyonu
            ? _value.otrmUygulamaVersiyonu
            : otrmUygulamaVersiyonu // ignore: cast_nullable_to_non_nullable
                  as String?,
        sncBanka: freezed == sncBanka
            ? _value.sncBanka
            : sncBanka // ignore: cast_nullable_to_non_nullable
                  as String?,
        sncBankaIslemTarihi: freezed == sncBankaIslemTarihi
            ? _value.sncBankaIslemTarihi
            : sncBankaIslemTarihi // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sncEkys: freezed == sncEkys
            ? _value.sncEkys
            : sncEkys // ignore: cast_nullable_to_non_nullable
                  as String?,
        sncEkysErr: freezed == sncEkysErr
            ? _value.sncEkysErr
            : sncEkysErr // ignore: cast_nullable_to_non_nullable
                  as String?,
        sncEkysIslemTarihi: freezed == sncEkysIslemTarihi
            ? _value.sncEkysIslemTarihi
            : sncEkysIslemTarihi // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sncEkysThkid: freezed == sncEkysThkid
            ? _value.sncEkysThkid
            : sncEkysThkid // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GecmisBilgilerResponseImpl implements _GecmisBilgilerResponse {
  const _$GecmisBilgilerResponseImpl({
    this.basBnkEntid,
    this.basIslemTarihi,
    this.basOdemeId,
    this.basPaydeskKodu,
    this.basTon,
    this.basTutar,
    this.basUrl,
    this.guncellemeTarihi,
    this.id,
    this.kayitTarihi,
    this.krtYazimBaslangicTarihi,
    this.krtYazimTarihi,
    this.kurumId,
    this.otrmAboneNo,
    this.otrmCihazId,
    this.otrmCihazModel,
    this.otrmKartSeriNo,
    this.otrmOturumTarihi,
    this.otrmSayfa,
    this.otrmUygulamaVersiyonu,
    this.sncBanka,
    this.sncBankaIslemTarihi,
    this.sncEkys,
    this.sncEkysErr,
    this.sncEkysIslemTarihi,
    this.sncEkysThkid,
  });

  factory _$GecmisBilgilerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GecmisBilgilerResponseImplFromJson(json);

  @override
  final int? basBnkEntid;
  @override
  final DateTime? basIslemTarihi;
  @override
  final String? basOdemeId;
  @override
  final int? basPaydeskKodu;
  @override
  final int? basTon;
  @override
  final double? basTutar;
  @override
  final String? basUrl;
  @override
  final DateTime? guncellemeTarihi;
  @override
  final int? id;
  @override
  final DateTime? kayitTarihi;
  @override
  final DateTime? krtYazimBaslangicTarihi;
  @override
  final DateTime? krtYazimTarihi;
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
  final DateTime? otrmOturumTarihi;
  @override
  final String? otrmSayfa;
  @override
  final String? otrmUygulamaVersiyonu;
  @override
  final String? sncBanka;
  @override
  final DateTime? sncBankaIslemTarihi;
  @override
  final String? sncEkys;
  @override
  final String? sncEkysErr;
  @override
  final DateTime? sncEkysIslemTarihi;
  @override
  final String? sncEkysThkid;

  @override
  String toString() {
    return 'GecmisBilgilerResponse(basBnkEntid: $basBnkEntid, basIslemTarihi: $basIslemTarihi, basOdemeId: $basOdemeId, basPaydeskKodu: $basPaydeskKodu, basTon: $basTon, basTutar: $basTutar, basUrl: $basUrl, guncellemeTarihi: $guncellemeTarihi, id: $id, kayitTarihi: $kayitTarihi, krtYazimBaslangicTarihi: $krtYazimBaslangicTarihi, krtYazimTarihi: $krtYazimTarihi, kurumId: $kurumId, otrmAboneNo: $otrmAboneNo, otrmCihazId: $otrmCihazId, otrmCihazModel: $otrmCihazModel, otrmKartSeriNo: $otrmKartSeriNo, otrmOturumTarihi: $otrmOturumTarihi, otrmSayfa: $otrmSayfa, otrmUygulamaVersiyonu: $otrmUygulamaVersiyonu, sncBanka: $sncBanka, sncBankaIslemTarihi: $sncBankaIslemTarihi, sncEkys: $sncEkys, sncEkysErr: $sncEkysErr, sncEkysIslemTarihi: $sncEkysIslemTarihi, sncEkysThkid: $sncEkysThkid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GecmisBilgilerResponseImpl &&
            (identical(other.basBnkEntid, basBnkEntid) ||
                other.basBnkEntid == basBnkEntid) &&
            (identical(other.basIslemTarihi, basIslemTarihi) ||
                other.basIslemTarihi == basIslemTarihi) &&
            (identical(other.basOdemeId, basOdemeId) ||
                other.basOdemeId == basOdemeId) &&
            (identical(other.basPaydeskKodu, basPaydeskKodu) ||
                other.basPaydeskKodu == basPaydeskKodu) &&
            (identical(other.basTon, basTon) || other.basTon == basTon) &&
            (identical(other.basTutar, basTutar) ||
                other.basTutar == basTutar) &&
            (identical(other.basUrl, basUrl) || other.basUrl == basUrl) &&
            (identical(other.guncellemeTarihi, guncellemeTarihi) ||
                other.guncellemeTarihi == guncellemeTarihi) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kayitTarihi, kayitTarihi) ||
                other.kayitTarihi == kayitTarihi) &&
            (identical(
                  other.krtYazimBaslangicTarihi,
                  krtYazimBaslangicTarihi,
                ) ||
                other.krtYazimBaslangicTarihi == krtYazimBaslangicTarihi) &&
            (identical(other.krtYazimTarihi, krtYazimTarihi) ||
                other.krtYazimTarihi == krtYazimTarihi) &&
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
                other.otrmUygulamaVersiyonu == otrmUygulamaVersiyonu) &&
            (identical(other.sncBanka, sncBanka) ||
                other.sncBanka == sncBanka) &&
            (identical(other.sncBankaIslemTarihi, sncBankaIslemTarihi) ||
                other.sncBankaIslemTarihi == sncBankaIslemTarihi) &&
            (identical(other.sncEkys, sncEkys) || other.sncEkys == sncEkys) &&
            (identical(other.sncEkysErr, sncEkysErr) ||
                other.sncEkysErr == sncEkysErr) &&
            (identical(other.sncEkysIslemTarihi, sncEkysIslemTarihi) ||
                other.sncEkysIslemTarihi == sncEkysIslemTarihi) &&
            (identical(other.sncEkysThkid, sncEkysThkid) ||
                other.sncEkysThkid == sncEkysThkid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    basBnkEntid,
    basIslemTarihi,
    basOdemeId,
    basPaydeskKodu,
    basTon,
    basTutar,
    basUrl,
    guncellemeTarihi,
    id,
    kayitTarihi,
    krtYazimBaslangicTarihi,
    krtYazimTarihi,
    kurumId,
    otrmAboneNo,
    otrmCihazId,
    otrmCihazModel,
    otrmKartSeriNo,
    otrmOturumTarihi,
    otrmSayfa,
    otrmUygulamaVersiyonu,
    sncBanka,
    sncBankaIslemTarihi,
    sncEkys,
    sncEkysErr,
    sncEkysIslemTarihi,
    sncEkysThkid,
  ]);

  /// Create a copy of GecmisBilgilerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GecmisBilgilerResponseImplCopyWith<_$GecmisBilgilerResponseImpl>
  get copyWith =>
      __$$GecmisBilgilerResponseImplCopyWithImpl<_$GecmisBilgilerResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GecmisBilgilerResponseImplToJson(this);
  }
}

abstract class _GecmisBilgilerResponse implements GecmisBilgilerResponse {
  const factory _GecmisBilgilerResponse({
    final int? basBnkEntid,
    final DateTime? basIslemTarihi,
    final String? basOdemeId,
    final int? basPaydeskKodu,
    final int? basTon,
    final double? basTutar,
    final String? basUrl,
    final DateTime? guncellemeTarihi,
    final int? id,
    final DateTime? kayitTarihi,
    final DateTime? krtYazimBaslangicTarihi,
    final DateTime? krtYazimTarihi,
    final int? kurumId,
    final int? otrmAboneNo,
    final String? otrmCihazId,
    final String? otrmCihazModel,
    final String? otrmKartSeriNo,
    final DateTime? otrmOturumTarihi,
    final String? otrmSayfa,
    final String? otrmUygulamaVersiyonu,
    final String? sncBanka,
    final DateTime? sncBankaIslemTarihi,
    final String? sncEkys,
    final String? sncEkysErr,
    final DateTime? sncEkysIslemTarihi,
    final String? sncEkysThkid,
  }) = _$GecmisBilgilerResponseImpl;

  factory _GecmisBilgilerResponse.fromJson(Map<String, dynamic> json) =
      _$GecmisBilgilerResponseImpl.fromJson;

  @override
  int? get basBnkEntid;
  @override
  DateTime? get basIslemTarihi;
  @override
  String? get basOdemeId;
  @override
  int? get basPaydeskKodu;
  @override
  int? get basTon;
  @override
  double? get basTutar;
  @override
  String? get basUrl;
  @override
  DateTime? get guncellemeTarihi;
  @override
  int? get id;
  @override
  DateTime? get kayitTarihi;
  @override
  DateTime? get krtYazimBaslangicTarihi;
  @override
  DateTime? get krtYazimTarihi;
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
  DateTime? get otrmOturumTarihi;
  @override
  String? get otrmSayfa;
  @override
  String? get otrmUygulamaVersiyonu;
  @override
  String? get sncBanka;
  @override
  DateTime? get sncBankaIslemTarihi;
  @override
  String? get sncEkys;
  @override
  String? get sncEkysErr;
  @override
  DateTime? get sncEkysIslemTarihi;
  @override
  String? get sncEkysThkid;

  /// Create a copy of GecmisBilgilerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GecmisBilgilerResponseImplCopyWith<_$GecmisBilgilerResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
