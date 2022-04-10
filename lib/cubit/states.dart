abstract class NewsStates{}

class Newsinialstate extends NewsStates{}

class NewsBottomNavstate extends NewsStates{}

class NewsBusinessstateSucess extends NewsStates{}
class NewsBusinessstateFail extends NewsStates
{
  final String error ;

  NewsBusinessstateFail(this.error);

}
class NewsBusinessstateLoading extends NewsStates{}


class NewsSportsstateSucess extends NewsStates{}
class NewsSportssstateFail extends NewsStates
{
  final String error ;

  NewsSportssstateFail(this.error);

}
class NewsSportsstateLoading extends NewsStates{}


class NewssearchstateSucess extends NewsStates{}
class NewssearchsstateFail extends NewsStates
{
  final String error ;

  NewssearchsstateFail(this.error);

}
class NewssearchstateLoading extends NewsStates{}



class NewsscinecestateSucess extends NewsStates{}
class NewsscinecestateFail extends NewsStates
{
  final String error ;

  NewsscinecestateFail(this.error);

}
class NewsscinecestateLoading extends NewsStates{}

class changeModeState extends NewsStates{}