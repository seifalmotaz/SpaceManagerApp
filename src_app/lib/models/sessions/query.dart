import 'package:spacemanager/models/database.dart';

extension SessionsQuery on MyDatabase {
  Future<List<Session>> getSessions() => select(sessions).get();
  Future<int> insertSession(SessionsCompanion s) => into(sessions).insert(s);
}
