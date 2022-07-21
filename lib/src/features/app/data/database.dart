import '../../groups/data/group.dart';

class Database {
  final List<Group> groups = [];

  addGroup(Group group) => groups.add(group);
}
