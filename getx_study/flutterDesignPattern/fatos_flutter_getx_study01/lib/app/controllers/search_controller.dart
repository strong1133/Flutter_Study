import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:fmvt/fmvt.dart';
import 'package:fixnum/fixnum.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:archive/archive.dart';

import '../../models/search_place.dart';

class SearchController extends GetxController {
  List searchHistList = [].obs;

  Tile? tile;

  final String _query = '6767';
  String get query => _query;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Place> _suggestions = history;
  List<Place> getRes = [];
  List<Place> get suggestions => _suggestions;

  Map plutoMaterial = {
    "columns": <PlutoColumn>[],
    "rows": <PlutoRow>[],
    "columnGroups": <PlutoColumnGroup>[],
  };

  SearchController() {
    setDumy();
  }

  //더미데이터
  void setDumy() {}

  void clear() {
    searchHistList;
    update();
  }

  void addHistory(keyword) {
    // history.add(Place(name: '$keyword', country: '$keyword-search'));
    print(history);
    update();
  }

  void onQueryChanged(String query) async {
    if (query == _query) return;

    _isLoading = true;
    var uri = "https://argosstudio-api.fatos.biz/search/fmvt/total";
    List<int> bytes;

    Tile tile = makeFmvt(query);
    Uint8List tileEncoded = Tile.encode(tile: tile);
    List<int>? gzipEncoded = GZipEncoder().encode(tileEncoded);

    // gzip 압축된 fmvt data를 API 서버에 전송
    http.MultipartFile gzipFile = http.MultipartFile.fromBytes(
        "fmvt_data", gzipEncoded!,
        filename: "fmvt.gzip");
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(uri));
    request.files.add(gzipFile);

    print("@@@@@@@@ 요청시작");

    var streamResponse = await request.send();
    var response = await http.Response.fromStream(streamResponse);
    bytes = response.bodyBytes.cast<int>();

    // Json으로 응답을 보내는 경우
    // var json = jsonDecode(utf8.decode(response.bodyBytes));
    // bytes = json["data"].cast<int>();

    _isLoading = false;
    print("@@@@@@@@ 요청종료");

    Map keyVals = getKeyValues(bytes);
    // plutoMaterial["columns"] = keyVals["columns"];
    // plutoMaterial["rows"] = keyVals["rows"];
    // plutoMaterial["columnGroups"] = keyVals["columnGroups"];

    print("@@@@@@@@ _suggestions");
    _suggestions = getRes;

