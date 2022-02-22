import 'package:get/get.dart';
import 'package:search_bar01/search_place.dart';
import 'dart:io';

class SearchController extends GetxController {
  bool isLoading = false;

  bool open = false;

  List<Place> suggestions = history;
  List<Place> getRes = [];

  SearchController() {
    setDumy();
  }

  void search() {
    isLoading = true;

    suggestions = resSummy;
    isLoading = false;
    open = false;
    update();
  }

  void openner() {
    open = true;
    update();
  }

  void closser() {
    open = false;
    update();
  }

  void out() {
    isLoading = false;
    update();
  }

  void setDumy() {
    suggestions = history;
    update();
  }
}

const List<Place> history = [
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
  Place(
    name: 'Fatos Corp',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
];

const List<Place> resSummy = [
  Place(
    name: '파토스 주식회사',
    country: '구로 디지털 단지',
    state: '파토스',
  ),
];
