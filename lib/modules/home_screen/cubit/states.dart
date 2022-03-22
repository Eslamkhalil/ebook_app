
abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState{}
class HomeScreenLoadingState extends HomeScreenState{}

class HomeScreenSuccessGetBannerState extends HomeScreenState{}
class HomeScreenSuccessGetCategoryState extends HomeScreenState{}
class HomeScreenSuccessGetPopularState extends HomeScreenState{}


class HomeScreenErrorGetBannerState extends HomeScreenState{
  String error;

  HomeScreenErrorGetBannerState(this.error);
}
class HomeScreenErrorGetPopularState extends HomeScreenState{
  String error;

  HomeScreenErrorGetPopularState(this.error);
}
class HomeScreenErrorGetCategoryState extends HomeScreenState{
  String error;

  HomeScreenErrorGetCategoryState(this.error);
}





class HomeScreenOnBottomNavChangeState extends HomeScreenState {}

