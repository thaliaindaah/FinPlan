import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/model/movie/movie.dart';
import 'package:test_drive/res/app_context_extension.dart';
import 'package:test_drive/service/remote/api_end_points.dart';
import 'package:test_drive/view_model/popular/popular_vm.dart';
import 'package:test_drive/views/dashboard/child/home_playing_screen.dart';
import 'package:test_drive/views/dashboard/child/home_promotion_screen.dart';
import 'package:test_drive/views/dashboard/child/home_upcoming_screen.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/service/response/status.dart';
import 'package:test_drive/views/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen>{

  final PageController _pageController = PageController();

  int pageChange = 0;

  Color playingColor = Colors.red;
  Color upcomingColor = Colors.grey;

  //ViewModel
  final PopularViewModel viewModel = PopularViewModel();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  _observePopularMovie(),
                  _moviePlayingOrUpcoming(),
                  Expanded(child: _pageViewPlayingOrUpcoming()),
                  const HomePromotionScreen()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState(){
    viewModel.fetchPopularMovie();
    super.initState();
  }

  Widget _pageViewPlayingOrUpcoming(){
    return SizedBox(
      width: double.infinity,
      height: context.resources.dimension.size300,
      child: _pageView(),
    );
  }

  Widget _moviePlayingOrUpcoming(){
    return Row(
      children: [
        TextButton(onPressed: (){
          setState((){
            playingColor = Colors.red;
            upcomingColor = Colors.grey;
          });
          if(pageChange > 0){
            _pageController.animateToPage(--pageChange, duration: const Duration(milliseconds: 250), curve: Curves.bounceInOut);
          }
        }, child: Text(
          context.resources.strings.playing,
          style: TextStyle(color: playingColor
          ),
        ),
        ),
        Container(
          margin: EdgeInsets.only(left: context.resources.dimension.size05),
          child: TextButton(onPressed: (){
            setState((){
              playingColor = Colors.grey;
              upcomingColor = Colors.red;
            });
            if(pageChange < 1){
              _pageController.animateToPage(++pageChange, duration: const Duration(milliseconds: 250), curve: Curves.bounceInOut);
            }
          }, child: Text(
            context.resources.strings.upcoming,
            style: TextStyle(color: upcomingColor),
          )
          ),
        ),
        Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: context.resources.dimension.size05),
                      child: Text(context.resources.strings.karawang),
                    )
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.red,)
              ],
            )
        )
      ],
    );
  }

  Widget _pageView(){
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      pageSnapping: true,
      controller: _pageController,
      onPageChanged: (index){
        setState((){
          pageChange = index;
        });
      },
      children: const [
        HomePlayingScreen(),
        HomeUpcomingScreen()
      ],
    );
  }

  Widget _observePopularMovie(){
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<PopularViewModel>(
        builder: ((context, value, child){
          switch(viewModel.apiResponse.status){
            case Status.loading:
              return const LoadingBannerWidget();
            case Status.success:
              return _imageSlider(viewModel.apiResponse.data?.results);
            case Status.error:
              return const LoadingBannerWidget();
            default:
              break;
          }
          return Container();
        }),
      ),
    );
  }

  Widget _imageSlider(List<Result>? results){
    return CarouselSlider(
      options: CarouselOptions(
        height: context.resources.dimension.size200,
        autoPlay: true,
      ),
      items: results?.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Image.network(
                  "${ApiEndPoints().imagePosterBaseUrl}${i.backdropPath}",
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

}

