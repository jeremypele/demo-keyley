// Init app with dependencies
var demoApp = angular.module('demoApp', []);
demoApp.controller('filterCtrl', function($scope, ProductService) {
  // Every page can access this services
  $scope.page = {
    filters: [],
    sortFilter: []
  };

  $scope.toggleFilter = function(filter) {
    var index = $scope.page.filters.indexOf(filter)
    if (index == -1)
      filters.push(filter);
    else
      $scope.page.filters(index, 1);
  };

  $scope.setSortFilter = function(filter) {
    var index = $scope.page.sortFilter.indexOf(filter)
    if (index == -1)
      filters.push(filter);
    else
      $scope.page.sortFilter(index, 1);
  };


  $scope.search = function() {
    console.log($scope.page)
    ProductService.get_products().then(function(data) {

    })
  }

});



demoApp.factory('ProductService', function($http) {
  return {
    /*
     * Products get call
     */
    get_products: function(params) {
      var nb_products = 20,
        request = "";

      if (params) {
        if (params["request"]) request = params["request"];
      }

      var product_api = '/products/get.json?';

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