import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:e_commerce/Domain/Entities/category_response_entity/category_response_entity.dart';
import 'package:flutter/material.dart';

import 'category_dto.dart';
import 'metadata.dart';

@immutable
class CategoryResponseDto extends CategoryResponseEntity {
  final Metadata? metadata;

  const CategoryResponseDto({super.results, this.metadata, super.data});

  factory CategoryResponseDto.fromJson(Map<String, dynamic> data) {
    return CategoryResponseDto(
      results: data['results'] as int?,
      metadata: data['metadata'] == null
          ? null
          : Metadata.fromJson(data['metadata'] as Map<String, dynamic>),
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => CategorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }


}
