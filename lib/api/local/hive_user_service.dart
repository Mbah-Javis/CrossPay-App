import 'package:hive/hive.dart';
import 'package:crosspay/models/crosspay_user.dart';

class HiveCrossPayUserService {
  static const String _boxName = 'crossPayUserBox';

  Future<void> setCrossPayUser(CrossPayUser user) async {
    final box = await Hive.openBox<CrossPayUser>(_boxName);
    await box.put('user', user);
  }

  Future<CrossPayUser?> getCrossPayUser() async {
    final box = await Hive.openBox<CrossPayUser>(_boxName);
    return box.get('user');
  }
}
