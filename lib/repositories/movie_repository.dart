import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis:
            'A team of explorers travel through a wormhole in space to search for a new home for humanity.',
        ageRating: '12A',
        screeningTime: 'Today, 19:30',
        ticketPrice: 9.50,
        imagePath: 'assets/images/interstellar.jpg',
      ),
      const Movie(
        id: 'jumanji',
        title: 'Jumanji: Welcome to the Jungle',
        synopsis:
            'Four teenagers get sucked into a video game version of Jumanji and must survive the jungle as their avatars.',
        ageRating: '12A',
        screeningTime: 'Today, 17:00',
        ticketPrice: 8.50,
        imagePath: 'assets/images/jumanji.jpg',
      ),
      const Movie(
        id: 'road-to-ninja',
        title: 'Road to Ninja: Naruto the Movie',
        synopsis:
            'Naruto and Sakura are trapped in an alternate world where everyone\'s personality is reversed, and Naruto finally meets the parents he never knew.',
        ageRating: '12A',
        screeningTime: 'Tomorrow, 18:15',
        ticketPrice: 8.00,
        imagePath: 'assets/images/naruto.jpg',
      ),
    ];
  }
}
