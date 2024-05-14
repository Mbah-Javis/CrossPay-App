import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:crosspay/models/crosspay_user.dart';

class CPConstants {
  final BASE_URL = dotenv.env['CROSSPAY_BASE_URL'];
  final VERIFY_HASH = dotenv.env['CROSSPAY_SECRET_HASH'];
  final ONESIGNAL_APP_ID = dotenv.env['ONESIGNAL_APP_ID'];

  initHive() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(CrossPayUserAdapter());
    Hive.registerAdapter(TransactionsAdapter());
    Hive.registerAdapter(NotificationSettingsAdapter());
    Hive.registerAdapter(SubAccountAdapter());
  }
}
