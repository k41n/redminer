class window.DropletsController
  constructor: (@Droplet) ->
    console.log 'I am droplets controller constructor'
    console.log '@Droplet', @Droplet
    @Droplet.all()

DropletsController.$inject = [ 'Droplet' ]

angular.module('redminer').controller('DropletsController', DropletsController)