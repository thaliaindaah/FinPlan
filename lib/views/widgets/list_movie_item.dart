import 'package:flutter/material.dart';
import 'package:test_drive/model/movie/movie.dart';
import 'package:test_drive/res/app_context_extension.dart';

import '../../service/remote/api_end_points.dart';

class ListMovieItem extends StatelessWidget{

  final Result result;

  const ListMovieItem(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              width: context.resources.dimension.size165,
              height: context.resources.dimension.size200,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: Image.network("${ApiEndPoints().imagePosterBaseUrl}${result.posterPath}", fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                width: context.resources.dimension.size150,
                child: Text(
                  "${result.title}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: context.resources.dimension.size35,
                width: context.resources.dimension.size75,
                child: OutlinedButton(onPressed: (){}, child: Text(context.resources.strings.pesan)),
              ),
            )
          ],
        )
    );
  }
}