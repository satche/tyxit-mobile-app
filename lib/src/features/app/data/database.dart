import '../../groups/data/group.dart';

class Database {
  List<Group> groups = [];

  addGroup(Group group) => groups.add(group);
}
