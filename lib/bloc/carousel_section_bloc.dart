import 'package:hoxton_wealth_project/models/article.dart';
import 'package:hoxton_wealth_project/repositories/carousel_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'carousel_section_event.dart';
part 'carousel_section_state.dart';

class CarouselSectionBloc
    extends Bloc<CarouselSectionEvent, CarouselSectionState> {
  final CarouselRepository carouselRepository;
  CarouselSectionBloc(this.carouselRepository)
    : super(CarouselSectionInitial()) {
    on<LoadArticles>((event, emit) async {
      emit(CarouselSectionLoading());
      try {
        final articles = await carouselRepository.fetchArticles();
        emit(CarouselSectionLoaded(articles));
      } catch (e) {
        emit(CarouselSectionError(e.toString()));
      }
    });
  }
}
