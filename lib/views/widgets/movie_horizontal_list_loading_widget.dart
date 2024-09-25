import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_drive/res/app_context_extension.dart';

class MovieHorizontalListLoadingWidget extends StatelessWidget{
  const MovieHorizontalListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.resources.dimension.size200,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Row(
          children: [
            Flexible(
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: SizedBox(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Image.asset("lib/res/images/movie_playing_06.jpg", fit: BoxFit.fill),
                    ),
                  ),
                ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: Image.asset("lib/res/images/movie_playing_06.jpg", fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: Image.asset("lib/res/images/movie_playing_06.jpg", fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

}