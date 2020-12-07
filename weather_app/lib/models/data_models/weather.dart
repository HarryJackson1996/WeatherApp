// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    Weather({
        this.coord,
        this.weather,
        this.base,
        this.main,
        this.visibility,
        this.wind,
        this.rain,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod,
    });

    Coord coord;
    List<WeatherElement> weather;
    String base;
    Main main;
    int visibility;
    Wind wind;
    Rain rain;
    Clouds clouds;
    int dt;
    Sys sys;
    int timezone;
    int id;
    String name;
    int cod;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coord: json["coord"] != null ? Coord.fromJson(json["coord"]) : null,
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
        base: json["base"] != null ? json["base"] : null,
        main: json["main"] != null ? Main.fromJson(json["main"]) : null,
        visibility: json["visibility"] != null ? json["visibility"] : null,
        wind: json["wind"] != null ? Wind.fromJson(json["wind"]) : null,
        rain: json["rain"] != null ? Rain.fromJson(json["rain"]) : null,
        clouds: json["clouds"] != null ? Clouds.fromJson(json["clouds"]) : null,
        dt: json["dt"] != null ? json["dt"] : null,
        sys: json["sys"] != null ? Sys.fromJson(json["sys"]) : null,
        timezone: json["timezone"] != null ? json["timezone"] : null,
        id: json["id"] != null ? json["id"] : null,
        name: json["name"] != null ? json["name"] : null,
        cod: json["cod"] != null ? json["cod"] : null,
    );

    Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "rain": rain.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

class Clouds {
    Clouds({
        this.all,
    });

    int all;

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class Coord {
    Coord({
        this.lon,
        this.lat,
    });

    double lon;
    double lat;

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
    };
}

class Main {
    Main({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
    });

    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;
    int pressure;
    int humidity;

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
    };
}

class Rain {
    Rain({
        this.the1H,
    });

    double the1H;

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"].toDouble() != null ? json["1h"].toDouble() : null,
    );

    Map<String, dynamic> toJson() => {
        "1h": the1H,
    };
}

class Sys {
    Sys({
        this.type,
        this.id,
        this.country,
        this.sunrise,
        this.sunset,
    });

    int type;
    int id;
    String country;
    int sunrise;
    int sunset;

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class WeatherElement {
    WeatherElement({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}

class Wind {
    Wind({
        this.speed,
        this.deg,
    });

    double speed;
    int deg;

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
    };
}
