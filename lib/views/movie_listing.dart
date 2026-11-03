import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.movie.imagePath,
              width: 160,
              height: 240,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              widget.movie.title,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(widget.movie.synopsis),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.black26,
              child: Text(
                '${widget.movie.screeningTime} | ${widget.movie.formattedPrice} per ticket',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Age rating: ${widget.movie.ageRating}'),
            const SizedBox(height: 20),
            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1 Ticket'),
                DropdownMenuEntry(value: 2, label: '2 Tickets'),
                DropdownMenuEntry(value: 3, label: '3 Tickets'),
                DropdownMenuEntry(value: 4, label: '4 Tickets'),
                DropdownMenuEntry(value: 5, label: '5 Tickets'),
              ],
            ),
            Text('Selected: $_ticketQuantity ticket(s)'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _message =
                      'Added $_ticketQuantity ticket(s) for ${widget.movie.title} to your order';
                });
              },
              child: const Text('Add To Order'),
            ),
            const SizedBox(height: 10),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
