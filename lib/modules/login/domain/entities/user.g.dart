// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      isTraveled: json['isTraveled'] as bool,
      url: json['url'] as String,
      listContact: (json['listContact'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      listInterests: (json['listInterests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'description': instance.description,
      'isTraveled': instance.isTraveled,
      'url': instance.url,
      'listContact': instance.listContact,
      'listInterests': instance.listInterests,
    };
