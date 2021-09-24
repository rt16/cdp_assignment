import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/db/movie_database.dart';

class MovieDetail extends StatefulWidget {
  final Result? result;
  MovieDetail(this.result);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool isReadmore = false;

  bool thumbsUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Column(
        children: [
          posterWidget(),
          SizedBox(
            height: 5,
          ),
          movieTitle(),
          SizedBox(
            height: 5,
          ),
          releaseDate(),
          SizedBox(
            height: 5,
          ),
          playButtonWidget(),
          SizedBox(
            height: 5,
          ),
          descriptionText(widget.result!.overview!),
          SizedBox(
            height: 5,
          ),
          shareWidget(),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  rate() {
    setState(() {
      print(thumbsUp);
    });
  }

  Widget shareWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        childWidget(Icons.add, "Vote", Colors.white, () {}),
        Column(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  thumbsUp = !thumbsUp;
                });
              },
              icon:
                  Icon(thumbsUp ? Icons.thumb_up : Icons.thumb_up_alt_outlined),
              color: Colors.white,
            ),
            Text(
              "Rate",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        childWidget(
            Icons.share_outlined, "Share Movie 456", Colors.white, () {}),
        childWidget(Icons.download, "DownloadMV..", Colors.white, () {}),
      ],
    );
  }

  childWidget(IconData icon, String text, Color color, Function onPressed) {
    return Column(
      children: [
        IconButton(
            onPressed: onPressed(),
            icon: Icon(
              icon,
              color: color,
            )),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget playButtonWidget() {
    ///gesture dect
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
            Text("PLAY")
          ],
        ),
        onPressed: () {},
        color: Colors.white,
        textColor: Colors.black,
        splashColor: Colors.grey,
      ),
    );
    // return InkWell(
    //   onTap: () => print('icon tapped'),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         border: Border.all(),
    //         borderRadius: BorderRadius.all(Radius.circular(5))),
    //     margin: EdgeInsets.all(5),
    // child: Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
    //     Text("PLAY")
    //   ],
    // ),
    //   ),
    // );
  }

  Widget posterWidget() {
    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            base_image_url + widget.result!.posterPath!,
            fit: BoxFit.cover,
          )),
    );
  }

  Widget releaseDate() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(formatDate(widget.result!.releaseDate!, [yyyy]),
              style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                  fontFamily: 'Arvo',
                  fontWeight: FontWeight.w500)),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: 24,
          decoration: BoxDecoration(
              color: Color(0xff5B6565),
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(widget.result!.adult == true ? "18+" : "16+",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: 'Arvo',
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text("Ratings : " + widget.result!.voteAverage!.toString(),
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'Arvo',
                  fontWeight: FontWeight.w300)),
        ),
      ],
    );
  }

  Widget descriptionText(String text) {
    final lines = isReadmore ? null : 3;
    return GestureDetector(
      onTap: () {
        setState(() {
          isReadmore = !isReadmore;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style:
              TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Arvo'),
          maxLines: lines,
          overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget movieTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(widget.result!.title!,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 27.0,
                      fontFamily: 'Arvo'))),
          // Text(
          //   '${widget.result!.voteAverage!}/10',
          //   style: new TextStyle(
          //       color: Colors.white, fontSize: 20.0, fontFamily: 'Arvo'),
          // )
        ],
      ),
    );
  }

  Widget moviePoster() {
    return Container(
      alignment: Alignment.center,
      child: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.15,
      ),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          image: new DecorationImage(
              image:
                  new NetworkImage(base_image_url + widget.result!.posterPath!),
              fit: BoxFit.cover),
          boxShadow: [
            new BoxShadow(
                color: Colors.black,
                blurRadius: 20.0,
                offset: new Offset(0.0, 10.0))
          ]),
    );
  }
}
