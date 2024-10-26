import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

@immutable
class CategoryEntity {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const CategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
}
