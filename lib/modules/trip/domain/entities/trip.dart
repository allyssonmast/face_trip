import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required String id,
    required String place,
    required String comment,
    required String url,
  }) = _Trip;

  factory Trip.fromJson(Map<String, Object?> json) => _$TripFromJson(json);
}
