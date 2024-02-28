import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_style/app_style.dart';
import 'package:movie_app/core/http_services/http_services.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/models/movies_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 32.sp,
              ))
        ],
        title: RichText(
          text: TextSpan(
            text: 'Discover',
            style: AppStyles.style33,
            children: <TextSpan>[
              TextSpan(
                text: '.',
                style: TextStyle(color: Color(0xffFFC700),),
              )
            ],
          ),
        ),

        // title: Text(
        //   'Discover',
        //   style: AppStyles.style33,
        // ),
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<MoviesModel>(
        future: HttpServices.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                MovieModel movie = snapshot.data!.list[index];
                return Container(
                  padding: EdgeInsetsDirectional.all(8),
                  width: 182.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          height: 240,
                          width: 182,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(movie.image),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        Positioned(
                            right: 12,
                            top: 8,
                            child: Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                              size: 30,
                            ))
                      ]),
                      Text(
                        movie.title,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20.sp,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            movie.rating,
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18.sp,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
