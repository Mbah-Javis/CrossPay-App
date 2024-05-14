import 'package:hive/hive.dart';
import 'hive_crosspay_user.dart';

class HiveCrossPayUserService {
  static const String _boxName = 'crossPayUserBox';

  Future<void> setCrossPayUser(HiveCrossPayUser user) async {
    final box = await Hive.openBox<HiveCrossPayUser>(_boxName);
    await box.put('user', user);
  }

  Future<HiveCrossPayUser?> getCrossPayUser() async {
    final box = await Hive.openBox<HiveCrossPayUser>(_boxName);
    return box.get('user');
  }
}
