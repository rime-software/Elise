describe 'Header View', ->
  
  describe 'Events', -> 
    describe '#Toggle Search Bar', ->
      beforeEach ->
        @view = Elise.bind('Views/Header')
      
      afterEach ->
        Elise.unbind_views()
      
      it 'Should expand on search icon click', ->
        @view.$('span.searchbox-icon').click()
        expect($('.searchbox').hasClass('searchbox-open')).to.be(true)