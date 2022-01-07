import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/to_sql_data.dart';

Builder toSQLGeneratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([ToSQLGenerator()], 'sql');
