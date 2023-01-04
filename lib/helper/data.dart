import '../models/category_model.dart';



List<CategoryModel> getCategories() {
  List<CategoryModel> category =   <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  //2
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //3
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //4
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //5
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1554475900-0a0350e3fc7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=417&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //6
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1612872087720-bb876e2e67d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1007&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //7
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();







  return category;


}