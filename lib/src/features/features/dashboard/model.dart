class DetailsModel {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? frgnName;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  int? brandId;
  dynamic unit;
  int? minQty;
  int? refundable;
  dynamic digitalProductType;
  dynamic digitalFileReady;
  dynamic images;
  dynamic thumbnail;
  dynamic featured;
  dynamic flashDeal;
  dynamic videoProvider;
  dynamic videoUrl;
  List<dynamic>? colors;
  int? variantProduct;
  List<dynamic>? attributes;
  List<dynamic>? choiceOptions;
  List<dynamic>? variation;
  int? published;
  double? unitPrice;
  int? purchasePrice;
  int? tax;
  dynamic taxType;
  int? discount;
  dynamic discountType;
  int? currentStock;
  dynamic usedQuantity;
  int? minimumOrderQty;
  String? details;
  int? freeShipping;
  dynamic attachment;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int? requestStatus;
  dynamic deniedNote;
  int? shippingCost;
  dynamic multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String? code;
  String? codeBars;
  dynamic onHand;
  dynamic uCategory;
  dynamic uSubgroup;
  String? uAndi;
  String? uSp1;
  String? uSp2;
  String? uSp3;
  String? uSp4;
  String? uSp5;
  String? uSp6;
  String? uAc1;
  String? uAc2;
  String? uAc3;
  String? uAc4;
  String? uAc5;
  String? uAc6;
  String? uAc7;
  String? uF1;
  String? uF2;
  String? uF3;
  String? uF4;
  String? uF5;
  String? uF6;
  String? uF7;
  String? uF8;
  String? uF9;
  String? uF10;
  String? uF11;
  String? uNsp1;
  String? uNpo;
  String? uCfspc;
  String? uEsp;
  String? uOrg;
  String? uBn;
  String? uRs;
  String? uPrs;
  String? uAlt;
  String? uCfp;
  String? uCpn;
  String? uStoragetype;
  String? uColors;
  int? reviewsCount;
  List<Translations>? translations;
  List<dynamic>? reviews;

  DetailsModel({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.frgnName,
    this.slug,
    this.productType,
    this.categoryIds,
    this.brandId,
    this.unit,
    this.minQty,
    this.refundable,
    this.digitalProductType,
    this.digitalFileReady,
    this.images,
    this.thumbnail,
    this.featured,
    this.flashDeal,
    this.videoProvider,
    this.videoUrl,
    this.colors,
    this.variantProduct,
    this.attributes,
    this.choiceOptions,
    this.variation,
    this.published,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.currentStock,
    this.usedQuantity,
    this.minimumOrderQty,
    this.details,
    this.freeShipping,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.requestStatus,
    this.deniedNote,
    this.shippingCost,
    this.multiplyQty,
    this.tempShippingCost,
    this.isShippingCostUpdated,
    this.code,
    this.codeBars,
    this.onHand,
    this.uCategory,
    this.uSubgroup,
    this.uAndi,
    this.uSp1,
    this.uSp2,
    this.uSp3,
    this.uSp4,
    this.uSp5,
    this.uSp6,
    this.uAc1,
    this.uAc2,
    this.uAc3,
    this.uAc4,
    this.uAc5,
    this.uAc6,
    this.uAc7,
    this.uF1,
    this.uF2,
    this.uF3,
    this.uF4,
    this.uF5,
    this.uF6,
    this.uF7,
    this.uF8,
    this.uF9,
    this.uF10,
    this.uF11,
    this.uNsp1,
    this.uNpo,
    this.uCfspc,
    this.uEsp,
    this.uOrg,
    this.uBn,
    this.uRs,
    this.uPrs,
    this.uAlt,
    this.uCfp,
    this.uCpn,
    this.uStoragetype,
    this.uColors,
    this.reviewsCount,
    this.translations,
    this.reviews,
  });

  DetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    frgnName = json['frgn_name'];
    slug = json['slug'];
    productType = json['product_type'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(CategoryIds.fromJson(v));
      });
    }
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    digitalProductType = json['digital_product_type'];
    digitalFileReady = json['digital_file_ready'];
    images = json['images'];
    thumbnail = json['thumbnail'];
    featured = json['featured'];
    flashDeal = json['flash_deal'];
    videoProvider = json['video_provider'];
    videoUrl = json['video_url'];
    if (json['colors'] != null) {
      colors = <dynamic>[];
      json['colors'].forEach((v) {
        colors!.add(v);
      });
    }
    variantProduct = json['variant_product'];
    if (json['attributes'] != null) {
      attributes = <dynamic>[];
      json['attributes'].forEach((v) {
        attributes!.add(v);
      });
    }
    if (json['choice_options'] != null) {
      choiceOptions = <dynamic>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(v);
      });
    }
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  factory CategoryIds.fromJson(Map<String, dynamic> json) {
    return CategoryIds(
      id: json['id'],
      position: json['position'],
    );
  }
}

class Translations {
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;
  int? id;

  Translations({
    this.translationableType,
    this.translationableId,
    this.locale,
    this.key,
    this.value,
    this.id,
  });
}