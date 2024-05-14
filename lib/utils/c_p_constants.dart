import 'package:flutter_dotenv/flutter_dotenv.dart';

class CPConstants {
  final BASE_URL = dotenv.env['CROSSPAY_BASE_URL'];
  final VERIFY_HASH = dotenv.env['CROSSPAY_SECRET_HASH'];
  final ONESIGNAL_APP_ID = dotenv.env['ONESIGNAL_APP_ID'];
}
