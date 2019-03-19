import 'dart:async';

class ResultDao {
  var data;
  bool result;
  Future next;

  ResultDao(this.data, this.result, {this.next});
}