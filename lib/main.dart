
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:three_links/db_links/db_links.dart';
import 'package:three_links/pages/feedback/feedback_binding.dart';
import 'package:three_links/pages/feedback/feedback_view.dart';
import 'package:three_links/pages/links_add/links_add_binding.dart';
import 'package:three_links/pages/links_add/links_add_view.dart';
import 'package:three_links/pages/links_by/links_by_binding.dart';
import 'package:three_links/pages/links_by/links_by_view.dart';
import 'package:three_links/pages/links_first/links_first_binding.dart';
import 'package:three_links/pages/links_first/links_first_view.dart';
import 'package:three_links/pages/links_records/links_records_binding.dart';
import 'package:three_links/pages/links_records/links_records_view.dart';
import 'package:three_links/pages/links_second/links_second_binding.dart';
import 'package:three_links/pages/links_second/links_second_view.dart';
import 'package:three_links/pages/links_tab/links_tab_binding.dart';
import 'package:three_links/pages/links_tab/links_tab_view.dart';
import 'package:three_links/pages/no_network/no_network_binding.dart';
import 'package:three_links/pages/no_network/no_network_go.dart';
import 'package:three_links/pages/no_network/no_network_view.dart';

Color primaryColor = const Color(0xff004114);
Color bgColor = const Color(0xfff4f4f4);

List<String> titles = ['Water meter record','Gas meter record','Electricity meter record'];
List<String> subTitles = ['Water usage','Gas usage','Electricity usage'];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBLinks().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Creazys,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Creazys = [
  GetPage(name: '/', page: () => const LinksByView(), binding: LinksByBinding()),
  GetPage(name: '/linksTab', page: () => LinksTabPage(), binding: LinksTabBinding()),
  GetPage(name: '/linksFirst', page: () => LinksFirstPage(), binding: LinksFirstBinding()),
  GetPage(name: '/linksSecond', page: () => LinksSecondPage(), binding: LinksSecondBinding()),
  GetPage(name: '/linksRecords', page: () => LinksRecordsPage(), binding: LinksRecordsBinding()),
  GetPage(name: '/linksAdd', page: () => LinksAddPage(), binding: LinksAddBinding()),
  GetPage(name: '/linksGo', page: () => const NoNetworkGo()),
  GetPage(name: '/noNetwork', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/feedback', page: () => FeedbackPage(), binding: FeedbackBinding()),
];