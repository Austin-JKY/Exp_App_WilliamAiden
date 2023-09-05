import 'package:my_app_fi/core/utils/model/money.dart';

List<Money> getMoney() {
  // ignore: unused_local_variable
  Money money = Money();
  money.image = 'images.png';
  money.name = 'Global Limited';
  money.time = 'today';
  money.fee = '100000';
  money.bbuy = false;

  return [money];
}
