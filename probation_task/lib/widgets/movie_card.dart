import 'package:flutter/material.dart';
import '../models/movie_card.dart';
import 'package:intl/intl.dart';

class MovieCardWidget extends StatefulWidget {
  final MovieCard card;

  MovieCardWidget({@required this.card});

  @override
  _MovieCardWidgetState createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  // int netVotes = widget.card.netVotes
  @override
  Widget build(BuildContext context) {
    //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(card.releaseDate);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 17, right: 17),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_upward_rounded),
                    onPressed: () {
                      setState(() {
                        int t = widget.card.netVotes.toInt() +1;
                        widget.card.netVotes = t;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.card.netVotes.toString()),
                ),
                 IconButton(
                    icon: Icon(Icons.arrow_downward_rounded),
                    onPressed: () {
                      setState(() {
                        int t = widget.card.netVotes.toInt() - 1;
                        widget.card.netVotes = t;
                      });
                    }),
                Text('Votes')
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 65,
                  child: widget.card.posterUrl != ''
                      ? Image.network(widget.card.posterUrl)
                      : Container()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                          width: 110,
                          child: Text(
                            widget.card.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ),
                    Container(
                        width: 110,
                        child: Text('Genre: ${widget.card.genre}',
                            overflow: TextOverflow.ellipsis)),
                    Container(
                        width: 110,
                        child: Text('Director: ${widget.card.director[0]}',
                            overflow: TextOverflow.ellipsis)),
                    Container(
                        width: 110,
                        child: Text(
                          'Starring : ${widget.card.starring[0]}',
                          overflow: TextOverflow.ellipsis,
                        )),
                    Container(
                        width: 110,
                        child: Text(
                          '${widget.card.language}| May 21',
                          overflow: TextOverflow.ellipsis,
                        )),
                    Container(
                        width: 110,
                        child: Text(
                            '${widget.card.pageViews} views | Voted by ${widget.card.totalVotes} people',
                            style: TextStyle(color: Colors.blueAccent),
                            overflow: TextOverflow.ellipsis))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
