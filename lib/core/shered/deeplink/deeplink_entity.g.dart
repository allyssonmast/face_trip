// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deeplink_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeepLinkEntityImpl _$$DeepLinkEntityImplFromJson(Map<String, dynamic> json) =>
    _$DeepLinkEntityImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      id: json['id'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$DeepLinkEntityImplToJson(
        _$DeepLinkEntityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'id': instance.id,
      'url': instance.url,
    };
