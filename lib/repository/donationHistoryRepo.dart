import 'dart:convert';
import 'dart:io';
import 'package:agari_doner/models/donationHistory.dart';
import 'package:http/http.dart' as http;

class DontionHistoryRepo {
  Future<dynamic> get() async{
    try{
        final result = await InternetAddress.lookup('google.com');

        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          var response;

          response = await http.get(
            "https://agari-api.herokuapp.com/donation/my",
            headers: {
              "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJiaW4iLCJzdWIiOiI1ZWEzMjk4NGIzNDQ2MTAwMTdmZjI1OWUiLCJpYXQiOjE1ODg2ODMzODE0NzB9.oXLix8lzlVNknYrpMRSy2FBgZRr551gq3knJxWtneLg"
            }
          );

          var jsonResponse;
          jsonResponse = jsonDecode(response.body);

          DonationHistoryModel donationHistoryModel = DonationHistoryModel();
          donationHistoryModel.
        }
    }
    on SocketException catch (_) {
      return "no internet";
    } 
  }
}