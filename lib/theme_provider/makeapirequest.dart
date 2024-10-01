import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:training/api/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:training/api/constant.dart';
import 'package:training/modul/pretty_face.dart';
part 'makeapirequest.g.dart';

@riverpod
Future<PrettyFace> getApiRequest(GetApiRequestRef ref) async {
  try {
    final Response response = await APIService.instance.request(
      BASE_URL,
      DioMethod.get,
      // param: {'fact': fact, 'lenght': length},
      contentType: APPLICATION_JSON,
    );
    print(response.data);
    if (response.statusCode == 200) {
      var states =
          response.data; //jsonDecode(response.data) as Map<String, dynamic>;
      var stated = PrettyFace.fromJson(states);
      //var state = {"lenght": stated.lenghts, "face": stated.face};

      return stated;
    }
    throw "something went wrong";
  } catch (e) {
    print(e);
    rethrow;
  }
}
