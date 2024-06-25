class WeatherMocks {
  Map current() {
    return {
      "coord": {"lon": -46.6361, "lat": -23.5475},
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "base": "stations",
      "main": {
        "temp": 19.28,
        "feels_like": 19.25,
        "temp_min": 18.75,
        "temp_max": 20.05,
        "pressure": 1024,
        "humidity": 76
      },
      "visibility": 10000,
      "wind": {"speed": 4.63, "deg": 180},
      "clouds": {"all": 75},
      "dt": 1719333303,
      "sys": {
        "type": 1,
        "id": 8394,
        "country": "BR",
        "sunrise": 1719308917,
        "sunset": 1719347387
      },
      "timezone": -10800,
      "id": 3448439,
      "name": "São Paulo",
      "cod": 200
    };
  }

  Map forecast() {
    return {
      "cod": "200",
      "message": 0,
      "cnt": 40,
      "list": [
        {
          "dt": 1719349200,
          "main": {
            "temp": 22.6,
            "feels_like": 22.64,
            "temp_min": 16.86,
            "temp_max": 22.6,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1003,
            "humidity": 66,
            "temp_kf": 5.74
          },
          "weather": [
            {
              "id": 801,
              "main": "Clouds",
              "description": "few clouds",
              "icon": "02n"
            }
          ],
          "clouds": {"all": 22},
          "wind": {"speed": 3.52, "deg": 55, "gust": 7.35},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-25 21:00:00"
        },
        {
          "dt": 1719360000,
          "main": {
            "temp": 19.08,
            "feels_like": 19.16,
            "temp_min": 15.88,
            "temp_max": 19.08,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1002,
            "humidity": 81,
            "temp_kf": 3.2
          },
          "weather": [
            {
              "id": 802,
              "main": "Clouds",
              "description": "scattered clouds",
              "icon": "03n"
            }
          ],
          "clouds": {"all": 41},
          "wind": {"speed": 2.6, "deg": 65, "gust": 4.02},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-26 00:00:00"
        },
        {
          "dt": 1719370800,
          "main": {
            "temp": 14.11,
            "feels_like": 14.08,
            "temp_min": 14.11,
            "temp_max": 14.11,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1002,
            "humidity": 96,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 802,
              "main": "Clouds",
              "description": "scattered clouds",
              "icon": "03n"
            }
          ],
          "clouds": {"all": 25},
          "wind": {"speed": 2.46, "deg": 47, "gust": 2.6},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-26 03:00:00"
        },
        {
          "dt": 1719381600,
          "main": {
            "temp": 15.62,
            "feels_like": 15.64,
            "temp_min": 15.62,
            "temp_max": 15.62,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1002,
            "humidity": 92,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 801,
              "main": "Clouds",
              "description": "few clouds",
              "icon": "02d"
            }
          ],
          "clouds": {"all": 15},
          "wind": {"speed": 3.21, "deg": 49, "gust": 4.95},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-26 06:00:00"
        },
        {
          "dt": 1719392400,
          "main": {
            "temp": 19.51,
            "feels_like": 19.42,
            "temp_min": 19.51,
            "temp_max": 19.51,
            "pressure": 1014,
            "sea_level": 1014,
            "grnd_level": 1001,
            "humidity": 73,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": {"all": 3},
          "wind": {"speed": 2.89, "deg": 70, "gust": 3.33},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-26 09:00:00"
        },
        {
          "dt": 1719403200,
          "main": {
            "temp": 22.89,
            "feels_like": 22.88,
            "temp_min": 22.89,
            "temp_max": 22.89,
            "pressure": 1013,
            "sea_level": 1013,
            "grnd_level": 1000,
            "humidity": 63,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": {"all": 2},
          "wind": {"speed": 1.21, "deg": 108, "gust": 1.25},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-26 12:00:00"
        },
        {
          "dt": 1719414000,
          "main": {
            "temp": 24.15,
            "feels_like": 24.19,
            "temp_min": 24.15,
            "temp_max": 24.15,
            "pressure": 1011,
            "sea_level": 1011,
            "grnd_level": 998,
            "humidity": 60,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": {"all": 3},
          "wind": {"speed": 1.17, "deg": 188, "gust": 1.71},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-26 15:00:00"
        },
        {
          "dt": 1719424800,
          "main": {
            "temp": 23.93,
            "feels_like": 24.21,
            "temp_min": 23.93,
            "temp_max": 23.93,
            "pressure": 1010,
            "sea_level": 1010,
            "grnd_level": 997,
            "humidity": 70,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 801,
              "main": "Clouds",
              "description": "few clouds",
              "icon": "02d"
            }
          ],
          "clouds": {"all": 11},
          "wind": {"speed": 1.11, "deg": 161, "gust": 2.67},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-26 18:00:00"
        },
        {
          "dt": 1719435600,
          "main": {
            "temp": 18.84,
            "feels_like": 19.03,
            "temp_min": 18.84,
            "temp_max": 18.84,
            "pressure": 1009,
            "sea_level": 1009,
            "grnd_level": 996,
            "humidity": 86,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10n"
            }
          ],
          "clouds": {"all": 62},
          "wind": {"speed": 2.38, "deg": 236, "gust": 3.46},
          "visibility": 10000,
          "pop": 0.2,
          "rain": {"3h": 0.11},
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-26 21:00:00"
        },
        {
          "dt": 1719446400,
          "main": {
            "temp": 16.33,
            "feels_like": 16.53,
            "temp_min": 16.33,
            "temp_max": 16.33,
            "pressure": 1009,
            "sea_level": 1009,
            "grnd_level": 996,
            "humidity": 96,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04n"
            }
          ],
          "clouds": {"all": 57},
          "wind": {"speed": 3.65, "deg": 240, "gust": 8.38},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-27 00:00:00"
        },
        {
          "dt": 1719457200,
          "main": {
            "temp": 14.25,
            "feels_like": 14.24,
            "temp_min": 14.25,
            "temp_max": 14.25,
            "pressure": 1008,
            "sea_level": 1008,
            "grnd_level": 995,
            "humidity": 96,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04n"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 3.48, "deg": 227, "gust": 9.02},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-27 03:00:00"
        },
        {
          "dt": 1719468000,
          "main": {
            "temp": 14.63,
            "feels_like": 14.55,
            "temp_min": 14.63,
            "temp_max": 14.63,
            "pressure": 1007,
            "sea_level": 1007,
            "grnd_level": 994,
            "humidity": 92,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 4.18, "deg": 242, "gust": 8.83},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-27 06:00:00"
        },
        {
          "dt": 1719478800,
          "main": {
            "temp": 17.36,
            "feels_like": 17.14,
            "temp_min": 17.36,
            "temp_max": 17.36,
            "pressure": 1007,
            "sea_level": 1007,
            "grnd_level": 995,
            "humidity": 76,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 6.46, "deg": 236, "gust": 8.41},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-27 09:00:00"
        },
        {
          "dt": 1719489600,
          "main": {
            "temp": 18.02,
            "feels_like": 17.63,
            "temp_min": 18.02,
            "temp_max": 18.02,
            "pressure": 1008,
            "sea_level": 1008,
            "grnd_level": 995,
            "humidity": 67,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10d"
            }
          ],
          "clouds": {"all": 97},
          "wind": {"speed": 6.89, "deg": 241, "gust": 9.88},
          "visibility": 10000,
          "pop": 0.2,
          "rain": {"3h": 0.13},
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-27 12:00:00"
        },
        {
          "dt": 1719500400,
          "main": {
            "temp": 18.28,
            "feels_like": 17.83,
            "temp_min": 18.28,
            "temp_max": 18.28,
            "pressure": 1008,
            "sea_level": 1008,
            "grnd_level": 995,
            "humidity": 64,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 85},
          "wind": {"speed": 8.41, "deg": 241, "gust": 11.65},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-27 15:00:00"
        },
        {
          "dt": 1719511200,
          "main": {
            "temp": 15.73,
            "feels_like": 15.29,
            "temp_min": 15.73,
            "temp_max": 15.73,
            "pressure": 1008,
            "sea_level": 1008,
            "grnd_level": 995,
            "humidity": 74,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 802,
              "main": "Clouds",
              "description": "scattered clouds",
              "icon": "03d"
            }
          ],
          "clouds": {"all": 43},
          "wind": {"speed": 8.37, "deg": 241, "gust": 12.04},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-27 18:00:00"
        },
        {
          "dt": 1719522000,
          "main": {
            "temp": 12.66,
            "feels_like": 12.12,
            "temp_min": 12.66,
            "temp_max": 12.66,
            "pressure": 1009,
            "sea_level": 1009,
            "grnd_level": 996,
            "humidity": 82,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "clouds": {"all": 2},
          "wind": {"speed": 6.96, "deg": 245, "gust": 13.13},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-27 21:00:00"
        },
        {
          "dt": 1719532800,
          "main": {
            "temp": 11.33,
            "feels_like": 10.76,
            "temp_min": 11.33,
            "temp_max": 11.33,
            "pressure": 1011,
            "sea_level": 1011,
            "grnd_level": 998,
            "humidity": 86,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01n"
            }
          ],
          "clouds": {"all": 7},
          "wind": {"speed": 6.72, "deg": 246, "gust": 13.24},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-28 00:00:00"
        },
        {
          "dt": 1719543600,
          "main": {
            "temp": 10.78,
            "feels_like": 10.13,
            "temp_min": 10.78,
            "temp_max": 10.78,
            "pressure": 1012,
            "sea_level": 1012,
            "grnd_level": 999,
            "humidity": 85,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 801,
              "main": "Clouds",
              "description": "few clouds",
              "icon": "02n"
            }
          ],
          "clouds": {"all": 19},
          "wind": {"speed": 6.42, "deg": 257, "gust": 11.66},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-28 03:00:00"
        },
        {
          "dt": 1719554400,
          "main": {
            "temp": 12.28,
            "feels_like": 11.42,
            "temp_min": 12.28,
            "temp_max": 12.28,
            "pressure": 1014,
            "sea_level": 1014,
            "grnd_level": 1001,
            "humidity": 71,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 53},
          "wind": {"speed": 5.99, "deg": 265, "gust": 10.08},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-28 06:00:00"
        },
        {
          "dt": 1719565200,
          "main": {
            "temp": 13.36,
            "feels_like": 12.58,
            "temp_min": 13.36,
            "temp_max": 13.36,
            "pressure": 1016,
            "sea_level": 1016,
            "grnd_level": 1003,
            "humidity": 70,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 93},
          "wind": {"speed": 7.05, "deg": 264, "gust": 9.27},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-28 09:00:00"
        },
        {
          "dt": 1719576000,
          "main": {
            "temp": 16.78,
            "feels_like": 16.03,
            "temp_min": 16.78,
            "temp_max": 16.78,
            "pressure": 1016,
            "sea_level": 1016,
            "grnd_level": 1003,
            "humidity": 58,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 83},
          "wind": {"speed": 6.03, "deg": 255, "gust": 7.33},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-28 12:00:00"
        },
        {
          "dt": 1719586800,
          "main": {
            "temp": 18.09,
            "feels_like": 17.42,
            "temp_min": 18.09,
            "temp_max": 18.09,
            "pressure": 1016,
            "sea_level": 1016,
            "grnd_level": 1004,
            "humidity": 56,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 54},
          "wind": {"speed": 5.9, "deg": 247, "gust": 7.24},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-28 15:00:00"
        },
        {
          "dt": 1719597600,
          "main": {
            "temp": 16.24,
            "feels_like": 15.75,
            "temp_min": 16.24,
            "temp_max": 16.24,
            "pressure": 1017,
            "sea_level": 1017,
            "grnd_level": 1004,
            "humidity": 70,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 802,
              "main": "Clouds",
              "description": "scattered clouds",
              "icon": "03d"
            }
          ],
          "clouds": {"all": 33},
          "wind": {"speed": 5.03, "deg": 232, "gust": 6.29},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-28 18:00:00"
        },
        {
          "dt": 1719608400,
          "main": {
            "temp": 11.02,
            "feels_like": 10.4,
            "temp_min": 11.02,
            "temp_max": 11.02,
            "pressure": 1017,
            "sea_level": 1017,
            "grnd_level": 1004,
            "humidity": 85,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04n"
            }
          ],
          "clouds": {"all": 54},
          "wind": {"speed": 3.41, "deg": 231, "gust": 6.96},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-28 21:00:00"
        },
        {
          "dt": 1719619200,
          "main": {
            "temp": 9.22,
            "feels_like": 7.4,
            "temp_min": 9.22,
            "temp_max": 9.22,
            "pressure": 1016,
            "sea_level": 1016,
            "grnd_level": 1003,
            "humidity": 88,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 803,
              "main": "Clouds",
              "description": "broken clouds",
              "icon": "04n"
            }
          ],
          "clouds": {"all": 68},
          "wind": {"speed": 3.3, "deg": 226, "gust": 7.3},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-29 00:00:00"
        },
        {
          "dt": 1719630000,
          "main": {
            "temp": 8.77,
            "feels_like": 6.87,
            "temp_min": 8.77,
            "temp_max": 8.77,
            "pressure": 1015,
            "sea_level": 1015,
            "grnd_level": 1002,
            "humidity": 91,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04n"
            }
          ],
          "clouds": {"all": 97},
          "wind": {"speed": 3.28, "deg": 212, "gust": 7.77},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-29 03:00:00"
        },
        {
          "dt": 1719640800,
          "main": {
            "temp": 11.58,
            "feels_like": 11.01,
            "temp_min": 11.58,
            "temp_max": 11.58,
            "pressure": 1014,
            "sea_level": 1014,
            "grnd_level": 1001,
            "humidity": 85,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 94},
          "wind": {"speed": 3.71, "deg": 220, "gust": 7.52},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-29 06:00:00"
        },
        {
          "dt": 1719651600,
          "main": {
            "temp": 16.42,
            "feels_like": 15.89,
            "temp_min": 16.42,
            "temp_max": 16.42,
            "pressure": 1013,
            "sea_level": 1013,
            "grnd_level": 1000,
            "humidity": 68,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 94},
          "wind": {"speed": 4.75, "deg": 214, "gust": 6.21},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-29 09:00:00"
        },
        {
          "dt": 1719662400,
          "main": {
            "temp": 18.94,
            "feels_like": 18.51,
            "temp_min": 18.94,
            "temp_max": 18.94,
            "pressure": 1010,
            "sea_level": 1010,
            "grnd_level": 997,
            "humidity": 62,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 97},
          "wind": {"speed": 4.03, "deg": 221, "gust": 5.12},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-29 12:00:00"
        },
        {
          "dt": 1719673200,
          "main": {
            "temp": 20.33,
            "feels_like": 20.09,
            "temp_min": 20.33,
            "temp_max": 20.33,
            "pressure": 1008,
            "sea_level": 1008,
            "grnd_level": 995,
            "humidity": 64,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 4.54, "deg": 240, "gust": 5.29},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-29 15:00:00"
        },
        {
          "dt": 1719684000,
          "main": {
            "temp": 16.13,
            "feels_like": 15.86,
            "temp_min": 16.13,
            "temp_max": 16.13,
            "pressure": 1007,
            "sea_level": 1007,
            "grnd_level": 994,
            "humidity": 79,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 4.31, "deg": 261, "gust": 8.05},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-29 18:00:00"
        },
        {
          "dt": 1719694800,
          "main": {
            "temp": 13.87,
            "feels_like": 13.71,
            "temp_min": 13.87,
            "temp_max": 13.87,
            "pressure": 1006,
            "sea_level": 1006,
            "grnd_level": 993,
            "humidity": 92,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04n"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 3.11, "deg": 247, "gust": 7.38},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-29 21:00:00"
        },
        {
          "dt": 1719705600,
          "main": {
            "temp": 13.78,
            "feels_like": 13.62,
            "temp_min": 13.78,
            "temp_max": 13.78,
            "pressure": 1005,
            "sea_level": 1005,
            "grnd_level": 992,
            "humidity": 92,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04n"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 3.14, "deg": 256, "gust": 6.04},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-30 00:00:00"
        },
        {
          "dt": 1719716400,
          "main": {
            "temp": 13,
            "feels_like": 12.89,
            "temp_min": 13,
            "temp_max": 13,
            "pressure": 1005,
            "sea_level": 1005,
            "grnd_level": 992,
            "humidity": 97,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10n"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 3.01, "deg": 295, "gust": 4.98},
          "visibility": 10000,
          "pop": 0.77,
          "rain": {"3h": 0.42},
          "sys": {"pod": "n"},
          "dt_txt": "2024-06-30 03:00:00"
        },
        {
          "dt": 1719727200,
          "main": {
            "temp": 10.39,
            "feels_like": 9.81,
            "temp_min": 10.39,
            "temp_max": 10.39,
            "pressure": 1005,
            "sea_level": 1005,
            "grnd_level": 992,
            "humidity": 89,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 3.87, "deg": 314, "gust": 7.91},
          "visibility": 10000,
          "pop": 0.12,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-30 06:00:00"
        },
        {
          "dt": 1719738000,
          "main": {
            "temp": 10.73,
            "feels_like": 10.16,
            "temp_min": 10.73,
            "temp_max": 10.73,
            "pressure": 1006,
            "sea_level": 1006,
            "grnd_level": 993,
            "humidity": 88,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10d"
            }
          ],
          "clouds": {"all": 100},
          "wind": {"speed": 3.34, "deg": 321, "gust": 7.05},
          "visibility": 10000,
          "pop": 0.37,
          "rain": {"3h": 0.17},
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-30 09:00:00"
        },
        {
          "dt": 1719748800,
          "main": {
            "temp": 15.72,
            "feels_like": 15.1,
            "temp_min": 15.72,
            "temp_max": 15.72,
            "pressure": 1005,
            "sea_level": 1005,
            "grnd_level": 993,
            "humidity": 67,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 95},
          "wind": {"speed": 3.33, "deg": 278, "gust": 5.45},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-30 12:00:00"
        },
        {
          "dt": 1719759600,
          "main": {
            "temp": 14.77,
            "feels_like": 14.13,
            "temp_min": 14.77,
            "temp_max": 14.77,
            "pressure": 1005,
            "sea_level": 1005,
            "grnd_level": 993,
            "humidity": 70,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
            }
          ],
          "clouds": {"all": 99},
          "wind": {"speed": 5.37, "deg": 270, "gust": 7.02},
          "visibility": 10000,
          "pop": 0,
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-30 15:00:00"
        },
        {
          "dt": 1719770400,
          "main": {
            "temp": 12.65,
            "feels_like": 12.06,
            "temp_min": 12.65,
            "temp_max": 12.65,
            "pressure": 1006,
            "sea_level": 1006,
            "grnd_level": 993,
            "humidity": 80,
            "temp_kf": 0
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10d"
            }
          ],
          "clouds": {"all": 98},
          "wind": {"speed": 4.61, "deg": 271, "gust": 9.04},
          "visibility": 10000,
          "pop": 0.6,
          "rain": {"3h": 0.54},
          "sys": {"pod": "d"},
          "dt_txt": "2024-06-30 18:00:00"
        }
      ],
      "city": {
        "id": 2637827,
        "name": "Silverstone",
        "coord": {"lat": 52.0922, "lon": -1.026},
        "country": "GB",
        "population": 1742,
        "timezone": 3600,
        "sunrise": 1719287082,
        "sunset": 1719347326
      }
    };
  }
}
