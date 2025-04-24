part of 'carousel_section_bloc.dart';

@immutable
sealed class CarouselSectionState {}

 class CarouselSectionInitial extends CarouselSectionState {}

 class CarouselSectionLoading extends CarouselSectionState {}

class CarouselSectionLoaded extends CarouselSectionState {
  final List<Article> articles;
  CarouselSectionLoaded(this.articles);
}

class CarouselSectionError extends CarouselSectionState {
  final String message;
  CarouselSectionError(this.message);
}


