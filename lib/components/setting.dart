import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyxit_mobile_app/components/avatar.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/group.dart';

class Setting extends StatefulWidget {
  final List<Widget>? child;
  final dynamic entity; // User or Group
  Setting({Key? key, this.entity, this.child}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final fieldController = TextEditingController();

  List<Widget> settingsList(widgetList) {
    return widgetList;
  }

  void changeName(BuildContext context, newName) {
    widget.entity.changeName(context, widget.entity, newName);
  }

  bool canUserEdit(context) {
    final db = Provider.of<Database>(context, listen: false);
    if (widget.entity.runtimeType == Group) {
      final userIsGroupAdmin = db.loggedUser == widget.entity.admin;
      return userIsGroupAdmin;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Text('${widget.entity.runtimeType} settings'),
      ),
      body: Container(
        padding: Spacing.fullWidthContainer,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Avatar(url: widget.entity.picturePath, size: 70),
            Spacing.betweenFields,
            SizedBox(
              width: 250,
              child: canUserEdit(context)
                  ? TextFormField(
                      controller: fieldController..text = widget.entity.name,
                      onEditingComplete: () =>
                          changeName(context, fieldController.text),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: SizedBox(width: 0),
                        suffixIcon: Icon(Icons.edit),
                      ),
                    )
                  : Text(widget.entity.name, textAlign: TextAlign.center),
            ),
            const SizedBox(height: Spacing.big),
            ListView(
              shrinkWrap: true,
              children: settingsList(widget.child),
            ),
          ],
        ),
      ),
    );
  }
}
