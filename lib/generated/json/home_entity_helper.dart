import 'package:iflutter_trip/model/home_entity.dart';

homeEntityFromJson(HomeEntity data, Map<String, dynamic> json) {
	if (json['config'] != null) {
		data.config = HomeConfig().fromJson(json['config']);
	}
	if (json['bannerList'] != null) {
		data.bannerList = (json['bannerList'] as List).map((v) => HomeCommon().fromJson(v)).toList();
	}
	if (json['localNavList'] != null) {
		data.localNavList = (json['localNavList'] as List).map((v) => HomeCommon().fromJson(v)).toList();
	}
	if (json['gridNav'] != null) {
		data.gridNav = HomeGridNav().fromJson(json['gridNav']);
	}
	if (json['subNavList'] != null) {
		data.subNavList = (json['subNavList'] as List).map((v) => HomeCommon().fromJson(v)).toList();
	}
	if (json['salesBox'] != null) {
		data.salesBox = HomeSalesBox().fromJson(json['salesBox']);
	}
	return data;
}

Map<String, dynamic> homeEntityToJson(HomeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['config'] = entity.config.toJson();
	data['bannerList'] =  entity.bannerList.map((v) => v.toJson()).toList();
	data['localNavList'] =  entity.localNavList.map((v) => v.toJson()).toList();
	data['gridNav'] = entity.gridNav.toJson();
	data['subNavList'] =  entity.subNavList.map((v) => v.toJson()).toList();
	data['salesBox'] = entity.salesBox.toJson();
	return data;
}

homeConfigFromJson(HomeConfig data, Map<String, dynamic> json) {
	if (json['searchUrl'] != null) {
		data.searchUrl = json['searchUrl'].toString();
	}
	return data;
}

Map<String, dynamic> homeConfigToJson(HomeConfig entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['searchUrl'] = entity.searchUrl;
	return data;
}

homeCommonFromJson(HomeCommon data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor'].toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homeCommonToJson(HomeCommon entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homeGridNavFromJson(HomeGridNav data, Map<String, dynamic> json) {
	if (json['hotel'] != null) {
		data.hotel = HomeGridNavItem().fromJson(json['hotel']);
	}
	if (json['flight'] != null) {
		data.flight = HomeGridNavItem().fromJson(json['flight']);
	}
	if (json['travel'] != null) {
		data.travel = HomeGridNavItem().fromJson(json['travel']);
	}
	return data;
}

Map<String, dynamic> homeGridNavToJson(HomeGridNav entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['hotel'] = entity.hotel.toJson();
	data['flight'] = entity.flight.toJson();
	data['travel'] = entity.travel.toJson();
	return data;
}

homeGridNavItemFromJson(HomeGridNavItem data, Map<String, dynamic> json) {
	if (json['startColor'] != null) {
		data.startColor = json['startColor'].toString();
	}
	if (json['endColor'] != null) {
		data.endColor = json['endColor'].toString();
	}
	if (json['mainItem'] != null) {
		data.mainItem = HomeCommon().fromJson(json['mainItem']);
	}
	if (json['item1'] != null) {
		data.item1 = HomeCommon().fromJson(json['item1']);
	}
	if (json['item2'] != null) {
		data.item2 = HomeCommon().fromJson(json['item2']);
	}
	if (json['item3'] != null) {
		data.item3 = HomeCommon().fromJson(json['item3']);
	}
	if (json['item4'] != null) {
		data.item4 = HomeCommon().fromJson(json['item4']);
	}
	return data;
}

Map<String, dynamic> homeGridNavItemToJson(HomeGridNavItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['startColor'] = entity.startColor;
	data['endColor'] = entity.endColor;
	data['mainItem'] = entity.mainItem.toJson();
	data['item1'] = entity.item1.toJson();
	data['item2'] = entity.item2.toJson();
	data['item3'] = entity.item3.toJson();
	data['item4'] = entity.item4.toJson();
	return data;
}

homeSalesBoxFromJson(HomeSalesBox data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['moreUrl'] != null) {
		data.moreUrl = json['moreUrl'].toString();
	}
	if (json['bigCard1'] != null) {
		data.bigCard1 = HomeCommon().fromJson(json['bigCard1']);
	}
	if (json['bigCard2'] != null) {
		data.bigCard2 = HomeCommon().fromJson(json['bigCard2']);
	}
	if (json['smallCard1'] != null) {
		data.smallCard1 = HomeCommon().fromJson(json['smallCard1']);
	}
	if (json['smallCard2'] != null) {
		data.smallCard2 = HomeCommon().fromJson(json['smallCard2']);
	}
	if (json['smallCard3'] != null) {
		data.smallCard3 = HomeCommon().fromJson(json['smallCard3']);
	}
	if (json['smallCard4'] != null) {
		data.smallCard4 = HomeCommon().fromJson(json['smallCard4']);
	}
	return data;
}

Map<String, dynamic> homeSalesBoxToJson(HomeSalesBox entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['moreUrl'] = entity.moreUrl;
	data['bigCard1'] = entity.bigCard1.toJson();
	data['bigCard2'] = entity.bigCard2.toJson();
	data['smallCard1'] = entity.smallCard1.toJson();
	data['smallCard2'] = entity.smallCard2.toJson();
	data['smallCard3'] = entity.smallCard3.toJson();
	data['smallCard4'] = entity.smallCard4.toJson();
	return data;
}