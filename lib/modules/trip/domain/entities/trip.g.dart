// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as String,
      place: json['place'] as String,
      comment: json['comment'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'place': instance.place,
      'comment': instance.comment,
      'url': instance.url,
    };
