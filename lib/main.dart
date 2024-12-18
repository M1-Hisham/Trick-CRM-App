import 'package:flutter/material.dart';
import 'package:trick_crm_app/trick_app.dart';

import 'core/di/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const TrickApp());
}
