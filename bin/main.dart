import 'package:async_http_json/people.dart';
import 'dart:convert';


void main() async {
  final people = People();
  await people.fetchUsers();
}
