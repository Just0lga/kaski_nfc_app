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
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;
  String? get odemeId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get odemeBaslat => throw _privateConstructorUsedError;
  String? get odemeSonuc => throw _privateConstructorUsedError;
  String? get kartyazimSonuc => throw _privateConstructorUsedError;

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
    String? hata,
    String? hataAciklama,
    String? odemeId,
    Map<String, dynamic>? odemeBaslat,
    String? odemeSonuc,
    String? kartyazimSonuc,
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
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? odemeId = freezed,
    Object? odemeBaslat = freezed,
    Object? odemeSonuc = freezed,
    Object? kartyazimSonuc = freezed,
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
            odemeBaslat: freezed == odemeBaslat
                ? _value.odemeBaslat
                : odemeBaslat // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            odemeSonuc: freezed == odemeSonuc
                ? _value.odemeSonuc
                : odemeSonuc // ignore: cast_nullable_to_non_nullable
                      as String?,
            kartyazimSonuc: freezed == kartyazimSonuc
                ? _value.kartyazimSonuc
                : kartyazimSonuc // ignore: cast_nullable_to_non_nullable
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
    String? hata,
    String? hataAciklama,
    String? odemeId,
    Map<String, dynamic>? odemeBaslat,
    String? odemeSonuc,
    String? kartyazimSonuc,
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
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? odemeId = freezed,
    Object? odemeBaslat = freezed,
    Object? odemeSonuc = freezed,
    Object? kartyazimSonuc = freezed,
  }) {
    return _then(
      _$GecmisBilgilerResponseImpl(
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
        odemeBaslat: freezed == odemeBaslat
            ? _value._odemeBaslat
            : odemeBaslat // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        odemeSonuc: freezed == odemeSonuc
            ? _value.odemeSonuc
            : odemeSonuc // ignore: cast_nullable_to_non_nullable
                  as String?,
        kartyazimSonuc: freezed == kartyazimSonuc
            ? _value.kartyazimSonuc
            : kartyazimSonuc // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GecmisBilgilerResponseImpl implements _GecmisBilgilerResponse {
  const _$GecmisBilgilerResponseImpl({
    this.hata,
    this.hataAciklama,
    this.odemeId,
    final Map<String, dynamic>? odemeBaslat,
    this.odemeSonuc,
    this.kartyazimSonuc,
  }) : _odemeBaslat = odemeBaslat;

  factory _$GecmisBilgilerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GecmisBilgilerResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;
  @override
  final String? odemeId;
  final Map<String, dynamic>? _odemeBaslat;
  @override
  Map<String, dynamic>? get odemeBaslat {
    final value = _odemeBaslat;
    if (value == null) return null;
    if (_odemeBaslat is EqualUnmodifiableMapView) return _odemeBaslat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? odemeSonuc;
  @override
  final String? kartyazimSonuc;

  @override
  String toString() {
    return 'GecmisBilgilerResponse(hata: $hata, hataAciklama: $hataAciklama, odemeId: $odemeId, odemeBaslat: $odemeBaslat, odemeSonuc: $odemeSonuc, kartyazimSonuc: $kartyazimSonuc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GecmisBilgilerResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama) &&
            (identical(other.odemeId, odemeId) || other.odemeId == odemeId) &&
            const DeepCollectionEquality().equals(
              other._odemeBaslat,
              _odemeBaslat,
            ) &&
            (identical(other.odemeSonuc, odemeSonuc) ||
                other.odemeSonuc == odemeSonuc) &&
            (identical(other.kartyazimSonuc, kartyazimSonuc) ||
                other.kartyazimSonuc == kartyazimSonuc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hata,
    hataAciklama,
    odemeId,
    const DeepCollectionEquality().hash(_odemeBaslat),
    odemeSonuc,
    kartyazimSonuc,
  );

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
    final String? hata,
    final String? hataAciklama,
    final String? odemeId,
    final Map<String, dynamic>? odemeBaslat,
    final String? odemeSonuc,
    final String? kartyazimSonuc,
  }) = _$GecmisBilgilerResponseImpl;

  factory _GecmisBilgilerResponse.fromJson(Map<String, dynamic> json) =
      _$GecmisBilgilerResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;
  @override
  String? get odemeId;
  @override
  Map<String, dynamic>? get odemeBaslat;
  @override
  String? get odemeSonuc;
  @override
  String? get kartyazimSonuc;

  /// Create a copy of GecmisBilgilerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GecmisBilgilerResponseImplCopyWith<_$GecmisBilgilerResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
