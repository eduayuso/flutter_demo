import 'package:flutter_rest_demo/data/access/cache/CacheData.dart';
import 'package:flutter_rest_demo/data/access/remote/RemoteData.dart';

class DataManager {

  CacheData cache;
  RemoteData remote;

  DataManager() {
    this.cache = CacheData();
    this.remote = RemoteData();
  }
}