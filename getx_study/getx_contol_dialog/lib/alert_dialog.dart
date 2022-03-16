import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AltDialog {
  var alertStyle = AlertStyle(
    animationType: AnimationType.shrink,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    // descStyle: TextStyle(fontWeight: FontWeight.bold),
    // descTextAlign: TextAlign.start,
    // animationDuration: const Duration(milliseconds: 250),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.0),
      side: const BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: const TextStyle(
      color: Colors.black,
    ),
    // alertAlignment: Alignment.topCenter,
  );

  void alertWarning(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "ALERT",
      buttons: [
        DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.orange, //Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  void alertSuccess(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "완료",
      desc: "",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.deepPurple, //Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  void alertFail(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "실패",
      desc: "Error code 101",
      buttons: [
        DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.deepPurple, //Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  void alertConfirm(BuildContext context, Function? confirm) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(25.0),
          title: Text(tr("변경사항을 저장하시겠습니까?")),
          alignment: Alignment.center,
          //content: SizedBox(height: 50),
          contentPadding: const EdgeInsets.all(20.0),
          actionsPadding: const EdgeInsets.all(20.0),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ElevatedButton(
              child: const Text(
                "확인",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: confirm != null
                  ? () {
                      confirm();
                      Navigator.of(dialogContext).pop();
                    }
                  : () => Navigator.of(dialogContext).pop(),
            ),
            OutlinedButton(
              child: const Text('취소'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
    //Alert(
    //  context: context,
    //  title: "변경사항을 저장하시겠습니까?",
    //  buttons: [
    //    DialogButton(
    //      child: const Text(
    //        "확인",
    //        style: TextStyle(
    //            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    //      ),
    //      color: TsoColors.tsoCarrot,
    //      // ignore: avoid_print
    //      onPressed: () => Navigator.of(context).pop(),
    //    ),
    //    DialogButton(
    //      child: const Text(
    //        "취소",
    //        style: TextStyle(
    //            color: TsoColors.tsoCarrot,
    //            fontSize: 18,
    //            fontWeight: FontWeight.bold),
    //      ),
    //      color: Colors.white,
    //      border: const Border.fromBorderSide(BorderSide(
    //          color: TsoColors.tsoCarrot, width: 2, style: BorderStyle.solid)),
    //      // ignore: avoid_print
    //      onPressed: () => Navigator.of(context).pop(),
    //    ),
    //  ],
    //).show();
  }

  void alertCustom(BuildContext context) {
    Alert(
      context: context,
      title: "부제 생성",
      content: Column(
        children: const <Widget>[
          Text("부제 생성 팝업 화면"),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "부제 생성",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "닫기",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }

  void warnAlert(BuildContext context, String msg) async {
    return showDialog<void>(
      //다이얼로그 위젯 소환
      context: context,
      barrierDismissible: false, // 다이얼로그 이외의 바탕 눌러도 안꺼지도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr('경고')),
          content: SingleChildScrollView(
            child: ListBody(
              //List Body를 기준으로 Text 설정
              children: <Widget>[Text(tr(msg))],
            ),
          ),
          actions: [
            TextButton(
              child: Text(tr('확인')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void loadingDialog(BuildContext context, {int? second, Function? callback}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: second ?? 3), () {
          Navigator.pop(context);

          if (callback != null) {
            callback();
          }
        });

        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          content: SizedBox(
            height: 200,
            child: Center(
                child: SizedBox(
              child: new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation(Colors.blue),
                  strokeWidth: 5.0),
              height: 50.0,
              width: 50.0,
            )),
          ),
        );
      },
    );
  }

  failDialog(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "실패",
      desc: "Error code 101",
      buttons: [
        DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.deepPurple, //Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  confirmAltCB(context, callback) {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(25.0),
            title: Text(tr("변경사항을 저장하시겠습니까?")),
            alignment: Alignment.center,
            //content: SizedBox(height: 50),
            contentPadding: const EdgeInsets.all(20.0),
            actionsPadding: const EdgeInsets.all(20.0),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              ElevatedButton(
                child: const Text(
                  "확인",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  callback();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(100, 40),
                ),
              ),
              OutlinedButton(
                child: const Text('취소'),
                onPressed: () {
                  Navigator.pop(context);
                },
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(100, 40)),
              ),
            ],
          );
        });
  }

  void successAltCB(BuildContext context,
      {String? msg, Function? callback}) async {
    var tempMsg = "";
    var tempFuntion = () {
      print('default ');
    };

    if (msg != null) {
      tempMsg = msg;
    }
    if (callback != null) {
      tempFuntion = callback();
    }
    Alert(
      context: context,
      type: AlertType.success,
      title: "성공",
      style: alertStyle,
      desc: tempMsg,
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            tempFuntion();
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  void failAltCB(BuildContext context,
      {String? msg, Function? callback}) async {
    var tempMsg = "";
    var tempFuntion = () {
      print('default ');
    };

    if (msg != null) {
      tempMsg = msg;
    }
    if (callback != null) {
      tempFuntion = callback();
    }
    Alert(
      context: context,
      type: AlertType.error,
      title: "실패",
      style: alertStyle,
      desc: tempMsg,
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            tempFuntion();
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  void wanrAltCB(BuildContext context,
      {String? msg, Function? callback}) async {
    var tempMsg = "";
    var tempFuntion = () {
      print('default ');
    };

    if (msg != null) {
      tempMsg = msg;
    }
    if (callback != null) {
      tempFuntion = callback();
    }
    Alert(
      context: context,
      type: AlertType.warning,
      title: "실패",
      style: alertStyle,
      desc: tempMsg,
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            tempFuntion();
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          //Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
}
