import 'dart:convert';

import 'package:nt_sample/data/model/nt_new_model.dart';
import 'package:nt_sample/services/api-service.dart';
import 'package:nt_sample/services/http_service.dart';

class HomeRepository {

  static final HttpHelper _http = HttpHelper();
  ///Home Details
  Future<dynamic> getHomeDetails() async {
    var response = await _http.get(Api.getNews);
    if (response.runtimeType.toString() == "Response") {
      NewsModel data = NewsModel.fromJson(jsonDecode(response.body));
      return data;
    }
    return response;
  }


}