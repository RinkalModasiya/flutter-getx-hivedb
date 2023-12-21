abstract class NetworkConstants {
  static const baseUrl = "https://dummyjson.com";

  static const kApiVersion = "";

  // products
  static const products = "/products";
}

abstract class NetworkAPIs {
  static const productAPI =
      NetworkConstants.baseUrl + NetworkConstants.products;
}

abstract class NetworkParams {
  static const kLimit = "limit";
}
