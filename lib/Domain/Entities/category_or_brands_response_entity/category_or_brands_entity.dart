import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class CategoryOrBrandsEntity {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const CategoryOrBrandsEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
