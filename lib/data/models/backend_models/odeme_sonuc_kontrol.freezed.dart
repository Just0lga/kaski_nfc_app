// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'odeme_sonuc_kontrol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OdemeSonucKontrolRequest _$OdemeSonucKontrolRequestFromJson(
  Map<String, dynamic> json,
) {
  return _OdemeSonucKontrolRequest.fromJson(json);
}

/// @nodoc
mixin _$OdemeSonucKontrolRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;
  String? get odemeId => throw _privateConstructorUsedError;
  String? get sonuc => throw _privateConstructorUsedError;

  /// Serializes this OdemeSonucKontrolRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdemeSonucKontrolRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdemeSonucKontrolRequestCopyWith<OdemeSonucKontrolRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdemeSonucKontrolRequestCopyWith<$Res> {
  factory $OdemeSonucKontrolRequestCopyWith(
    OdemeSonucKontrolRequest value,
    $Res Function(OdemeSonucKontrolRequest) then,
  ) = _$OdemeSonucKontrolRequestCopyWithImpl<$Res, OdemeSonucKontrolRequest>;
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String? odemeId, String? sonuc});

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$OdemeSonucKontrolRequestCopyWithImpl<
  $Res,
  $Val extends OdemeSonucKontrolRequest
>
    implements $OdemeSonucKontrolRequestCopyWith<$Res> {
  _$OdemeSonucKontrolRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdemeSonucKontrolRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? odemeId = freezed,
    Object? sonuc = freezed,
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
          )
          as $Val,
    );
  }

  /// Create a copy of OdemeSonucKontrolRequest
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
abstract class _$$OdemeSonucKontrolRequestImplCopyWith<$Res>
    implements $OdemeSonucKontrolRequestCopyWith<$Res> {
  factory _$$OdemeSonucKontrolRequestImplCopyWith(
    _$OdemeSonucKontrolRequestImpl value,
    $Res Function(_$OdemeSonucKontrolRequestImpl) then,
  ) = __$$OdemeSonucKontrolRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, String? odemeId, String? sonuc});

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$OdemeSonucKontrolRequestImplCopyWithImpl<$Res>
    extends
        _$OdemeSonucKontrolRequestCopyWithImpl<
          $Res,
          _$OdemeSonucKontrolRequestImpl
        >
    implements _$$OdemeSonucKontrolRequestImplCopyWith<$Res> {
  __$$OdemeSonucKontrolRequestImplCopyWithImpl(
    _$OdemeSonucKontrolRequestImpl _value,
    $Res Function(_$OdemeSonucKontrolRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OdemeSonucKontrolRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? odemeId = freezed,
    Object? sonuc = freezed,
  }) {
    return _then(
      _$OdemeSonucKontrolRequestImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OdemeSonucKontrolRequestImpl implements _OdemeSonucKontrolRequest {
  const _$OdemeSonucKontrolRequestImpl({
    required this.oturumBilgileri,
    this.odemeId,
    this.sonuc,
  });

  factory _$OdemeSonucKontrolRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdemeSonucKontrolRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;
  @override
  final String? odemeId;
  @override
  final String? sonuc;

  @override
  String toString() {
    return 'OdemeSonucKontrolRequest(oturumBilgileri: $oturumBilgileri, odemeId: $odemeId, sonuc: $sonuc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdemeSonucKontrolRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri) &&
            (identical(other.odemeId, odemeId) || other.odemeId == odemeId) &&
            (identical(other.sonuc, sonuc) || other.sonuc == sonuc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oturumBilgileri, odemeId, sonuc);

  /// Create a copy of OdemeSonucKontrolRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdemeSonucKontrolRequestImplCopyWith<_$OdemeSonucKontrolRequestImpl>
  get copyWith =>
      __$$OdemeSonucKontrolRequestImplCopyWithImpl<
        _$OdemeSonucKontrolRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OdemeSonucKontrolRequestImplToJson(this);
  }
}

abstract class _OdemeSonucKontrolRequest implements OdemeSonucKontrolRequest {
  const factory _OdemeSonucKontrolRequest({
    required final OturumBilgileri oturumBilgileri,
    final String? odemeId,
    final String? sonuc,
  }) = _$OdemeSonucKontrolRequestImpl;

  factory _OdemeSonucKontrolRequest.fromJson(Map<String, dynamic> json) =
      _$OdemeSonucKontrolRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;
  @override
  String? get odemeId;
  @override
  String? get sonuc;

  /// Create a copy of OdemeSonucKontrolRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdemeSonucKontrolRequestImplCopyWith<_$OdemeSonucKontrolRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

OdemeSonucKontrolResponse _$OdemeSonucKontrolResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OdemeSonucKontrolResponse.fromJson(json);
}

/// @nodoc
mixin _$OdemeSonucKontrolResponse {
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;
  String? get sonuc => throw _privateConstructorUsedError;

  /// Serializes this OdemeSonucKontrolResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OdemeSonucKontrolResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OdemeSonucKontrolResponseCopyWith<OdemeSonucKontrolResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OdemeSonucKontrolResponseCopyWith<$Res> {
  factory $OdemeSonucKontrolResponseCopyWith(
    OdemeSonucKontrolResponse value,
    $Res Function(OdemeSonucKontrolResponse) then,
  ) = _$OdemeSonucKontrolResponseCopyWithImpl<$Res, OdemeSonucKontrolResponse>;
  @useResult
  $Res call({String? hata, String? hataAciklama, String? sonuc});
}

/// @nodoc
class _$OdemeSonucKontrolResponseCopyWithImpl<
  $Res,
  $Val extends OdemeSonucKontrolResponse
>
    implements $OdemeSonucKontrolResponseCopyWith<$Res> {
  _$OdemeSonucKontrolResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OdemeSonucKontrolResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? sonuc = freezed,
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
            sonuc: freezed == sonuc
                ? _value.sonuc
                : sonuc // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OdemeSonucKontrolResponseImplCopyWith<$Res>
    implements $OdemeSonucKontrolResponseCopyWith<$Res> {
  factory _$$OdemeSonucKontrolResponseImplCopyWith(
    _$OdemeSonucKontrolResponseImpl value,
    $Res Function(_$OdemeSonucKontrolResponseImpl) then,
  ) = __$$OdemeSonucKontrolResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hata, String? hataAciklama, String? sonuc});
}

/// @nodoc
class __$$OdemeSonucKontrolResponseImplCopyWithImpl<$Res>
    extends
        _$OdemeSonucKontrolResponseCopyWithImpl<
          $Res,
          _$OdemeSonucKontrolResponseImpl
        >
    implements _$$OdemeSonucKontrolResponseImplCopyWith<$Res> {
  __$$OdemeSonucKontrolResponseImplCopyWithImpl(
    _$OdemeSonucKontrolResponseImpl _value,
    $Res Function(_$OdemeSonucKontrolResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OdemeSonucKontrolResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? sonuc = freezed,
  }) {
    return _then(
      _$OdemeSonucKontrolResponseImpl(
        hata: freezed == hata
            ? _value.hata
            : hata // ignore: cast_nullable_to_non_nullable
                  as String?,
        hataAciklama: freezed == hataAciklama
            ? _value.hataAciklama
            : hataAciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
        sonuc: freezed == sonuc
            ? _value.sonuc
            : sonuc // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OdemeSonucKontrolResponseImpl implements _OdemeSonucKontrolResponse {
  const _$OdemeSonucKontrolResponseImpl({
    this.hata,
    this.hataAciklama,
    this.sonuc,
  });

  factory _$OdemeSonucKontrolResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OdemeSonucKontrolResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;
  @override
  final String? sonuc;

  @override
  String toString() {
    return 'OdemeSonucKontrolResponse(hata: $hata, hataAciklama: $hataAciklama, sonuc: $sonuc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OdemeSonucKontrolResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama) &&
            (identical(other.sonuc, sonuc) || other.sonuc == sonuc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hata, hataAciklama, sonuc);

  /// Create a copy of OdemeSonucKontrolResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OdemeSonucKontrolResponseImplCopyWith<_$OdemeSonucKontrolResponseImpl>
  get copyWith =>
      __$$OdemeSonucKontrolResponseImplCopyWithImpl<
        _$OdemeSonucKontrolResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OdemeSonucKontrolResponseImplToJson(this);
  }
}

abstract class _OdemeSonucKontrolResponse implements OdemeSonucKontrolResponse {
  const factory _OdemeSonucKontrolResponse({
    final String? hata,
    final String? hataAciklama,
    final String? sonuc,
  }) = _$OdemeSonucKontrolResponseImpl;

  factory _OdemeSonucKontrolResponse.fromJson(Map<String, dynamic> json) =
      _$OdemeSonucKontrolResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;
  @override
  String? get sonuc;

  /// Create a copy of OdemeSonucKontrolResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OdemeSonucKontrolResponseImplCopyWith<_$OdemeSonucKontrolResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
