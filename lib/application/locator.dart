import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ottaa_project_flutter/application/locator.config.dart';

final getIt = GetIt.instance;

const desktop = Environment('desktop');

// const bool _kIsDesktop = bool.fromEnvironment('dart.vm.product');

@InjectableInit(
  preferRelativeImports: false,
  throwOnMissingDependencies: true,
)
Future<GetIt> configureDependencies() => getIt.init();
