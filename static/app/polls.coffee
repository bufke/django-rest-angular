app = angular.module 'angular_django', ['restangular', 'ngRoute',]

app.controller 'PollController', ['$scope', '$routeParams', '$route', 'RestfulModel', ($scope, $routeParams, $route, RestfulModel) ->
    $scope.$on '$routeChangeSuccess', ->
        pollModel = new RestfulModel.Instance("polls")
        pollModel.getOptions().then (options) ->
            $scope.pollOptions = options
        pollModel.getOne($routeParams.poll_id, $scope.form).then (poll) ->
            $scope.poll = poll
            $scope.savePoll = poll.saveForm
]


app.factory 'RestfulModel', ['Restangular', (Restangular) ->
    Instance = (name) ->
        @modelName = name
        @getOptions = ->
            Restangular.all(@modelName).options().then (options) ->
                options.actions.POST
        @getOne = (object_id, form) ->
            Restangular.one(@modelName, object_id).get().then (obj) ->
                obj.saveForm = (form_name) ->
                    # save only the field that was changed.
                    form_field = form[form_name]
                    form_field.isSaving = true
                    form_field.isSaved = false
                    patch_object = {}
                    patch_object[form_name] = form_field.$viewValue
                    obj.patch(patch_object).then (response) ->
                        form_field.$setValidity "server", true
                        form_field.isSaving = false
                        form_field.isSaved = true
                    ), (response) ->
                        _.each response.data, (errors, key) ->
                            form_field.isSaving = false
                            #form[key].$dirty = true
                            form[key].$setValidity('server', false)
                            form[key].errors = errors
                obj
        @getList = ->
            Restangular.all(@modelName).getList().$object

        return

    Instance: Instance
]

app.directive "bscField", ->
    scope:
        fieldOptions: "="
        fieldForm: "="

    templateUrl: "/static/app/partials/field.html"
    transclude: true