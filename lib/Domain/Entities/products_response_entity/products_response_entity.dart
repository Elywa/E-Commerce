import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'product_entity.dart';

@immutable
class ProductsResponseEntity {
  final int? results;
  final List<ProductEntity>? data;

  const ProductsResponseEntity({this.results, this.data});
}
