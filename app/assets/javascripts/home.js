// Init app with dependencies
var demoApp = angular.module('demoApp', []);

demoApp.controller('mainCtrl', function($scope, ProductService) {
  $scope.page = {}

  $scope.$watch("page.products", function(val) {
    console.log("it changed")
    console.log(val)
  })
});

demoApp.controller('filterCtrl', function($scope, ProductService) {
  // Every page can access this services
  $scope.page.filters = [];
  $scope.page.sortFilter = [];


  $scope.toggleFilter = function(filter) {
    var index = $scope.page.filters.indexOf(filter)
    if (index == -1)
      $scope.page.filters.push(filter);
    else
      $scope.page.filters.splice(index, 1);
  };

  $scope.setSortFilter = function(filter) {
    var index = $scope.page.sortFilter.indexOf(filter)
    if (index == -1)
      $scope.page.sortFilter.push(filter);
    else
      $scope.page.sortFilter.splice(index, 1);
  };

  $scope.search = function() {
    $scope.page.products = null;

    var params = {
      'categories': $scope.page.filters.join(','),
      'sort': $scope.page.sortFilter.join(',')
    }

    ProductService.get_products(params).then(function(data) {
      console.log("__Resultats")
      console.log(data)
      $scope.page.products = data;

    });
  }
  $scope.search();
});


demoApp.factory('ProductService', function($http) {
  return {
    /*
     * Products get call
     */
    get_products: function(params) {
      var nb_products = 20,
        request = "",
        product_api = '/products/get.json?';

      if (params) {
        if (params["categories"]) product_api += '&categories=' + params["categories"];
        if (params["sort"]) product_api += '&sort=' + params["sort"];
      }

      return $http.get(product_api, {
        cache: false
      }).then(function(response) { //success
        return response.data;
      }, function(response) { // error
        return {};
      });
    }
  };
});


demoApp.directive('product', function() {
  return {
    restrict: "E",
    replace: true,
    templateUrl: 'product-template.html',
    link: function(scope, element, attrs) {

      console.log("ici")
      scope.getShowLink = function() {
        console.log("___", scope.product)
        return '/products/' + scope.product.id;
      }

      scope.getPix = function() {
        return ''
      }
      // product.product_picture[0].url

    }
  }
});