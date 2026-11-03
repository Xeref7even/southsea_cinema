import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test-film',
        title: 'Test Film',
        synopsis: 'A film used for testing.',
        ageRating: '15',
        screeningTime: 'Today, 20:00',
        ticketPrice: 7.25,
        imagePath: 'assets/images/interstellar.jpg',
      );

      expect(movie.id, 'test-film');
      expect(movie.title, 'Test Film');
      expect(movie.synopsis, 'A film used for testing.');
      expect(movie.ageRating, '15');
      expect(movie.screeningTime, 'Today, 20:00');
      expect(movie.ticketPrice, 7.25);
      expect(movie.imagePath, 'assets/images/interstellar.jpg');
    });

    test('formattedPrice shows a whole-pound price with two decimals', () {
      const movie = Movie(
        id: 'whole',
        title: 'Whole Pound Film',
        synopsis: 'Test synopsis',
        ageRating: 'PG',
        screeningTime: 'Today, 18:00',
        ticketPrice: 8,
        imagePath: 'assets/images/jumanji.jpg',
      );

      expect(movie.formattedPrice, '£8.00');
    });

    test('formattedPrice shows a price with pence', () {
      const movie = Movie(
        id: 'pence',
        title: 'Pence Film',
        synopsis: 'Test synopsis',
        ageRating: 'PG',
        screeningTime: 'Today, 18:00',
        ticketPrice: 9.5,
        imagePath: 'assets/images/naruto.jpg',
      );

      expect(movie.formattedPrice, '£9.50');
    });
  });
}
