import 'package:newsapp/model/categoryModel.dart';

List<CategoryModel> getcategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryname = "Business";
  categoryModel.imageurl =
      "https://imageio.forbes.com/specials-images/imageserve/633a774a842d06ecd68286ff/The-5-Biggest-Business-Trends-For-2023/960x0.jpg?height=430&width=711&fit=bounds";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel = new CategoryModel();
  categoryModel.categoryname = "Entertainment";
  categoryModel.imageurl =
      "https://img.freepik.com/free-vector/oil-refinery-poster_1284-12014.jpg?w=900&t=st=1690012821~exp=1690013421~hmac=51599c429be279700aa5f8dd1394be260f71a69e7085bdf309ce71bb758d817f";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryname = "General";
  categoryModel.imageurl =
      "https://img.freepik.com/free-photo/interior-view-steel-factory_1359-117.jpg?w=996&t=st=1690012415~exp=1690013015~hmac=e4c7e11b69c1be33568438309a7cc82a4ed6b52652e135d3a09f2834aad58075";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryname = "Health";
  categoryModel.imageurl =
      "https://cms-api-in.myhealthcare.co/image/20220910103120.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
