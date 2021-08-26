import 'package:flutter/material.dart';
import 'package:iflutter_trip/model/home_entity.dart';
import 'package:iflutter_trip/pages/webview_flutter_example.dart';
import 'package:iflutter_trip/widgets/webview.dart';

class LocalNav extends StatelessWidget {
  final List<HomeCommon> localNavList;

  const LocalNav({Key? key, required this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          )),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    List<Widget> items = [];

    localNavList.forEach((model) {
      items.add(_item(context, model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }

  Widget _item(BuildContext context, HomeCommon model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return WebView(
            url: model.url,
            title: model.title,
            statusBarColor: model.statusBarColor,
            hideAppBar: model.hideAppBar,
          );
        }));
      },
      child: Column(
        children: [
          Image.network(
            model.icon,
            width: 32,
            height: 32,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
