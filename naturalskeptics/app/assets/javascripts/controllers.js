'use strict';

/* Controllers */

/*var skepticsApp = angular.module('skepticsApp', []);

skepticsApp.controller('ProductsListCtrl', function($scope, $http) {
    $http.get('products/products.json').success(function(data) {
        $scope.products = data;
    });

    $scope.orderProp = 'name';
});*/


var phonecatApp = angular.module('phonecatApp', []);

phonecatApp.controller('PhoneListCtrl', function($scope, $http) {
    $http.get('phones/phones.json').success(function(data) {
        $scope.phones = data;
    });

    $scope.orderProp = 'name';


});
