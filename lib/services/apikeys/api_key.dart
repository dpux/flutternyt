class ApiKey{
  final String apiKey;

  ApiKey({this.apiKey = ""});

  factory ApiKey.fromJson(Map<String, dynamic> jsonMap, String apiName){
    return new ApiKey(apiKey: jsonMap[apiName]);
  }


}