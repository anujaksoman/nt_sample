
class Globals {
  static final Globals _instance = Globals.internal();

  factory Globals() => _instance;

  Globals.internal();

  static const baseUrl = 'https://api.nytimes.com/';


  //static const USE_FAKE_IMPLEMENTATION = false;
  //static const IS_APP_FIRST_TIME = 'IS_APP_FIRST_TIME';

}