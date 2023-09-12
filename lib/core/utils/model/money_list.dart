import 'package:my_app_fi/core/utils/model/money.dart';

List<Money> getMoney() {
  // ignore: unused_local_variable
  Money money = Money();
  money.image = 'images.png';
  money.name = 'Global Limited';
  money.time = 'today';
  money.fee = '100000';
  Money gg = Money();
  money.image = 'images.png';
  money.name = 'Global Limited';
  money.time = 'today';
  money.fee = '100000';
  money.bbuy = false;
  Money getUse = Money();
  getUse.image = 'logo1.png';
  getUse.name = 'Titan Company';
  getUse.time = 'Today';
  getUse.fee = '50000';
  getUse.bbuy = true;
  Money getAce = Money();
  getAce.image = 'logo2.png';
  getAce.name = 'FAST Company';
  getAce.time = 'Today';
  getAce.fee = '800000';
  getAce.bbuy = true;

  return [money, getUse, getAce];
}
