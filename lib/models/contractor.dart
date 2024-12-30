import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Contractor {
  final String id;
  final String name;
  final String email;
  final int phone;
  String status;

  Contractor({
    id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
  }) : id = id ?? uuid.v4();
}
