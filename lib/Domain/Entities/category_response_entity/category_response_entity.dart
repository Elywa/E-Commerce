import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'category_entity.dart';

@immutable
class CategoryResponseEntity {
  final int? results;

  final List<CategoryEntity>? data;

  const CategoryResponseEntity({this.results, this.data});
}
