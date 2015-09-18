describe 'Model::Module', ->
  
  it 'Should be defined', ->
    expect(Elise.get('Models/module')).to.be.a('function')
    
  describe 'Attributes', ->
  
    beforeEach ->
      @Module = new (Elise.get('Models/module'))
    
    describe 'Defaults', ->
    
      it 'Should have an unknown module name', ->
        expect(@Module.get('name')).to.be('Unknown Module')
        
      it 'Should point to an error page', ->
        expect(@Module.get('path')).to.be('/error')
      
      it 'Should have a bg color of blue', ->
        expect(@Module.get('bg_color')).to.be('blue')
        
      it 'Should be flagged as active', ->
        expect(@Module.get('is_active')).to.be(true)
        
      it 'Should not require admin', ->
        expect(@Module.get('require_admin')).to.be(false)
        