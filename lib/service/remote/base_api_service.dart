abstract class BaseApiService{
  Future<dynamic> getMethod(String url);
  Future<dynamic> getMethodWithQuery(String url, Map<String, dynamic> query);
  Future<dynamic> postMethod(String url, Map<String, dynamic> body);
}