import 'package:iflutter_trip/generated/json/base/json_convert_content.dart';

class HomeEntity with JsonConvert<HomeEntity> {
  late HomeConfig config;
  late List<HomeCommon> bannerList;
  late List<HomeCommon> localNavList;
  late HomeGridNav gridNav;
  late List<HomeCommon> subNavList;
  late HomeSalesBox salesBox;
}

class HomeConfig with JsonConvert<HomeConfig> {
  late String searchUrl;
}

class HomeCommon with JsonConvert<HomeCommon> {
  late String icon;
  late String title;
  late String url;
  late String statusBarColor;
  late bool hideAppBar;
}

class HomeGridNav with JsonConvert<HomeGridNav> {
  late HomeGridNavItem hotel;
  late HomeGridNavItem flight;
  late HomeGridNavItem travel;
}

class HomeGridNavItem with JsonConvert<HomeGridNavItem> {
  late String startColor;
  late String endColor;
  late HomeCommon mainItem;
  late HomeCommon item1;
  late HomeCommon item2;
  late HomeCommon item3;
  late HomeCommon item4;
}

class HomeSalesBox with JsonConvert<HomeSalesBox> {
  late String icon;
  late String moreUrl;
  late HomeCommon bigCard1;
  late HomeCommon bigCard2;
  late HomeCommon smallCard1;
  late HomeCommon smallCard2;
  late HomeCommon smallCard3;
  late HomeCommon smallCard4;
}
