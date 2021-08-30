import 'package:flutter/material.dart';
import 'package:iflutter_trip/model/home_entity.dart';
import 'package:iflutter_trip/widgets/webview.dart';

///**
/// * 网格布局
/// */
class GridNav extends StatelessWidget {
  final HomeGridNav? gridNavModel;

  const GridNav({Key? key, required this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      _gridNavItems(context),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) {
      return;
    }
    items.add(_gridNavItem(context, gridNavModel!.hotel, true));
    items.add(_gridNavItem(context, gridNavModel!.flight, false));
    items.add(_gridNavItem(context, gridNavModel!.travel, false));

    return items;
  }

  _gridNavItem(BuildContext context, HomeGridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2));
    items.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4));

    List<Widget> expandItems = [];
    items.forEach((element) {
      expandItems.add(Expanded(
        child: element,
        flex: 1,
      ));
    });
    Color starColor = Color(int.parse("0xff" + gridNavItem.startColor));
    Color endColor = Color(int.parse("0xff" + gridNavItem.endColor));
    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [starColor, endColor],
        ),
      ),
      child: Row(
        children: expandItems,
      ),
    );
  }

  _mainItem(BuildContext context, HomeCommon model) {
    return _wrapGesture(
        context,
        Stack(
          children: [
            Image.network(
              model.icon,
              width: 121,
              height: 88,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Text(
              model.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
        model);
  }

  _doubleItem(
      BuildContext context, HomeCommon topModel, HomeCommon bottomModel) {
    return Column(
      children: [
        Expanded(
          child: _item(context, topModel, true),
        ),
        Expanded(
          child: _item(context, bottomModel, false),
        ),
      ],
    );
  }

  _item(BuildContext context, HomeCommon model, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: borderSide,
            bottom: first ? borderSide : BorderSide.none,
          ),
        ),
        child: Center(
          child: _wrapGesture(
              context,
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              model),
        ),
      ),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, HomeCommon model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(
              url: model.url,
              title: model.title,
              hideAppBar: model.hideAppBar,
              statusBarColor: model.statusBarColor);
        }));
      },
      child: widget,
    );
  }
}
