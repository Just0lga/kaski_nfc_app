// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kart_bilgileri.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KartBilgileri _$KartBilgileriFromJson(Map<String, dynamic> json) {
  return _KartBilgileri.fromJson(json);
}

/// @nodoc
mixin _$KartBilgileri {
  String? get kartNo => throw _privateConstructorUsedError;
  String? get cvv => throw _privateConstructorUsedError;
  String? get sonKullanimTarihi => throw _privateConstructorUsedError;
  String? get adSoyad => throw _privateConstructorUsedError;

  /// Serializes this KartBilgileri to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KartBilgileri
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KartBilgileriCopyWith<KartBilgileri> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KartBilgileriCopyWith<$Res> {
  factory $KartBilgileriCopyWith(
    KartBilgileri value,
    $Res Function(KartBilgileri) then,
  ) = _$KartBilgileriCopyWithImpl<$Res, KartBilgileri>;
  @useResult
  $Res call({
    String? kartNo,
    String? cvv,
    String? sonKullanimTarihi,
    String? adSoyad,
  });
}

/// @nodoc
class _$KartBilgileriCopyWithImpl<$Res, $Val extends KartBilgileri>
    implements $KartBilgileriCopyWith<$Res> {
  _$KartBilgileriCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KartBilgileri
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kartNo = freezed,
    Object? cvv = freezed,
    Object? sonKullanimTarihi = freezed,
    Object? adSoyad = freezed,
  }) {
    return _then(
      _value.copyWith(
            kartNo: freezed == kartNo
                ? _value.kartNo
                : kartNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            cvv: freezed == cvv
                ? _value.cvv
                : cvv // ignore: cast_nullable_to_non_nullable
                      as String?,
            sonKullanimTarihi: freezed == sonKullanimTarihi
                ? _value.sonKullanimTarihi
                : sonKullanimTarihi // ignore: cast_nullable_to_non_nullable
                      as String?,
            adSoyad: freezed == adSoyad
                ? _value.adSoyad
                : adSoyad // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KartBilgileriImplCopyWith<$Res>
    implements $KartBilgileriCopyWith<$Res> {
  factory _$$KartBilgileriImplCopyWith(
    _$KartBilgileriImpl value,
    $Res Function(_$KartBilgileriImpl) then,
  ) = __$$KartBilgileriImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? kartNo,
    String? cvv,
    String? sonKullanimTarihi,
    String? adSoyad,
  });
}

/// @nodoc
class __$$KartBilgileriImplCopyWithImpl<$Res>
    extends _$KartBilgileriCopyWithImpl<$Res, _$KartBilgileriImpl>
    implements _$$KartBilgileriImplCopyWith<$Res> {
  __$$KartBilgileriImplCopyWithImpl(
    _$KartBilgileriImpl _value,
    $Res Function(_$KartBilgileriImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KartBilgileri
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kartNo = freezed,
    Object? cvv = freezed,
    Object? sonKullanimTarihi = freezed,
    Object? adSoyad = freezed,
  }) {
    return _then(
      _$KartBilgileriImpl(
        kartNo: freezed == kartNo
            ? _value.kartNo
            : kartNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        cvv: freezed == cvv
            ? _value.cvv
            : cvv // ignore: cast_nullable_to_non_nullable
                  as String?,
        sonKullanimTarihi: freezed == sonKullanimTarihi
            ? _value.sonKullanimTarihi
            : sonKullanimTarihi // ignore: cast_nullable_to_non_nullable
                  as String?,
        adSoyad: freezed == adSoyad
            ? _value.adSoyad
            : adSoyad // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KartBilgileriImpl implements _KartBilgileri {
  const _$KartBilgileriImpl({
    this.kartNo,
    this.cvv,
    this.sonKullanimTarihi,
    this.adSoyad,
  });

  factory _$KartBilgileriImpl.fromJson(Map<String, dynamic> json) =>
      _$$KartBilgileriImplFromJson(json);

  @override
  final String? kartNo;
  @override
  final String? cvv;
  @override
  final String? sonKullanimTarihi;
  @override
  final String? adSoyad;

  @override
  String toString() {
    return 'KartBilgileri(kartNo: $kartNo, cvv: $cvv, sonKullanimTarihi: $sonKullanimTarihi, adSoyad: $adSoyad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KartBilgileriImpl &&
            (identical(other.kartNo, kartNo) || other.kartNo == kartNo) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.sonKullanimTarihi, sonKullanimTarihi) ||
                other.sonKullanimTarihi == sonKullanimTarihi) &&
            (identical(other.adSoyad, adSoyad) || other.adSoyad == adSoyad));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, kartNo, cvv, sonKullanimTarihi, adSoyad);

  /// Create a copy of KartBilgileri
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KartBilgileriImplCopyWith<_$KartBilgileriImpl> get copyWith =>
      __$$KartBilgileriImplCopyWithImpl<_$KartBilgileriImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KartBilgileriImplToJson(this);
  }
}

abstract class _KartBilgileri implements KartBilgileri {
  const factory _KartBilgileri({
    final String? kartNo,
    final String? cvv,
    final String? sonKullanimTarihi,
    final String? adSoyad,
  }) = _$KartBilgileriImpl;

  factory _KartBilgileri.fromJson(Map<String, dynamic> json) =
      _$KartBilgileriImpl.fromJson;

  @override
  String? get kartNo;
  @override
  String? get cvv;
  @override
  String? get sonKullanimTarihi;
  @override
  String? get adSoyad;

  /// Create a copy of KartBilgileri
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KartBilgileriImplCopyWith<_$KartBilgileriImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
