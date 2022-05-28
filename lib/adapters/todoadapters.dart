import 'package:hive/hive.dart';

part 'todoadapters.g.dart';

@HiveType(typeId: 0)
class Todo {
  @HiveField(0)
  String title;
  @HiveField(1)
  String discription;

  Todo({ this.title = "", this.discription =""});
}
