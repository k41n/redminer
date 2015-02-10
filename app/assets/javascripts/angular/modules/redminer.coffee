window.app = angular.module('redminer', [
    'ngRoute',
    'rails',
    'templates'
  ])

window.app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
.config(["$routeProvider", ($provider) ->
  $provider.when "/",
    templateUrl: 'dashboard.html'
    controller: 'DashboardController'
  $provider.when "/droplets",
    templateUrl: 'droplets.html'
    controller: 'DropletsController'
])