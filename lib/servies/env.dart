import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'constants.dart';

class Env {
  static void init() async {
    await dotenv.load(fileName: AppConstants.ENV_BASE_PATH);
    
    final String? currentEnvName = dotenv.env["ENV"]?.toLowerCase();
    await dotenv.load(fileName: "assets/env/env_$currentEnvName.env");
  }

  static String? get enviromentName => dotenv.env["ENVIROMENT_NAME"];
  static String? get baseUrl => dotenv.env["BASE_URL"];
  static String? get digifiedApiKey => dotenv.env["DIGIFIED_API_KEY"];
  
}
