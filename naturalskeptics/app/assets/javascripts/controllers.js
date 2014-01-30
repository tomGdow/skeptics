'use strict';

/* Controllers */

var skepticsApp = angular.module('skepticsApp', []);

skepticsApp.controller('SkepticsCtrl', function($scope, $http) {

    $http.get('skepticsCommodities.json').success(function(data) {
        $scope.commodities = data;
    });


    $http.get('skepticsUsers.json').success(function(data) {
        $scope.userlist = data;
    });

    $scope.orderProp = 'name';
    $scope.orderPropAlt = 'email';
    $scope.markup = function(arg) {return arg + 0.45 * arg};

    $scope.mySplit = function(string) {

        return  string.split('@')[0]
    }

});




