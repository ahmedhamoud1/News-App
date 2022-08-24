abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}

class BottomNavBarState extends NewsStates{}

class NewsGetBusinessSucsessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates {
  late final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetSportSucsessState extends NewsStates{}

class NewsGetSportErrorState extends NewsStates {
  late final String error;
  NewsGetSportErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStates{}

class NewsGetScienceSucsessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates {
  late final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsGetTechSucsessState extends NewsStates{}

class NewsGetTechErrorState extends NewsStates {
  late final String error;
  NewsGetTechErrorState(this.error);
}

class NewsGetTechLoadingState extends NewsStates{}

class NewsGetHealthSucsessState extends NewsStates{}

class NewsGetHealthErrorState extends NewsStates {
  late final String error;
  NewsGetHealthErrorState(this.error);
}

class NewsGetHealthLoadingState extends NewsStates{}

class NewsGetSearchSucsessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates {
  late final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates{}


class NewsAppModeState extends NewsStates{}






