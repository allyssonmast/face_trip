// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deeplink_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeepLinkEntity _$$_DeepLinkEntityFromJson(Map<String, dynamic> json) =>
    _$_DeepLinkEntity(
      title: json['title'] as String,
      body: json['body'] as String,
      id: json['id'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_DeepLinkEntityToJson(_$_DeepLinkEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'id': instance.id,
      'url': instance.url,
    };
