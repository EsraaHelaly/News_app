abstract class States {}

class InitiStates extends States {}

class ChangeNavBarState extends States {}



class GetBusinessNewsState extends States {}

class NewsGetBusinessLoadingState extends States {}

class NewsBusniessErrorState extends States {
  final String error;

  NewsBusniessErrorState(this.error);
}



class GetSportsNewsState extends States {}

class NewsGetSportsLoadingState extends States {}

class NewsSportsErrorState extends States {
  final String error;

  NewsSportsErrorState(this.error);
}



class GetScienceNewsState extends States {}

class NewsGetScienceLoadingState extends States {}

class NewsScienceErrorState extends States {
  final String error;

  NewsScienceErrorState(this.error);
}


class GetSearchNewsState extends States {}

class NewsGetSearchLoadingState extends States {}

class NewsSearchErrorState extends States {
  final String error;

  NewsSearchErrorState(this.error);
}


class AppChangeThemeModeState extends States {}

