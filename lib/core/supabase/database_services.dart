import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseServices {
  SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getAllRecords({
    required String tableName,
  }) async {
    return await supabase.from(tableName).select();
  }

  Future<Map<String, dynamic>> getSingleRecord({
    required String tableName,
    required int id,
  }) async {
    return await supabase.from(tableName).select().eq('id', id).single();
  }

  Future<List<Map<String, dynamic>>> getFilterdRecords({
    required String tableName,
    required String columnName,
    required String value,
  }) async {
    return await supabase.from(tableName).select().eq(columnName, value);
  }

  Future<List<Map<String, dynamic>>> getOrderdRecordsWithLimit({
    required String tableName,
    required String orderBy,
    required int limit,
  }) async {
    return await supabase
        .from(tableName)
        .select()
        .gt(orderBy, 0)
        .order(
          orderBy,
          ascending: false,
        )
        .limit(limit);
  }

  Future<List<Map<String, dynamic>>> search({
    required String tableName,
    required String columnName,
    required String q,
  }) {
    return supabase.from(tableName).select().ilike(columnName, '%$q%');
  }

  Future<void> setRecord(
      {required String tableName, required Map<String, dynamic> data}) async {
    await supabase.from(tableName).insert(data);
  }

  Future<void> deleteRecord(
      {required String tableName, required int id}) async {
    await supabase.from(tableName).delete().eq('id', id);
  }
}
