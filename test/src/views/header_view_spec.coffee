describe 'Header View', ->
  
  describe 'Events', -> 
    describe '#Toggle Search Bar', ->
      beforeEach ->
        @view = new (Elise.get('Views/Header'))
      
      afterEach ->
        @view.undelegateEvents()
        @view = null
        $('header').html('')
        $('main').html('')
        $('footer').html('')
      
      it 'Should expand on search icon click', ->
        @view.$('span.searchbox-icon').click()
        expect($('.searchbox').hasClass('searchbox-open')).to.be(true)