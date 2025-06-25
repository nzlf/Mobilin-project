import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Pastikan ini sesuai nama folder/project kamu
import 'package:flutter_application_1/screens/welcome_page.dart';

void main() {
  testWidgets('Splash screen menampilkan teks Mobilin', (WidgetTester tester) async {
    await tester.pumpWidget(MobilinApp());

    // Karena teks 'Mobilin' terpecah antara TextSpan dan WidgetSpan (icon),
    // kita cari bagian yang bisa dikenali (contohnya 'bilin')
    expect(find.textContaining('bilin'), findsOneWidget);
  });

  testWidgets('Welcome page menampilkan teks Welcome dan Create Account', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WelcomePage(),
      ),
    );

    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
  });
}
