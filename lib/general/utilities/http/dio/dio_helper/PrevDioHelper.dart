part of 'DioImports.dart';

class PrevDioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  BuildContext context;
  final bool? forceRefresh;
  static late String _branch;
  static late String _branchKey;
  static late String baseUrl;

  static init({required String base, String? branch, String? branchKey}){
    baseUrl=base;
    _branch = branch??"1";
    _branchKey = branchKey??"branchId";
  }

  PrevDioHelper({ this.forceRefresh = true,required this.context}){
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: "application/json"),
    )
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(responseBody: true,requestBody: true,logPrint: (data)=>log(data.toString())));
  }

  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(
        CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }

  Options _buildCacheOptions(Map<String, dynamic> body, {bool subKey = true}) {
    return buildCacheOptions(
      Duration(days: 3),
      maxStale: Duration(days: 7),
      forceRefresh: forceRefresh,
      subKey: subKey ? json.encode(body) : "",
      options: Options(extra: {}),
    );
  }

  Future<dynamic> get({required String url}) async {
    _dio.options.headers = await _getHeader();
    try {
      var response = await _dio.get("$url", options: _buildCacheOptions({"url":url}));
      print("response ${response.statusCode}");

      var data = response.data;
      if (data["key"] == "success") {
        return data;
      } else {
        CustomToast.showToastNotification(data["msg"].toString());
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301|| e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        CustomToast.showToastNotification("chick internet");
      }
    }
    return null;
  }

  Future<dynamic> post({required String url,required Map<String, dynamic> body,bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    body.addAll({_branchKey: _branch});
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();
    try {
      var response =
          await _dio.post("$url", data: FormData.fromMap(body));
      print("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      CustomToast.showToastNotification(response.data["msg"].toString());
      if (response.data["key"] == "success") return response.data;
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301|| e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        CustomToast.showToastNotification("chick internet");
      }
    }

    return null;
  }

  Future<dynamic> uploadFile(
      {required String url, required Map<String, dynamic> body,bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    body.addAll({_branchKey: _branch});
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              "$key",
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post("$url", data: formData);
      print("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      CustomToast.showToastNotification(response.data["msg"].toString());
      if (response.data["key"] == "success") return response.data;
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301|| e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        CustomToast.showToastNotification("chick internet");
      }
    }

    return null;
  }

  Future<dynamic> uploadChatFile(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    body.addAll({_branchKey: _branch});
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              "$key",
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post("$url",
          data: formData, options: _buildCacheOptions(body, subKey: false));
      print("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.data["key"] == "success") return response.data;
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301|| e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        CustomToast.showToastNotification("chick internet");
      }
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    print(
        "-------------------------------------------------------------------");
    log("$body");
    print(
        "-------------------------------------------------------------------");
  }

  _getHeader() async {
    String token = GlobalState.instance.get("token");
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }


  void tokenExpired()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Nav.navigateTo( Login(), navigatorType: NavigatorType.push);
  }
}

