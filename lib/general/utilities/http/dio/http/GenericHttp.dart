import 'package:base_flutter/general/utilities/http/dio/dio_helper.dart';import 'package:base_flutter/general/utilities/http/dio/mock/mock_api.dart';
import 'package:base_flutter/general/utilities/http/dio/utils/DioUtils.dart';
import 'package:flutter/material.dart';

enum ReturnType { Model, List, Type }
enum MethodType { Get, Post, Put, Patch, Delete }

class GenericHttp<T> {
  final BuildContext context;

  GenericHttp(this.context);

  Future<dynamic> callApi(
      {required ReturnType returnType,
      required MethodType methodType,
      required String name,
      Function(dynamic data)? returnDataFun,
      Map<String, dynamic>? jsonBody,
        Map<String, dynamic>? query ,
        Map<String, dynamic>? headers ,
        bool? showLoader,
      Function(dynamic data)? toJsonFunc,
      bool refresh = true}) async {
    var dataJson = jsonBody ?? {};

    switch (methodType) {
      case MethodType.Get:
        return _getData(
            name: name,
            query: query,
            returnType: returnType,
            refresh: refresh,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc,
            json: dataJson);
      case MethodType.Post:
        return _postData(
            name: name,
            returnType: returnType,
            json: dataJson,
            query: query,
            headers: headers,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Patch:
        return _patchData(
            name: name,
            query: query,
            returnType: returnType,
            json: dataJson,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Put:
        return _putData(
            name: name,
            returnType: returnType,
            json: dataJson,
            query: query,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
      case MethodType.Delete:
        return _deleteData(
            name: name,
            returnType: returnType,
            json: dataJson,
            query: query,
            showLoader: showLoader,
            dataKeyFun: returnDataFun,
            toJsonFunc: toJsonFunc);
    }
  }

  Future<dynamic> _getData({
    required ReturnType returnType,
    Map<String, dynamic> json = const {},
    Map<String, dynamic>? query ,
    required String name,
    Function(dynamic data)? dataKeyFun,
    bool refresh = true,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = MockApi.enabled ? null : await DioHelper(context: context, forceRefresh: refresh).get(
      url: name,  query: query,
    );
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }
  Future<dynamic> _postData({
    required ReturnType returnType,
    required String name,
    Map<String, dynamic>? query ,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    Map<String, dynamic>? headers ,
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = MockApi.enabled ? null : await DioHelper(
      context: context,
    ).post(url: name, body: json, showLoader: showLoader ?? true,query: query,headers: headers);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  Future<dynamic> _putData({
    Map<String, dynamic>? query ,
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = MockApi.enabled ? null : await DioHelper(
      context: context,
    ).put(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  Future<dynamic> _patchData({
    Map<String, dynamic>? query ,
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = MockApi.enabled ? null : await DioHelper(
      context: context,
    ).patch(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  Future<dynamic> _deleteData({
    Map<String, dynamic>? query ,
    required ReturnType returnType,
    required String name,
    Function(dynamic data)? dataKeyFun,
    Map<String, dynamic> json = const {},
    bool? showLoader,
    Function(dynamic data)? toJsonFunc,
  }) async {
    var data = MockApi.enabled ? null : await DioHelper(
      context: context,
    ).delete(url: name, body: json, showLoader: showLoader ?? true);
    return _returnDataFromType(
        data, returnType, toJsonFunc ?? (val) {}, dataKeyFun);
  }

  dynamic _returnDataFromType(
    dynamic data,
    ReturnType returnType,
    Function(dynamic data) toJsonFunc,
    Function(dynamic data)? dataKeyFun,
  ) async {
    try {
      // DEMO/OFFLINE MODE: while enabled, build models directly from placeholder
      // records (bypassing each endpoint's returnDataFun, since some return a
      // bare list and others a {data:[...]} wrapper) so content renders no matter
      // the shape. Auto-bypassed once a real backend responds and enabled=false.
      if (MockApi.enabled) {
        switch (returnType) {
          case ReturnType.List:
            return List<T>.from(
                MockApi.list().map((e) => Function.apply(toJsonFunc, [e])));
          case ReturnType.Model:
            return Function.apply(toJsonFunc, [MockApi.item()]);
          case ReturnType.Type:
            data = MockApi.bodyFor(ReturnType.Type);
            break;
        }
      }
      switch (returnType) {
        case ReturnType.Type:
          return dataKeyFun == null ? data : Function.apply(dataKeyFun, [data]);
        case ReturnType.Model:
          final modelSource =
              dataKeyFun == null ? data : Function.apply(dataKeyFun, [data]);
          // Crash-proof: feed an empty map (not null) so fromJson yields an
          // empty model instead of throwing on an offline/null response.
          return Function.apply(
              toJsonFunc, [modelSource ?? <String, dynamic>{}]);
        case ReturnType.List:
          final listSource =
              dataKeyFun == null ? data : Function.apply(dataKeyFun, [data]);
          // Guard the .map so a null/offline response yields an empty list.
          return List<T>.from(
            (listSource as Iterable?)
                    ?.map((e) => Function.apply(toJsonFunc, [e])) ??
                const [],
          );
      }
    } catch (_) {
      // Last-resort: any parse failure (offline/null/shape mismatch) degrades
      // to a safe empty value instead of an unhandled exception.
      switch (returnType) {
        case ReturnType.List:
          return <T>[];
        case ReturnType.Model:
          return Function.apply(toJsonFunc, [<String, dynamic>{}]);
        case ReturnType.Type:
          return null;
      }
    }
  }
}
