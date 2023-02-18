import 'package:acronyms_flutter/app/flavors/build_config.dart';
import 'package:acronyms_flutter/app/flavors/env_config.dart';
import 'package:acronyms_flutter/app/flavors/environment.dart';
import 'package:acronyms_flutter/app/my_app.dart';
import 'package:acronyms_flutter/app/services/app_service.dart';
import 'package:flutter/material.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "acronyms_flutter",
    baseUrl: "",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  AppService.start();
  runApp(const MyApp());
}
