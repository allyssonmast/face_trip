// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactEntityImpl _$$ContactEntityImplFromJson(Map<String, dynamic> json) =>
    _$ContactEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ContactEntityImplToJson(_$ContactEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'url': instance.url,
    };
