
class CreateUserCtrl

    constructor: (@$log, @$location,  @UserService) ->
        @$log.debug "constructing CreateUserController"
        @user = {}

    createUser: () ->
        @$log.debug "createUser()"
        @user.active = true
        @user.age = parseInt(@user.age)
        @UserService.createUser(@user)
        .then(
            (data) =>
                @$log.debug "Promise returned #{data} User"
                @user = data
                @$location.path("/")
            ,
            (error) =>
                @$log.error "Unable to create User: #{error}"
            )

controllersModule.controller('CreateUserCtrl', ['$log', '$location', 'UserService', CreateUserCtrl])