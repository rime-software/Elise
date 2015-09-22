describe 'IndexController', ->
  
  it 'Should be defined', ->
    obj = Elise.get('Controllers/index')
    expect(obj).to.be.a('function')
    obj = null
    
  describe 'Actions', ->
  
    beforeEach ->
      @IndexController = new (Elise.get('Controllers/index'))
      
    afterEach ->
      Elise.unbind_views()
      
    describe 'Index', ->
    
      it 'Should have an index action', ->
        expect(@IndexController.index).to.be.a('function')
        
      it 'Should load the index/index.html.js view', ->
        spyOn(jQuery, 'get').and.callFake (view) ->
          expect(view).to.equal('/javascripts/templates/index/index.html.js')
          d = $.Deferred()
          d.resolve("")
          d.promise()
        @IndexController.index()
        