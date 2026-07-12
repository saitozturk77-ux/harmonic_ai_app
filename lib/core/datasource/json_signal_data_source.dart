import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/signal_model.dart';
import 'signal_data_source.dart';

class JsonSignalDataSource implements SignalDataSource {
  const JsonSignalDataSource();

  @override
  Future<List<SignalModel>> loadSignals() async {
    final jsonString =
        await rootBundle.loadString('assets/demo/signals.json');

    final List<dynamic> jsonList = json.decode(jsonString);

    return jsonList
        .map(
          (item) => SignalModel.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}