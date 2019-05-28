import 'package:flutter/material.dart';
import 'package:flutter_lottery/res/colors.dart';
import 'package:flutter_lottery/res/consts.dart';
//import 'package:fluttertoast/fluttertoast.dart';


class Utils {
  static getLotteryItemRedCount(String lottery) {
    int count = 0;
    switch (lottery) {
      case Const.SSQ:
        count = 6;
        break;
      case Const.DLT:
        count = 5;
        break;
      case Const.QLC:
      case Const.QXC:
        count = 7;
        break;
      case Const.PLS:
      case Const.FCSD:
        count = 3;
        break;
      case Const.PLW:
        count = 5;
        break;
    }
    return count;
  }

  static getLotteryItemColor(int index, String lottery) {
    return index <= Utils.getLotteryItemRedCount(lottery)
        ? lottery == Const.DLT ? ResColor.color_ED8431 : ResColor.color_F63F3F
        : lottery == Const.DLT ? ResColor.color_696BC9 :ResColor.color_508CEE;
  }

  static showToast(String msg) {
//    Fluttertoast.showToast(msg: msg, backgroundColor: ResColor.color_666666);
  }

  static String getWeekDay(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    if (dateTime == null) return null;
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = "星期一";
        break;
      case 2:
        weekday = "星期二";
        break;
      case 3:
        weekday = "星期三";
        break;
      case 4:
        weekday = "星期四";
        break;
      case 5:
        weekday = "星期五";
        break;
      case 6:
        weekday = "星期六";
        break;
      case 7:
        weekday = "星期日";
        break;
      default:
        break;
    }
    return weekday;
  }

  static bool isToday(String dateStr, {bool isUtc = false}) {
    DateTime dateTime = DateTime.parse(dateStr);
    int milliseconds = dateTime.millisecondsSinceEpoch;
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
    DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }
}
