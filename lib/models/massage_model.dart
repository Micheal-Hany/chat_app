// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class Massage {
  final String massage;
  final String id;

  Massage(
    this.massage,
    this.id,
  );
  factory Massage.fromJson(JsonData) {
    return Massage(
      JsonData['massage'],
      JsonData['id'],
    );
  }
}
