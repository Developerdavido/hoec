

import 'package:ewc_hoe/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider()),
];