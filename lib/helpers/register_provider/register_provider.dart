import 'package:provider/provider.dart';

import '../../providers/scm_data_provider.dart';
import '../../providers/sign_in_provider.dart';

var registerProvider = [
  ChangeNotifierProvider<SignInProvider>(
    create: ((context) => SignInProvider()),
  ),
  ChangeNotifierProvider<ScmDataProvider>(
    create: ((context) => ScmDataProvider()),
  ),
];
