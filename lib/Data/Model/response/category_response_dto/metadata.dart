import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  const Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> data) => Metadata(
        currentPage: data['currentPage'] as int?,
        numberOfPages: data['numberOfPages'] as int?,
        limit: data['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'numberOfPages': numberOfPages,
        'limit': limit,
      };
}
