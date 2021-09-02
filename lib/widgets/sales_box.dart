import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iflutter_trip/model/home_entity.dart';
import 'package:iflutter_trip/widgets/webview.dart';

class SalesBox extends StatelessWidget {
  final HomeSalesBox? salesBox;

  const SalesBox({Key? key, required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: salesBox == null ? Container() : _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color(0xfff2f2f2),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                salesBox!.icon,
                height: 15,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffff46e3), Color(0xffff6cc9)]),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "获取更多福利 >",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _doubleItem(
                context, salesBox!.bigCard1, salesBox!.bigCard2, true, false),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _doubleItem(context, salesBox!.smallCard1, salesBox!.smallCard2,
                false, false),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _doubleItem(context, salesBox!.smallCard3, salesBox!.smallCard4,
                false, true),
          ],
        )
      ],
    );
  }

  Widget _doubleItem(BuildContext context, HomeCommon leftCard,
      HomeCommon rightCard, bool big, bool last) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(context, leftCard, true, big, last),
          _item(context, rightCard, false, big, last),
        ],
      ),
    );
  }

  Widget _item(
      BuildContext context, HomeCommon model, bool left, bool big, bool last) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Color(0xfff2f2f2));

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
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: last ? BorderSide.none : borderSide,
          right: left ? borderSide : BorderSide.none,
        )),
        child: Image.network(
          model.icon,
          width: MediaQuery.of(context).size.width / 2 - 15,
          height: big ? 130 : 80,
        ),
      ),
    );
  }
}
