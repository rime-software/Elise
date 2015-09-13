describe 'IndexController', ->
  
  it 'Should be defined', ->
    expect(Elise.get('Controllers/index')).to.be.a('function')
    
  describe 'Actions', ->
  
    beforeEach ->
      @IndexController = new (Elise.get('Controllers/index'))
    
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
        