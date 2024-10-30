import 'package:e_commerce/Domain/Entities/products_response_entity/subcategory_entity.dart';

class SubcategoryDto  extends Subcategory{
  SubcategoryDto();

  factory SubcategoryDto.fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError('Subcategory.fromJson($json) is not implemented');
  }

  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
