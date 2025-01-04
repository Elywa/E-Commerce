import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import 'get_product_entity.dart';

@immutable
class ProductsResponseEntity {
  final int? results;
  final List<GetProductEntity>? data;

  const ProductsResponseEntity({this.results, this.data});
}
