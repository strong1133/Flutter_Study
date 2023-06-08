class CursorPaginationModel<T> {
  final CursorPaginationMeta meta;
  final List<T> data;

  CursorPaginationModel({required this.meta, required this.data});

  factory CursorPaginationModel.fromJson({required Map<String, dynamic> jsonMap, required T Function(Object? json) fromJsonT}) {
    CursorPaginationMeta meta = CursorPaginationMeta.fromJson(jsonMap: jsonMap['meta']);
    List<T> data = (jsonMap['data'] as List<T>).map(fromJsonT).toList();
    CursorPaginationModel<T> cursorPaginationModel = CursorPaginationModel(meta: meta, data: data);

    return cursorPaginationModel;
  }
}

class CursorPaginationMeta {
  final int count;
  final bool hasMore;

  CursorPaginationMeta({required this.count, required this.hasMore});

  factory CursorPaginationMeta.fromJson({required Map<String, dynamic> jsonMap}) {
    CursorPaginationMeta cursorPaginationMeta = CursorPaginationMeta(count: jsonMap['count'], hasMore: jsonMap['hasMore']);
    return cursorPaginationMeta;
  }
}
