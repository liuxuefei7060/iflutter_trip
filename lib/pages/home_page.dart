import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:iflutter_trip/dao/home_dao.dart';
import 'package:iflutter_trip/generated/json/base/json_convert_content.dart';
import 'package:iflutter_trip/model/home_entity.dart';

const APPBAR_SCROLL_OFFSET = 100.0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> bannerList = [
    {
      "icon":
          "http://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
      "url":
          "https://gs.ctrip.com/html5/you/travels/1422/3771516.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
    },
    {
      "icon":
          "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
      "url":
          "https://m.ctrip.com/webapp/vacations/tour/detail?productid=3168213&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
    },
    {
      "icon": "http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg",
      "url":
          "https://m.ctrip.com/events/jiudianshangchenghuodong.html?disable_webview_cache_key=1"
    },
    {
      "icon":
          "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg",
      "url":
          "https://m.ctrip.com/webapp/vacations/tour/detail?productid=53720&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
    }
  ];

  double _appBarAlpha = 0.0;
  String _text = "";

  void _onScroll(double offset) {
    print(offset);
    double alpha = offset / APPBAR_SCROLL_OFFSET;

    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    print(alpha);
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  @override
  void initState() {
    super.initState();
    HomeDao.fetch2()
        .then((value) => {
              setState(() {
                print("13123131");
                _text = value.config.searchUrl;
              })
            })
        .catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    // JsonConvert.fromJsonAsT(null)
    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return false;
                },
                child: ListView(
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 180,
                      child: Swiper(
                        itemCount: bannerList.length,
                        autoplay: true,
                        pagination: SwiperPagination(),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            bannerList[index]['icon'],
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 800,
                      color: Colors.blue,
                      child: Text(_text),
                    )
                  ],
                ),
              )),
          Opacity(
            opacity: _appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text("首页"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
