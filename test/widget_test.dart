import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void useLargeScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(1200, 2000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}

void main() {
  group('Home page widget tests', () {
    testWidgets('shows the app title and welcome heading',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);
      expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
    });

    testWidgets('shows a card for each movie', (WidgetTester tester) async {
      useLargeScreen(tester);
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(MovieCard), findsNWidgets(3));
      expect(find.text('Interstellar'), findsOneWidget);
      expect(find.text('Jumanji: Welcome to the Jungle'), findsOneWidget);
      expect(find.text('Road to Ninja: Naruto the Movie'), findsOneWidget);
    });

    testWidgets('shows a booking button on every card',
        (WidgetTester tester) async {
      useLargeScreen(tester);
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(
        find.widgetWithText(ElevatedButton, 'Book Tickets'),
        findsNWidgets(3),
      );
    });
  });
}
