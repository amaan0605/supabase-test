import 'package:supabase_flutter/supabase_flutter.dart';

class DataService {
  //INSTANCE
  SupabaseClient supabase = Supabase.instance.client;

  //FETCH DATA
  Future<List<Map<String, dynamic>>> fetchData(String category) async {
    final data = await supabase.from(category).select();
    print(data);
    return data;
  }
}
