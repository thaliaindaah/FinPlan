import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/res/app_context_extension.dart';
import 'package:test_drive/view_model/upcoming/upcoming_vm.dart';

import '../../../model/movie/movie.dart';
import '../../../service/response/status.dart';
import '../../widgets/list_movie_item.dart';
import '../../widgets/movie_horizontal_list_loading_widget.dart';

class HomeUpcomingScreen extends StatefulWidget{
  const HomeUpcomingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeUpcomingScreen();

}

class _HomeUpcomingScreen extends State<HomeUpcomingScreen>{

  //ViewModel
  final UpcomingViewModel viewModel = UpcomingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: context.resources.dimension.size300,
          child: _observeUpcoming(),
        )
    );
  }

  @override
  void initState(){
    viewModel.fetchUpcomingMovie();
    super.initState();
  }

  Widget _observeUpcoming(){
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<UpcomingViewModel>(
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