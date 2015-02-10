app = angular.module('redminer')

app.factory "Droplet", [ 'RailsResource', '$q', (RailsResource, $q) ->
  class Droplet extends RailsResource
    @configure url: '/api/droplets', name: 'droplet'

    @all: ->
      defer = $q.defer()
      if @droplets?
        defer.resolve(@droplets)
      else
        @query().then (results) =>
          @droplets = results
          defer.resolve(@droplets)
      defer.promise
]
