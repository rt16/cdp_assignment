import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/db/movie_database.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/ui/movie_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  List<MovieData>? movie = []; // take global variable and keep list empty
  bool loader = true; //initial loader is true

  @override
  void initState() {
    getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          "Top Rated Movie List",
          style: new TextStyle(
              color: Colors.white,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold),
        ),
        elevation: 0.3,
      ),
      body: Stack(
        children: [
          GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 20),
            itemBuilder: (_, index) {
              var result = Result.fromJson(movie![0].results![index]);
              return movieCard(result, context);
            },
            itemCount: movie!.length == 0 ? 0 : movie![0].results!.length,
          ),
          loader == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container()
        ],
      ),
    );
  }

  //fetch all movies list
  getMovies() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool("localStorage") == true) {
      Future<List<MovieData>> movieData = database.getAllMovies();
      movieData.then((value) => {
            setState(() {
              movie = value;
              loader = false;
            })
          });
    } else {
      getCall(base_url +
              "movie/top_rated?api_key=$API_KEY&language=en-US&page=1")
          .then((value) async {
        if (value['status'] == 200) {
          setState(() {
            // var batch ;
            loader = false;
            //movie = value['body'];
            // value['body'].entries.forEach((e) => movieList!.add(MovieData(
            //     page: value['body']['page'],
            //     results: value['body']['results'],
            //     total_pages: value['body']['total_pages'],
            //     total_results: value['body']['total_results'])));
            // print(value['body']['results']);

            // var data = MovieData.fromJson(value['body']);
            // data.results = Result.fromJson(value['body']['results']);
            var movieData = MovieData(
                page: value['body']['page'],
                results: value['body']['results'],
                total_pages: value['body']['total_pages'],
                total_results: value['body']['total_results']);
            database.insertMovie(movieData).then((value) {
              Future<List<MovieData>> movieData = database.getAllMovies();
              movieData.then((value) => {
                    setState(() {
                      movie = value;
                    })
                  });
              sharedPreferences.setBool("localStorage", true);
            });
          });
        } else if (value['status'] == 404) {
          setState(() {
            loader = false;
          });
        }
      });
    }
  }
}
