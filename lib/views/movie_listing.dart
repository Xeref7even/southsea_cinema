import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interstellar',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'A team of explorers travel through a wormhole in space to search for a new home for humanity.',
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.black26,
              child: const Text(
                'Christopher Nolan | 2014',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('12A'),
                Text('169 mins'),
                Text('Sci-Fi'),
              ],
            ),
            SizedBox(height: 20),
            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 1, label: '1 Ticket'),
                DropdownMenuEntry(value: 2, label: '2 Tickets'),
                DropdownMenuEntry(value: 3, label: '3 Tickets'),
                DropdownMenuEntry(value: 4, label: '4 Tickets'),
                DropdownMenuEntry(value: 5, label: '5 Tickets'),
              ],
            ),
            Text('Selected: $_ticketQuantity ticket(s)'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _message = 'Added $_ticketQuantity ticket(s) to your order';
                });
              },
              child: const Text('Add To Order'),
            ),
            SizedBox(height: 10),
            Text(_message),
          ],
        ),
      ),
    );
  }
}
