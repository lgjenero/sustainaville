// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representative_bills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepresentativeBillImpl _$$RepresentativeBillImplFromJson(
        Map<String, dynamic> json) =>
    _$RepresentativeBillImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$RepresentativeBillImplToJson(
        _$RepresentativeBillImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

_$RepresentativeBillsImpl _$$RepresentativeBillsImplFromJson(
        Map<String, dynamic> json) =>
    _$RepresentativeBillsImpl(
      representativeId: json['representativeId'] as String,
      bills: (json['bills'] as List<dynamic>)
          .map((e) => RepresentativeBill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RepresentativeBillsImplToJson(
        _$RepresentativeBillsImpl instance) =>
    <String, dynamic>{
      'representativeId': instance.representativeId,
      'bills': instance.bills.map((e) => e.toJson()).toList(),
    };
