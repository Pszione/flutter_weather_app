abstract class IHttpClient {
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });

  Future<T> post<T>(
    String path, {
    dynamic data,
    dynamic params,
  });

  Future<T> put<T>(String path, dynamic data);

  Future<T> delete<T>(String path, dynamic data);
}
