import 'package:flutter/material.dart';
import '../models/movie_card.dart';
import 'package:intl/intl.dart';

class MovieCardWidget extends StatelessWidget {


 final MovieCard card;

  MovieCardWidget(
      {@required this.card});
  @override
  Widget build(BuildContext context) {
    //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(card.releaseDate);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 17, right: 17),
      child: Container(
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(card.netVotes.toString()),
                ),
                Text('Votes')
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 65, child: card.posterUrl != '' ?Image.network(card.posterUrl):Container()),
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
                      child: Container(width:200,child: Text(card.title,style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 20),)),
                    ),
                    Container(width:180,child: Text('Genre: ${card.genre}',overflow: TextOverflow.ellipsis)),
                    Container(width:180,child: Text('Director: ${card.director[0]}',overflow: TextOverflow.ellipsis)),
                    Container(width:180,child: Text('Starring : ${card.starring[0]}',overflow: TextOverflow.ellipsis,)),
                    Container(width: 180,child: Text('${card.language}| May 21',overflow: TextOverflow.ellipsis,)),
                    Container(width:180,child: Text('${card.pageViews} views | Voted by ${card.totalVotes} people',style: TextStyle(color: Colors.blueAccent),overflow: TextOverflow.ellipsis))
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
