app = angular.module("angular_django")
app.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.defaults.headers.common["X-CSRFToken"] = csrf_token
]
app.config (RestangularProvider) ->
  RestangularProvider.setBaseUrl "/api"
  RestangularProvider.setRequestSuffix "/"

app.config ($routeProvider, $locationProvider) ->
  $routeProvider.when "/poll/:poll_id/",
    controller: "PollController"
    templateUrl: '/static/app/partials/polls.html',
  $locationProvider.html5Mode true
