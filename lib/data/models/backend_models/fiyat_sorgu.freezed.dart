// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fiyat_sorgu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FiyatSorguRequest _$FiyatSorguRequestFromJson(Map<String, dynamic> json) {
  return _FiyatSorguRequest.fromJson(json);
}

/// @nodoc
mixin _$FiyatSorguRequest {
  OturumBilgileri get oturumBilgileri => throw _privateConstructorUsedError;
  int? get aboneNo => throw _privateConstructorUsedError;
  int? get sarf => throw _privateConstructorUsedError;

  /// Serializes this FiyatSorguRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FiyatSorguRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FiyatSorguRequestCopyWith<FiyatSorguRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiyatSorguRequestCopyWith<$Res> {
  factory $FiyatSorguRequestCopyWith(
    FiyatSorguRequest value,
    $Res Function(FiyatSorguRequest) then,
  ) = _$FiyatSorguRequestCopyWithImpl<$Res, FiyatSorguRequest>;
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, int? aboneNo, int? sarf});

  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class _$FiyatSorguRequestCopyWithImpl<$Res, $Val extends FiyatSorguRequest>
    implements $FiyatSorguRequestCopyWith<$Res> {
  _$FiyatSorguRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FiyatSorguRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? aboneNo = freezed,
    Object? sarf = freezed,
  }) {
    return _then(
      _value.copyWith(
            oturumBilgileri: null == oturumBilgileri
                ? _value.oturumBilgileri
                : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                      as OturumBilgileri,
            aboneNo: freezed == aboneNo
                ? _value.aboneNo
                : aboneNo // ignore: cast_nullable_to_non_nullable
                      as int?,
            sarf: freezed == sarf
                ? _value.sarf
                : sarf // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of FiyatSorguRequest
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
abstract class _$$FiyatSorguRequestImplCopyWith<$Res>
    implements $FiyatSorguRequestCopyWith<$Res> {
  factory _$$FiyatSorguRequestImplCopyWith(
    _$FiyatSorguRequestImpl value,
    $Res Function(_$FiyatSorguRequestImpl) then,
  ) = __$$FiyatSorguRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OturumBilgileri oturumBilgileri, int? aboneNo, int? sarf});

  @override
  $OturumBilgileriCopyWith<$Res> get oturumBilgileri;
}

/// @nodoc
class __$$FiyatSorguRequestImplCopyWithImpl<$Res>
    extends _$FiyatSorguRequestCopyWithImpl<$Res, _$FiyatSorguRequestImpl>
    implements _$$FiyatSorguRequestImplCopyWith<$Res> {
  __$$FiyatSorguRequestImplCopyWithImpl(
    _$FiyatSorguRequestImpl _value,
    $Res Function(_$FiyatSorguRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FiyatSorguRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oturumBilgileri = null,
    Object? aboneNo = freezed,
    Object? sarf = freezed,
  }) {
    return _then(
      _$FiyatSorguRequestImpl(
        oturumBilgileri: null == oturumBilgileri
            ? _value.oturumBilgileri
            : oturumBilgileri // ignore: cast_nullable_to_non_nullable
                  as OturumBilgileri,
        aboneNo: freezed == aboneNo
            ? _value.aboneNo
            : aboneNo // ignore: cast_nullable_to_non_nullable
                  as int?,
        sarf: freezed == sarf
            ? _value.sarf
            : sarf // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FiyatSorguRequestImpl implements _FiyatSorguRequest {
  const _$FiyatSorguRequestImpl({
    required this.oturumBilgileri,
    this.aboneNo,
    this.sarf,
  });

  factory _$FiyatSorguRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiyatSorguRequestImplFromJson(json);

  @override
  final OturumBilgileri oturumBilgileri;
  @override
  final int? aboneNo;
  @override
  final int? sarf;

  @override
  String toString() {
    return 'FiyatSorguRequest(oturumBilgileri: $oturumBilgileri, aboneNo: $aboneNo, sarf: $sarf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiyatSorguRequestImpl &&
            (identical(other.oturumBilgileri, oturumBilgileri) ||
                other.oturumBilgileri == oturumBilgileri) &&
            (identical(other.aboneNo, aboneNo) || other.aboneNo == aboneNo) &&
            (identical(other.sarf, sarf) || other.sarf == sarf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, oturumBilgileri, aboneNo, sarf);

  /// Create a copy of FiyatSorguRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FiyatSorguRequestImplCopyWith<_$FiyatSorguRequestImpl> get copyWith =>
      __$$FiyatSorguRequestImplCopyWithImpl<_$FiyatSorguRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FiyatSorguRequestImplToJson(this);
  }
}

abstract class _FiyatSorguRequest implements FiyatSorguRequest {
  const factory _FiyatSorguRequest({
    required final OturumBilgileri oturumBilgileri,
    final int? aboneNo,
    final int? sarf,
  }) = _$FiyatSorguRequestImpl;

  factory _FiyatSorguRequest.fromJson(Map<String, dynamic> json) =
      _$FiyatSorguRequestImpl.fromJson;

  @override
  OturumBilgileri get oturumBilgileri;
  @override
  int? get aboneNo;
  @override
  int? get sarf;

  /// Create a copy of FiyatSorguRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FiyatSorguRequestImplCopyWith<_$FiyatSorguRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FiyatSorguResponse _$FiyatSorguResponseFromJson(Map<String, dynamic> json) {
  return _FiyatSorguResponse.fromJson(json);
}

/// @nodoc
mixin _$FiyatSorguResponse {
  String? get hata => throw _privateConstructorUsedError;
  String? get hataAciklama => throw _privateConstructorUsedError;
  double? get toplam => throw _privateConstructorUsedError;

  /// Serializes this FiyatSorguResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FiyatSorguResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FiyatSorguResponseCopyWith<FiyatSorguResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiyatSorguResponseCopyWith<$Res> {
  factory $FiyatSorguResponseCopyWith(
    FiyatSorguResponse value,
    $Res Function(FiyatSorguResponse) then,
  ) = _$FiyatSorguResponseCopyWithImpl<$Res, FiyatSorguResponse>;
  @useResult
  $Res call({String? hata, String? hataAciklama, double? toplam});
}

/// @nodoc
class _$FiyatSorguResponseCopyWithImpl<$Res, $Val extends FiyatSorguResponse>
    implements $FiyatSorguResponseCopyWith<$Res> {
  _$FiyatSorguResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FiyatSorguResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? toplam = freezed,
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
            toplam: freezed == toplam
                ? _value.toplam
                : toplam // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FiyatSorguResponseImplCopyWith<$Res>
    implements $FiyatSorguResponseCopyWith<$Res> {
  factory _$$FiyatSorguResponseImplCopyWith(
    _$FiyatSorguResponseImpl value,
    $Res Function(_$FiyatSorguResponseImpl) then,
  ) = __$$FiyatSorguResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hata, String? hataAciklama, double? toplam});
}

/// @nodoc
class __$$FiyatSorguResponseImplCopyWithImpl<$Res>
    extends _$FiyatSorguResponseCopyWithImpl<$Res, _$FiyatSorguResponseImpl>
    implements _$$FiyatSorguResponseImplCopyWith<$Res> {
  __$$FiyatSorguResponseImplCopyWithImpl(
    _$FiyatSorguResponseImpl _value,
    $Res Function(_$FiyatSorguResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FiyatSorguResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hata = freezed,
    Object? hataAciklama = freezed,
    Object? toplam = freezed,
  }) {
    return _then(
      _$FiyatSorguResponseImpl(
        hata: freezed == hata
            ? _value.hata
            : hata // ignore: cast_nullable_to_non_nullable
                  as String?,
        hataAciklama: freezed == hataAciklama
            ? _value.hataAciklama
            : hataAciklama // ignore: cast_nullable_to_non_nullable
                  as String?,
        toplam: freezed == toplam
            ? _value.toplam
            : toplam // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FiyatSorguResponseImpl implements _FiyatSorguResponse {
  const _$FiyatSorguResponseImpl({this.hata, this.hataAciklama, this.toplam});

  factory _$FiyatSorguResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiyatSorguResponseImplFromJson(json);

  @override
  final String? hata;
  @override
  final String? hataAciklama;
  @override
  final double? toplam;

  @override
  String toString() {
    return 'FiyatSorguResponse(hata: $hata, hataAciklama: $hataAciklama, toplam: $toplam)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiyatSorguResponseImpl &&
            (identical(other.hata, hata) || other.hata == hata) &&
            (identical(other.hataAciklama, hataAciklama) ||
                other.hataAciklama == hataAciklama) &&
            (identical(other.toplam, toplam) || other.toplam == toplam));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hata, hataAciklama, toplam);

  /// Create a copy of FiyatSorguResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FiyatSorguResponseImplCopyWith<_$FiyatSorguResponseImpl> get copyWith =>
      __$$FiyatSorguResponseImplCopyWithImpl<_$FiyatSorguResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FiyatSorguResponseImplToJson(this);
  }
}

abstract class _FiyatSorguResponse implements FiyatSorguResponse {
  const factory _FiyatSorguResponse({
    final String? hata,
    final String? hataAciklama,
    final double? toplam,
  }) = _$FiyatSorguResponseImpl;

  factory _FiyatSorguResponse.fromJson(Map<String, dynamic> json) =
      _$FiyatSorguResponseImpl.fromJson;

  @override
  String? get hata;
  @override
  String? get hataAciklama;
  @override
  double? get toplam;

  /// Create a copy of FiyatSorguResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FiyatSorguResponseImplCopyWith<_$FiyatSorguResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
