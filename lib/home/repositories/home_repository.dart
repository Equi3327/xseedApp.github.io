class HomeRepository {
  HomeRepository();
  // Future<CgmDataDetails?> getCGMDetails(int date, String userID) async {
  //   String url = "$baseUrl/smartscale/v1/cgm/data_details";
  //
  //   try {
  //     final queryParameter = {'date': date, 'user_id': userID};
  //     final Response response =
  //     await _dio.get(url, queryParameters: queryParameter);
  //     if (response.statusCode == 200) {
  //       var data = response.data['message']['data'];
  //       print("Cgm data  :: $data");
  //       CgmDataDetails cgmDataDetails = CgmDataDetails.fromJson(data);
  //       print("Cgm data details :: $cgmDataDetails");
  //       return cgmDataDetails;
  //     }
  //   } catch (e) {
  //     print("Error in getting cgm data details");
  //   }
  //   return null;
  // }
}