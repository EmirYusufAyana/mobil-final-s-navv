class Movie {
  final String name;
  final String imagePath;
  final String videoPath;
  final String category;
  final int year;
  final Duration duration;
  final double stars;

  const Movie({
    required this.name,
    required this.imagePath,
    required this.videoPath,
    required this.category,
    required this.year,
    required this.duration,
    required this.stars,
  });

  static const movies = [
    Movie(
      name: 'Star Wars',
      imagePath:
          'https://images.unsplash.com/flagged/photo-1589829482673-03413c918c48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=742&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Science fiction',
      year: 2022,
      duration: Duration(hours: 1, minutes: 55),
      stars: 4,
    ),
    Movie(
      name: 'Fast and Furious',
      imagePath:
          'https://images.unsplash.com/photo-1514316454349-750a7fd3da3a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 2, minutes: 3),
      stars: 4.5,
    ),
    Movie(
      name: 'Spiderman',
      imagePath:
          'https://images.unsplash.com/photo-1635805737707-575885ab0820?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 2, minutes: 9),
      stars: 3.5,
    ),
    Movie(
      name: 'Thirteen Lives',
      imagePath:
          'https://images.unsplash.com/photo-1559108318-39ed452bb6c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Drama',
      year: 2022,
      duration: Duration(hours: 2, minutes: 22),
      stars: 5,
    ),
    Movie(
      name: 'The Innocents',
      imagePath:
          'https://images.unsplash.com/photo-1509281373149-e957c6296406?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
      stars: 1,
    ),
    Movie(
      name: 'Lightyear',
      imagePath:
          'https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Kids',
      year: 2022,
      duration: Duration(hours: 1, minutes: 40),
      stars: 2,
    ),
    Movie(
      name: 'Leave No Trace',
      imagePath:
          'https://plus.unsplash.com/premium_photo-1661902604046-63b7a66981fc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Drama',
      year: 2022,
      duration: Duration(hours: 1, minutes: 48),
      stars: 3,
    ),
    Movie(
      name: 'Hustle',
      imagePath:
          'https://images.unsplash.com/photo-1677051949386-d999c9076424?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      videoPath: 'assets/videos/movie.mov',
      category: 'Drama',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
      stars: 3.5,
    ),
  ];
}
