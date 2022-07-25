import 'package:flutter/material.dart';
import 'package:tyxit_mobile_app/components/avatar.dart';
import '../constants/spacing.dart';

class Setting extends StatelessWidget {
  final List<Widget>? child;
  final dynamic entity; // User or Group
  const Setting({Key? key, this.entity, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> settingsList(widgetList) {
      return widgetList;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${entity.runtimeType} settings'),
      ),
      body: Container(
        padding: Spacing.fullWidthContainer,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Avatar(url: entity.picturePath),
            Spacing.betweenFields,
            Text(entity.name),
            const SizedBox(height: Spacing.big),
            ListView(
              shrinkWrap: true,
              children: settingsList(child),
            ),
          ],
        ),
      ),
    );
  }
}
