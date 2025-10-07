// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_test_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LatestTestModelCWProxy {
  LatestTestModel id(String? id);

  LatestTestModel totalTest(int? totalTest);

  LatestTestModel correctQuestions(int? correctQuestions);

  LatestTestModel wrongQuestions(int? wrongQuestions);

  LatestTestModel passRate(int? passRate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LatestTestModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LatestTestModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LatestTestModel call({
    String? id,
    int? totalTest,
    int? correctQuestions,
    int? wrongQuestions,
    int? passRate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLatestTestModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLatestTestModel.copyWith.fieldName(...)`
class _$LatestTestModelCWProxyImpl implements _$LatestTestModelCWProxy {
  const _$LatestTestModelCWProxyImpl(this._value);

  final LatestTestModel _value;

  @override
  LatestTestModel id(String? id) => this(id: id);

  @override
  LatestTestModel totalTest(int? totalTest) => this(totalTest: totalTest);

  @override
  LatestTestModel correctQuestions(int? correctQuestions) =>
      this(correctQuestions: correctQuestions);

  @override
  LatestTestModel wrongQuestions(int? wrongQuestions) =>
      this(wrongQuestions: wrongQuestions);

  @override
  LatestTestModel passRate(int? passRate) => this(passRate: passRate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LatestTestModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LatestTestModel(...).copyWith(id: 12, name: "My name")
  /// ````
  LatestTestModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? totalTest = const $CopyWithPlaceholder(),
    Object? correctQuestions = const $CopyWithPlaceholder(),
    Object? wrongQuestions = const $CopyWithPlaceholder(),
    Object? passRate = const $CopyWithPlaceholder(),
  }) {
    return LatestTestModel(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      totalTest: totalTest == const $CopyWithPlaceholder()
          ? _value.totalTest
          // ignore: cast_nullable_to_non_nullable
          : totalTest as int?,
      correctQuestions: correctQuestions == const $CopyWithPlaceholder()
          ? _value.correctQuestions
          // ignore: cast_nullable_to_non_nullable
          : correctQuestions as int?,
      wrongQuestions: wrongQuestions == const $CopyWithPlaceholder()
          ? _value.wrongQuestions
          // ignore: cast_nullable_to_non_nullable
          : wrongQuestions as int?,
      passRate: passRate == const $CopyWithPlaceholder()
          ? _value.passRate
          // ignore: cast_nullable_to_non_nullable
          : passRate as int?,
    );
  }
}

extension $LatestTestModelCopyWith on LatestTestModel {
  /// Returns a callable class that can be used as follows: `instanceOfLatestTestModel.copyWith(...)` or like so:`instanceOfLatestTestModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LatestTestModelCWProxy get copyWith => _$LatestTestModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestTestModel _$LatestTestModelFromJson(Map<String, dynamic> json) =>
    LatestTestModel(
      id: json['id'] as String?,
      totalTest: (json['totalTest'] as num?)?.toInt() ?? 0,
      correctQuestions: (json['correctQuestions'] as num?)?.toInt() ?? 0,
      wrongQuestions: (json['wrongQuestions'] as num?)?.toInt() ?? 0,
      passRate: (json['passRate'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LatestTestModelToJson(LatestTestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalTest': instance.totalTest,
      'correctQuestions': instance.correctQuestions,
      'wrongQuestions': instance.wrongQuestions,
      'passRate': instance.passRate,
    };
