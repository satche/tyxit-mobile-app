import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../database/database.dart';
import '../database/models/group.dart';
import '../database/models/user.dart';

class MemberList extends StatefulWidget {
  final Group group;

  const MemberList(this.group, {Key? key}) : super(key: key);
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  void removeMember(User user) {
    setState(() {
      widget.group.removeUser(user);
      Provider.of<Database>(context, listen: false).hasUpdateded();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget removeMemberDialog(User user) {
      return AlertDialog(
        title: const Text('Remove member'),
        content: const Text('Are you sure you want to remove this member?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Remove'),
            onPressed: () => removeMember(user),
          ),
        ],
      );
    }

    if (widget.group.users.isEmpty) {
      return Container(
        padding: Spacing.standardContainer,
        alignment: Alignment.center,
        child: const Text(
          "It seems this group has not members yet",
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: Spacing.small),
      itemCount: widget.group.users.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(widget.group.users[index].name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: ColorsBase.greyLight,
              onPressed: () => showDialog(
                context: context,
                builder: (context) =>
                    removeMemberDialog(widget.group.users[index]),
              ),
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
