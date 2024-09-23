import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/model/movie/movie.dart';
import 'package:test_drive/res/app_context_extension.dart';
import 'package:test_drive/view_model/playing/now_playing_vm.dart';
import 'package:test_drive/views/widgets/list_movie_item.dart';
import 'package:test_drive/views/widgets/movie_horizontal_list_loading_widget.dart';

import '../../../service/remote/api_end_points.dart';
import '../../../service/response/status.dart';

class HomePlayingScreen extends StatefulWidget{
  const HomePlayingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePlayingScreen();

}

class _HomePlayingScreen extends State<HomePlayingScreen>{

  //ViewModel
  final NowPlayingViewModel viewModel = NowPlayingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.resources.dimension.size300,
        child: _observePopularMovie(),
      )
    );
  }

  @override
  void initState(){
    viewModel.fetchNowPlaying();
    super.initState();
  }

  Widget _observePopularMovie(){
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NowPlayingViewModel>(
        builder: ((context, value, child){
          switch(viewModel.apiResponse.status){
            case Status.loading:
              return const MovieHorizontalListLoadingWidget();
            case Status.success:
              return _listMovie(viewModel.apiResponse.data?.results);
            case Status.error:
              return const MovieHorizontalListLoadingWidget();
            default:
              break;
          }
          return Container();
        }),
      ),
    );
  }

  Widget _listMovie(List<Result>? results){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: results?.take(5).length,
      itemBuilder: (context, position){
        return ListMovieItem(results![position]);
      },
    );
  }


}