    update();
  }

  // 검색용 FMVT 메이커
  static Tile makeFmvt(String query) {
    List<String> keys = [
      "kwd",
      "tst",
      "stype",
      "sort",
      "rad",
      "pno",
      "cpp",
      "uid",
      "addr",
      "lang",
      "cx",
      "cy",
      "sug",
      "key",
      "app_id"
    ];
    List<TileValue> values = [
      TileValue(stringValue: query),
      TileValue(intValue: Int64(0)),
      TileValue(intValue: Int64(2)),
      TileValue(),
      TileValue(intValue: Int64(1)),
      TileValue(intValue: Int64(20)),
      TileValue(),
      TileValue(stringValue: "ko"),
      TileValue(doubleValue: 126.896012),
      TileValue(doubleValue: 37.482550),
      TileValue(stringValue: "HcN1har0TULrxMSTbHSm-p66cOJ3qwXlIgVh19TwnEk"),
      TileValue(stringValue: "biz.fatos.anavi"),
    ];
    List<int> tags = [];
    tags.addAll([0, 0]);
    tags.addAll([1, 1]);
    tags.addAll([2, 2]);
    tags.addAll([3, 1]);
    tags.addAll([4, 3]);
    tags.addAll([5, 4]);
    tags.addAll([6, 5]);
    tags.addAll([7, 6]);
    tags.addAll([8, 1]);
    tags.addAll([9, 7]);
    tags.addAll([10, 8]);
    tags.addAll([11, 9]);
    tags.addAll([12, 1]);
    tags.addAll([13, 10]);
    tags.addAll([14, 11]);

    TileFeature feature =
        TileFeature(id: Int64(0), tags: tags, keys: keys, values: values);
    TileLayer layer = TileLayer(
        name: "common_st", keys: keys, values: values, features: [feature]);
    Tile tile = Tile(layers: [layer]);

    return tile;
  }

  // pbf 파일 키벨류 셋팅
  Map getKeyValues(List<int> bytes) {
    List<PlutoColumnGroup> columnGroups = []; // Plutogrid에 출력할 ColumnGroups
    List<PlutoColumn> columns = []; // Plutogrid에 출력할 Columns
    List<PlutoRow> rows = []; // Plutogrid에 출력할 Rows
    List<String>? propsFields = []; // ColumnGroups의 fields에 Properties의 키들을 저장

    // Gzip 압축 해제
    var gzipDecoded = GZipDecoder().decodeBytes(bytes);
    var tileBytes = Uint8List.fromList(gzipDecoded); // Uint8List로 변환

    // VectorTile 생성
    tile = Tile.fromBytes(bytes: tileBytes);

    // 첫번째 Layer 추출
    var layer = tile!.layers[0];
    if (tile!.layers.length > 1) {
      layer = tile!.layers[1]; // Layer가 여러개인 경우 real_link Layer 추출
    }

    // Layer의 Features의 Key Value 맵핑 후, Pluto Grid에 그릴 수 있는 데이터 생성
    layer.setKeyValues().asMap().forEach((index, data) {
      // suggestions.add(Place(name: '파토스', country: '파토스'));
      // Data는 Feature의 geometry와 properties 정보를 갖는 Map
      var geoms = data["geometry"];
      var props = data["properties"]; // Feature의 Properties

      // PlutoGrid Columns & Rows 생성
      if (index == 0 && geoms.length > 0) {
        columns.add(
          PlutoColumn(
            title: "geom_type",
            field: "geom_type",
            type: PlutoColumnType.text(),
          ),
        );

        columns.add(
          PlutoColumn(
            title: "coord_x",
            field: "coord_x",
            type: PlutoColumnType.text(),
          ),
        );

        columns.add(
          PlutoColumn(
            title: "coord_y",
            field: "coord_y",
            type: PlutoColumnType.text(),
          ),
        );
      }

      Map<String, PlutoCell> cells = {};
      for (var key in props.keys) {
        if (index == 0) {
          // PlutoGrid Columns 생성
          columns.add(PlutoColumn(
            title: key,
            field: key,
            type: PlutoColumnType.text(),
          ));
          propsFields.add(key);
        }
        if (geoms.length != 0) {
          cells["geom_type"] = PlutoCell(value: "${geoms["type"]}");
          if (geoms["type"] == "Point") {
            cells["coord_x"] = PlutoCell(value: "${geoms["coordinates"][0]}");
            cells["coord_y"] = PlutoCell(value: "${geoms["coordinates"][1]}");
          } else {
            cells["coord_x"] =
                PlutoCell(value: "${geoms["coordinates"][0][0]}");
            cells["coord_y"] =
                PlutoCell(value: "${geoms["coordinates"][0][1]}");
          }
        }
        if (key == 'name') {
          print(
              '${props[key].toString()} , ${geoms["coordinates"][0]} , ${geoms["coordinates"][1]}');

          Place temp = Place(
              name: props[key].toString(),
              country:
                  '${geoms["coordinates"][0]} , ${geoms["coordinates"][1]}');
          getRes.add(temp);
        }

        cells[key] = PlutoCell(value: props[key].toString());
      }
      rows.add(PlutoRow(cells: cells));

      // Pluto ColumnGroup 생성
      if (index == 0) {
        if (geoms.length > 1) {
          columnGroups.add(PlutoColumnGroup(title: "Geometry", children: [
            PlutoColumnGroup(
                title: "", fields: ["geom_type"], expandedColumn: true),
            PlutoColumnGroup(
                title: "Coordinates", fields: ["coord_x", "coord_y"])
          ]));
        }
        if (rows.length > 1) {
          columnGroups
              .add(PlutoColumnGroup(title: "Properties", fields: propsFields));
        }
      }
    });

    return {
      "columns": columns,
      "rows": rows,
      "columnGroups": columnGroups,
    };
  }
}

const List<Place> history = [
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  )
];
