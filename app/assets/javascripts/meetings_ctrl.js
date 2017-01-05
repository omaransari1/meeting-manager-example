/* global angular */
(function() {
  "use strict";

  angular.module("app").controller("meetingsCtrl", function($scope, $http) {
    $scope.setup = function() {
      $scope.message = "Hello from angular!";
      $http.get('/api/v1/meetings').then(function(response) {
        $scope.meetings = response.data;
        console.log(response);
      });
    };
  });

}());