import 'package:http/http.dart' as http;
import 'dart:convert';


class People {
    final apiUrl = Uri.parse('https://random-data-api.com/api/v2/users?size=12');

    Future<void> fetchUsers() async {
        try {
            final res = await http.get(apiUrl);

            if (res.statusCode == 200) {
                //convert json data in Map<String, dynamic> objects
                final List<Map<String, dynamic>> users = (jsonDecode(res.body) as List<dynamic>).cast<Map<String, dynamic>>();

            for (final user in users) {
                final uid = user['uid'];
                final firstName = user['first_name'];
                final lastName = user['last_name'];
                print('User: $uid, $firstName, $lastName.');
            }
            }else {
                print('Failed to fetch data. Status code: ${res.statusCode}');
            }
        }catch (e) {
            print('An error occured: $e.');
        }
    }
}
