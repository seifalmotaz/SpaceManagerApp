library engine_sql;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'gen/query.dart';
import 'gen/sql_fields.dart';

export 'annotations.dart';

Builder sqlFieldsGen(BuilderOptions options) =>
    SharedPartBuilder([SqlFieldsGen()], 'sql_fields');

Builder queryGen(BuilderOptions options) =>
    SharedPartBuilder([QuerysGen()], 'query');
