import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pdv7/flutter_flow/flutter_flow_icon_button.dart';
import 'package:pdv7/flutter_flow/flutter_flow_widgets.dart';
import 'package:pdv7/index.dart';
import 'package:pdv7/main.dart';
import 'package:pdv7/flutter_flow/flutter_flow_util.dart';

import 'package:pdv7/auth/custom_auth/auth_util.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login', () async {
    testWidgets('Should log in', (WidgetTester tester) async {
      _overrideOnError();

      await authManager.signOut();

      await tester.pumpWidget(MyApp(
        entryPage: LoginWidget(),
      ));

      await tester.enterText(find.byKey(ValueKey('operator_xxeu')),
          'fellipe.silva@bilheteriadigital.com');
      await tester.enterText(find.byKey(ValueKey('password_qync')), 'URGRd3BR');
      await tester.tap(find.byKey(ValueKey('Button_332c')));
      expect(
        tester
            .widget<FFButtonWidget>(find.byKey(ValueKey('Button_332c')))
            .onPressed,
        isNull,
      );
    });
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
