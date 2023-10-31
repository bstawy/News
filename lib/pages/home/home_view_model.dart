import 'package:flutter/material.dart';
import 'package:news/core/network_layer/api_manager.dart';

import '../../models/source_model.dart';

class HomeViewModel extends ChangeNotifier{

  List<Source> _sourcesList = [];

  List<Source> get sourcesList => _sourcesList;

  getSource(String categoryId) async {

    try{
      var response = await ApiManager.fetchSources(categoryId);

      if(response.status == "ok") {
        _sourcesList = response.sources;
        notifyListeners();
      }
    } catch(e) {
      print(e.toString());
    }

  }


}