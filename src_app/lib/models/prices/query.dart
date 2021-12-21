import 'package:spacemanager/models/database.dart';

extension PricesQuery on MyDatabase {
  Future<List<Price>> getPrices() => select(prices).get();
  Future<int> insertPrice(PricesCompanion p) => into(prices).insert(p);
}
