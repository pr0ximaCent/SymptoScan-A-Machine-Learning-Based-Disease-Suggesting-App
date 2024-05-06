// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:symptoscan/api/listofdisease.dart';

Future<List<Disease>> get_disease(String symptoms_text) async {
  const url =
      'https://api-inference.huggingface.co/models/shanover/symps_disease_bert_v3_c41';
  final response = await http.post(Uri.parse(url),
      body: json.encode({'inputs': symptoms_text}),
      headers: {'Content-Type': 'application/json'});
  final responseData = json.decode(response.body);
  List<Disease> result = [];
  for (int i = 0; i < min(responseData[0].length, 3); i++) {
    int idx = int.parse(responseData[0][i]['label'].split('_')[1]);
    double score = responseData[0][i]['score'];
    // print('${disease_list.list_of_disease[idx]} ${(score * 100).toStringAsFixed(2)}');
    result.add(Disease(
        disease: list_of_disease[idx],
        score: (score * 100).toStringAsFixed(2)));
  }
  return result;
}

class Disease {
  final String disease;
  final String score;
  Disease({required this.disease, required this.score});
}
