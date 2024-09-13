class CategoryResponseEntity {
  CategoryResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  int? results;
  MetadataEntity? metadata;
  List<CategoryDataEntity>? data;
}

class CategoryDataEntity {
  CategoryDataEntity({
    this.id,
    this.name,
    this.slug, //search by kelma mo3yna
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
