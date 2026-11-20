import 'package:flutter_test/flutter_test.dart';
import 'package:floranity_mobile/main.dart';

void main() {
  testWidgets('Navigation renders 4 module tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Koleksi'), findsWidgets);
    expect(find.text('Jurnal'), findsOneWidget);
    expect(find.text('Forum'), findsOneWidget);
    expect(find.text('Akun'), findsOneWidget);
  });
}
