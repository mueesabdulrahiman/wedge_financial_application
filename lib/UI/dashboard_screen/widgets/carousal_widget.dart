import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoxton_wealth_project/bloc/carousel_section_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final PageController _pageController = PageController();
  Timer? _timer;

  final List<String> _randomImages = [
    'assets/carousel-images/artificial-intelligence.jpg',
    'assets/carousel-images/electric-vehicle.jpg',
    'assets/carousel-images/Social-Media-and-Mental-Health.jpg',
    'assets/carousel-images/climate-change.jpeg',
    'assets/carousel-images/financial-literacy.jpg',
  ];

  @override
  void initState() {
    super.initState();

    // load articles

    BlocProvider.of<CarouselSectionBloc>(
      context,
      listen: false,
    ).add(LoadArticles());

    // Auto-slide every 3 seconds
    Future.delayed(Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (_pageController.hasClients) {
      int nextPage = _pageController.page!.round() + 1;
      if (nextPage >= 5) nextPage = 0;
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      Future.delayed(Duration(seconds: 3), _autoSlide);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselSectionBloc, CarouselSectionState>(
      builder: (context, state) {
        if (state is CarouselSectionLoading) {
          return CircularProgressIndicator();
        } else if (state is CarouselSectionLoaded) {
          return Column(
            children: [
              Container(
                height: 130,
                color: Colors.white,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: state.articles.length,
                  itemBuilder: (context, index) {
                    final title = state.articles[index].title;
                    final description = state.articles[index].description;
                    final imageUrl = _randomImages[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),

                            child: Image.asset(
                              imageUrl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,

                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                color: Colors.white,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 18),
                padding: const EdgeInsets.all(8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: state.articles.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    radius: 10,
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFF033938),
                    spacing: 5,
                  ),
                ),
              ),
            ],
          );
        } else if (state is CarouselSectionError) {
          return Text(state.message);
        }
        return SizedBox();
      },
    );
  }
}
