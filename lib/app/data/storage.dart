import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageData extends GetxService {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  static void setData(String key, dynamic value) =>
      const FlutterSecureStorage().write(key: key, value: value);

  static Future<String?> getByKey(String key) async {
    return await const FlutterSecureStorage().read(key: key) ?? "";
  }
}
