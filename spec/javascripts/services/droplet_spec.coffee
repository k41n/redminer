describe "DropletsService", ->
  beforeEach inject (Droplet, $injector, $httpBackend) ->
    @service = Droplet

    @http = $httpBackend

    @droplets = [new Droplet({ id: '1', name: 'test' })]
    @http.whenGET('/api/droplets').respond(200, @droplets)
    @http.flush()

  it "populates the the service with droplets", ->
    expect(@service).toBeDefined()
    expect(@service.droplets).toBeDefined()
    expect(Object.keys(@service.droplets).length).toEqual(1)
