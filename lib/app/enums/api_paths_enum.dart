enum ApiPaths { search, forecast, current }

extension ApiPathsExtension on ApiPaths {
  String get path {
    switch (this) {
      case ApiPaths.search:
        return "/search.json";
      case ApiPaths.forecast:
        return "/forecast.json";
      case ApiPaths.current:
        return "/current.json";

      default:
        return "";
    }
  }
}
