import 'package:ecommerce_app/domain/entites/product_response_entity.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto(
      {super.results,
      super.metadata,
      super.data,
      this.message,
      this.statusMsg});

  String? message;
  String? statusMsg;

  ProductResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? ProductMetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDataDto.fromJson(v));
      });
    }
  }
}

class ProductDataDto extends ProductDataEntity {
  ProductDataDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
  });

  ProductDataDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(ProductSubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? ProductCategoryDto.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? ProductBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
}

class ProductBrandDto extends ProductBrandEntity {
  ProductBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  ProductBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class ProductCategoryDto extends ProductCategoryEntity {
  ProductCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  ProductCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class ProductSubcategoryDto extends ProductSubcategoryEntity {
  ProductSubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  ProductSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class ProductMetadataDto extends ProductMetadataEntity {
  ProductMetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  ProductMetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}
