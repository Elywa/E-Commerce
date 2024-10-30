import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:flutter/material.dart';

import 'category_or_brands_entity.dart';

@immutable
class CategoryOrBrandsResponseEntity {
  final int? results;

  final List<CategoryOrBrandsEntity>? data;

  const CategoryOrBrandsResponseEntity({this.results, this.data});
}
