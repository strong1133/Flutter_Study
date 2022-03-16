import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_contol_dialog/alert_dialog.dart';

class DialogController extends GetxController {
  AltDialog altDialog = AltDialog();

  // 상태관리 변수
  RxString tempText = "".obs;

  //
  //
  ///////////////////////////////////////////////////////////
  /// Alet 호출
  /// 해당 부분은 공통으로 빠지고 각 업무단 controller 에서는
  /// middle controller 를 만들어 로직 처리 후 해당 공통 alert call 함수를 통해서만 호출 할것.
  //////////////////////////////////////////////////////////

  // 경고창 Alert CALL
  void openWarn(context, msg) {
    altDialog.warnAlert(context, msg);
  }

  // 성공 Alert CALL
  void openSuccess(context, {String? msg, Function? callback}) {
    altDialog.successAltCB(context);
  }

  // 실패 Alert CALL
  void openFail(context, {String? msg, Function? callback}) {
    altDialog.failAltCB(context);
  }

  // 확인 Alert CALL
  void cofirm(context, callBack) {
    altDialog.confirmAltCB(context, callBack);
  }

  // 로딩 Alert CALL
  void loading(context) {
    altDialog.loadingDialog(context,
        second: 2, callback: () => resController(context));
  }
  //
  //
  ///////////////////////////////////////////////////////////
  /// 각 업무 별 middle controller
  /// 업무마다 로직은 다 다르지만 alert 을 부르는 함수 자체는 동일 할테니 해당 부분은 공통화 되었음
  /// 업무멸 비즈니스 로직의 결과에 따라 분기하여 알맞은 공통 alert 을 call 해주면 됨.
  //////////////////////////////////////////////////////////

  void empWanr(context) {
    var msg = "중복 사원입니다.";
    openWarn(context, msg);
  }

  // 확인 alert 의 CallBack 용 Middle Function
  void processing(context) {
    print("확인눌림");
    loading(context);
  }

  // 로딩 alert의 CallBack 용 Middle Function, 비즈니스 로직 처리 후 결과 에 따른 alert 분기 처리
  void resController(context) {
    var rawData = tempText.value;

    print("입력값 ::  $rawData");

    if (rawData != '') {
      openSuccess(context, msg: rawData);
    } else {
      openFail(context);
    }
  }
}
