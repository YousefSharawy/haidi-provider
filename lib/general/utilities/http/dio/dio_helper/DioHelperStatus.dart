part of 'DioImports.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  BuildContext context;
  final bool forceRefresh;
  static late String _branch;
  static late String _branchKey;
  static late String baseUrl;
  // static late Map<String,String> headers;

  static init({required String base, String? branch, String? branchKey}) {
    baseUrl = base;
    _branch = branch ?? "1";
    _branchKey = branchKey ?? "branchId";
  }

  DioHelper({this.forceRefresh = true, required this.context}) {
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: "application/x-www-form-urlencoded; charset=utf-8"
          // contentType: "application/json"
          ),
    )
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (data) => log(data.toString())));
  }

  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(
        CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }

  Options _buildCacheOptions() {
    return buildCacheOptions(
      Duration(days: 3),
      maxStale: Duration(days: 7),
      forceRefresh: forceRefresh,
      options: Options(extra: {}),
    );
  }

  Future<dynamic> get(
      {required String url, Map<String, dynamic>? query}) async {
    _dio.options.headers = DioUtils.header ?? await _getHeader();
    try {
      var response = await _dio.get("$url",
          queryParameters: query, options: _buildCacheOptions());
      log("response ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      showErrorMessage(e.response);
    }
    return null;
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    bool showLoader = true,
    Map<String, dynamic>? query,
     Map<String, dynamic>? headers,
  }) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
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
      }
    });

    _dio.options.headers =headers?? await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post("$url",
          data: haveFile ? formData : body, queryParameters: query);
      log("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }
    return null;
  }

  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> body,
      bool showLoader = true,
      Map<String, dynamic>? query}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
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
      }
    });

    _dio.options.headers = DioUtils.header ?? await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.put("$url",
          data: haveFile ? formData : body, queryParameters: query);
      log("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> patch(
      {required String url,
      required Map<String, dynamic> body,
      bool showLoader = true,
      Map<String, dynamic>? query}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = DioUtils.header ?? await _getHeader();
    try {
      var response =
          await _dio.patch("$url", data: body, queryParameters: query);
      log("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> delete(
      {required String url,
      required Map<String, dynamic> body,
      bool showLoader = true,
      Map<String, dynamic>? query}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = DioUtils.header ?? await _getHeader();
    try {
      var response =
          await _dio.delete("$url", data: body, queryParameters: query);
      log("body response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
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

    _dio.options.headers = DioUtils.header ?? await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post("$url", data: formData);
      log("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    log("-------------------------------------------------------------------");
    log("$body");
    log("-------------------------------------------------------------------");
  }

  showErrorMessage(Response? response) {
    if (response == null) {
      log("failed response Check Server");
      CustomToast.showToastNotification("Check Server");
    } else {
      log("failed response ${response.statusCode}");
      log("failed response ${response.data}");
      var data = response.data;
      if (data is String) data = json.decode(response.data);
      switch (response.statusCode) {
        case 500:
          CustomToast.showToastNotification(data["msg"].toString());
          break;
        case 400:
          if (data["errors"] != null) {
            Map<String, dynamic> errors = data["errors"];
            log("response errors $errors");
            errors.forEach((key, value) {
              List<String> lst = List<String>.from(value.map((e) => e));
              lst.forEach((e) {
                CustomToast.showToastNotification(e);
              });
            });
          } else {
            CustomToast.showToastNotification(data["msg"].toString());
          }
          break;
        case 401:
        // CustomToast.showToastNotification(data["msg"].toString());
        // log('msgsssssssssssssssssssssssssssssssssssssssss${data["msg"]}');
        // break;
        case 301:
        case 302:
          tokenExpired();
          break;
      }
    }
  }

  _getHeader() async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    String? token = GlobalState.instance.get("token");
    return {
      // 'Accept-Language': '${DioUtils.lang}',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void tokenExpired() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Nav.navigateTo( Login(), navigatorType: NavigatorType.push);
  }
}
