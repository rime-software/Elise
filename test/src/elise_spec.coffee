describe 'Elise', ->

  it 'Should be a global object', ->
    expect(Elise).to.be.an('object')

  it 'Should have Models', ->
    expect(Elise.Models).to.be.ok()
  
  it 'Should have Collections', ->
    expect(Elise.Collections).to.be.ok()
    
  it 'Should have Views', ->
    expect(Elise.Views).to.be.ok()  

  it 'Should have Routers', ->
    expect(Elise.Routers).to.be.ok()  
  
  describe 'Methods', ->
    describe 'get', ->

      it 'Should exist', ->
        expect(Elise.get).to.be.a('function')
      
      it 'Should return undefined when invalid property is passed', ->
        expect(Elise.get('Undefined')).to.be(undefined)
        
    describe 'get template', ->
      it 'Should exist', ->
        expect(Elise.get_template).to.be.a('function')
        
    describe 'bind', ->
      
      it 'Should bind a view to Dom#Views', ->
        Elise.bind('Views/Header')
        expect(Elise.Dom['Views']['Header']).to.be.an('object')
        Elise.unbind_views()
        
    describe 'unbind_views', ->
      
      it 'Should remove all views', ->
        Elise.bind('Views/Header')
        Elise.bind('Views/Footer')
        Elise.unbind_views()
        expect(Elise.Dom['Views']['Header']).to.be(undefined)