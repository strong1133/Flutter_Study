import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

abstract class CursorPaginationBase {}

class CursorPaginationError extends CursorPaginationBase {
  final String message;

  CursorPaginationError({required this.message});
}

class CursorPaginationLoading extends CursorPaginationBase {}

class CursorPaginationRefetching<T> extends CursorPaginationModel<T> {
  CursorPaginationRefetching({required super.meta, required super.data});
}

class CursorPaginationFetchingMore<T> extends CursorPaginationModel<T> {
  CursorPaginationFetchingMore({required super.meta, required super.data});
}

@JsonSerializable(
  genericArgumentFactories: true,
)
class CursorPaginationModel<T> extends CursorPaginationBase {
  final CursorPaginationMeta meta;
  final List<T> data;

  CursorPaginationModel({required this.meta, required this.data});

  factory CursorPaginationModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$CursorPaginationModelFromJson(json, fromJsonT);

  // factory CursorPaginationModel.fromJson( Map<String, dynamic> jsonMap, T Function(Object? json) fromJsonT) {
  //   CursorPaginationMeta meta = CursorPaginationMeta.fromJson(jsonMap: jsonMap['meta']);
  //   List<T> data = (jsonMap['data'] as List<T>).map(fromJsonT).toList();
  //   CursorPaginationModel<T> cursorPaginationModel = CursorPaginationModel(meta: meta, data: data);

  //   return cursorPaginationModel;
  // }
}

@JsonSerializable()
class CursorPaginationMeta {
  final int count;
  final bool hasMore;

  CursorPaginationMeta({required this.count, required this.hasMore});
  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json) => _$CursorPaginationMetaFromJson(json);

  // factory CursorPaginationMeta.fromJson({required Map<String, dynamic> jsonMap}) {
  //   CursorPaginationMeta cursorPaginationMeta = CursorPaginationMeta(count: jsonMap['count'], hasMore: jsonMap['hasMore']);
  //   return cursorPaginationMeta;
  // }
}
