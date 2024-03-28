import 'package:get/get.dart';
import 'package:notification/core/api_factory/api.dart';
import 'package:notification/core/api_factory/api_end_points.dart';
import 'package:notification/src/home/models/category_model.dart';
import 'package:notification/src/home/models/item_model.dart';

class HomeController extends GetxController {
  _getCategoriesList() {
    Api.request(
      path: ApiEndPoints.categories,
      params: {},
      onResponse: (response) async {
        categories = List<CategoryModel>.from(
          response.map(
            (e) => CategoryModel.fromJson(e),
          ),
        );

        if (categories.isEmpty) return;

        selectedCategories = categories.first.category ?? '';

        print("Response avi gyo : ${categories.first.category}");
        _getItemData(categories.first.data ?? '');
        update();
      },
    );
  }

  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  set categories(List<CategoryModel> value) {
    _categories = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _getCategoriesList();
  }

  String selectedCategories = '';

  bool isItemContain(String element) {
    return selectedCategories == element;
  }

  selectItem(CategoryModel category) {
    selectedCategories = category.category ?? '';
    _getItemData(category.data ?? '');

    update();
  }

  List<Item> _items = [];

  List<Item> get items => _items;

  set items(List<Item> value) {
    _items = value;
    update();
  }

  _getItemData(String path, {bool isRemoving = false}) {
    items.clear();
    Api.request(
      path: path,
      params: {},
      onResponse: (response) async {
        ItemModel model = ItemModel.fromJson(response);

        if (model.item != null && model.item!.isNotEmpty) {
          items.addAll(model.item!);
        }

        update();
      },
    );
  }

  bool _isGridViewShow = false;

  bool get isGridViewShow => _isGridViewShow;

  set isGridViewShow(bool value) {
    _isGridViewShow = value;
    update();
  }
}
