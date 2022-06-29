import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = 'http://localhost:8000/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  getDataSaved(username) async {
    var fullUrl = _url + "saved" + await _getToken() + username; 
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  putData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.put(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  deleteData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.delete(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}
