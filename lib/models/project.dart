import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Project {
  String id;
  String name;
  String caseId;
  String description;
  DateTime startDate;
  DateTime endDate;

  Project({
    id,
    required this.name,
    required this.caseId,
    required this.description,
    required this.startDate,
    required this.endDate,
  }) : id = id ?? uuid.v4();
}
