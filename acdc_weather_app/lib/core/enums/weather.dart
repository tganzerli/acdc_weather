enum Weather {
  clear('Clear'),
  clouds('Clouds'),
  rain('Rain'),
  snow('Snow'),
  drizzle('Drizzle'),
  thunderstorm('Thunderstorm'),
  mist('Mist'),
  smoke('Smoke'),
  haze('Haze'),
  dust('Dust'),
  fog('Fog'),
  sand('Sand'),
  ash('Ash'),
  squall('Squall'),
  tornado('Tornado'),
  ;

  final String label;

  const Weather(this.label);

  static Weather fromId(int id) {
    switch (id) {
      case 1:
        return Weather.clear;
      case 2:
        return Weather.thunderstorm;
      case 3:
        return Weather.drizzle;
      case 5:
        return Weather.rain;
      case 6:
        return Weather.snow;
      case 7:
        return Weather.clouds;
      case 8:
        return Weather.mist;
      case 9:
        return Weather.smoke;
      case 10:
        return Weather.haze;
      case 11:
        return Weather.dust;
      case 12:
        return Weather.fog;
      case 13:
        return Weather.sand;
      case 14:
        return Weather.ash;
      case 15:
        return Weather.squall;
      case 16:
        return Weather.tornado;
      default:
        return Weather.clear;
    }
  }

  int toId() {
    switch (this) {
      case Weather.clear:
        return 1;
      case Weather.thunderstorm:
        return 2;
      case Weather.drizzle:
        return 3;
      case Weather.rain:
        return 4;
      case Weather.snow:
        return 5;
      case Weather.clouds:
        return 6;
      case Weather.mist:
        return 7;
      case Weather.smoke:
        return 8;
      case Weather.haze:
        return 9;
      case Weather.dust:
        return 10;
      case Weather.fog:
        return 11;
      case Weather.sand:
        return 12;
      case Weather.ash:
        return 13;
      case Weather.squall:
        return 14;
      case Weather.tornado:
        return 15;
      default:
        return 1;
    }
  }
}
