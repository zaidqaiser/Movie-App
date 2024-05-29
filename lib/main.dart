import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Movie {
  final String title;
  final String year;
  final String imageUrl;
  final String description;

  Movie({
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.description,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamari Movies by ZAID',
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  String query = '';

  final List<Movie> movies = [
    Movie(
      title: 'Bhool Bhulaiyaa 2',
      year: '2023',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/thumb/2/23/Bhool_Bhulaiyaa_2_film_poster.jpg/220px-Bhool_Bhulaiyaa_2_film_poster.jpg',
      description: 'When strangers Reet and Ruhan cross paths, their journey leads to an abandoned mansion and a dreaded spirit that has been trapped for 18 years.',
    ),
    Movie(
      title: 'Shaitaan',
      year: '2024',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BZTU5YjhlOGQtNDA4NC00ODMzLThjNjYtYWJlMDU1ZGQ3OWM5XkEyXkFqcGdeQXVyMTUyNjIwMDEw._V1_.jpg',
      description: 'A family finds trouble when their daughter falls under the spell of black magic, cast by a stranger, and they set out to stop the possession and uncover the strangers motives.',
    ),
    Movie(
      title: 'RRR',
      year: '2023',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvby8UXTaqw3ofCktFcpG5Atx9reMrW900OKuHUHVbnQ&s',
      description: 'RRR is an entirely fictitious story incorporating the lives of two real-life Indian revolutionaries, namely Alluri Sitarama Raju and Komaram Bheem, who fought against the British Raj and the Nizam of Hyderabad respectively',
    ),
    Movie(
      title: '12th Fail',
      year: '2024',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/f/f2/12th_Fail_poster.jpeg',
      description: 'tells a fascinating story about willpower and resilience in people who experience ups and downs in life.',
    ),
    Movie(
      title: 'Kantara',
      year: '2023',
      imageUrl: 'https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABQqf0XVn2m9k8RQUvn6bPj7ew_oiqm51Qo3w9sZGltfZKVU1lYPaHetYznd3EMWwBVdUEuDi0ulRwRXYKwLGltLkApDojyZ5li4.jpg?r=fbd',
      description: 'When greed paves the way for betrayal, scheming and murder, a young tribal reluctantly dons the traditions of his ancestors to seek justice',
    ),
    Movie(
      title: 'Animal',
      year: '2023',
      imageUrl: 'https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABeYOwt43Qbc_MdUj7_ijb7rWI4t9INWI8Gzlh36Bgd3jlQiNWT3lt2cxKmXfysTMgRfHSbjLbt62U0s9I_W8Lbu-JFZXuG6N0dE.jpg?r=434',
      description: 'The hardened son of a powerful industrialist returns home after years abroad and vows to take bloody revenge',
    ),
    Movie(
      title: 'Alive',
      year: '2023',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2OzJhAcLttwAOtZ0zm9GuVCXDs3IzKdfQ0Oyt9xx1Bw&s',
      description: 'revolves around a video game live streamers struggle for survival as he is forced to stay alone in his apartment in Seoul during a zombie apocalypse',
    ),
    Movie(
      title: 'Cargo',
      year: '2023',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BZTczZWEyOTktODNmMC00NDgzLTk3NTktYjllN2Y4MWMxOGViXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg',
      description: 'Cargo is a sci-fi movie with the abstract concept of the afterlife.',
    ),
    Movie(
      title: 'Day Shift',
      year: '2023',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BYWI2ZDRjYjEtOWJiOS00NWVjLWI1MjAtNWNiMzAwNGFmNjljXkEyXkFqcGdeQXVyODEwMTc2ODQ@._V1_FMjpg_UX1000_.jpg',
      description: 'Day Shift is a 2022 American action comedy horror film directed by J. J. Perry in his directorial debut, written by Tyler Tice and Shay Hatten from a story by Tice',
    ),
    // Add more movies as needed
  ];

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              height: 60.0, // Adjust the height as needed
            ),
            SizedBox(width: 10.0), // Add some spacing between the image and the text
            Text('Hamari Movies by ZAID'),
          ],
        ),
        // title: Text('Hamari Movies by ZAID'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Movies',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:1,
                 crossAxisSpacing: 10,
                 mainAxisSpacing: 10,
              ),
              itemCount: filteredMovies.length,
              itemBuilder: (ctx, index) {
                return MovieItem(movie: filteredMovies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;

  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(movie.title),
            content: Text(movie.description),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie.imageUrl, fit: BoxFit.cover, width: double.infinity, height: 150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(movie.year),
            ),
          ],
        ),
      ),
    );
  }
}
