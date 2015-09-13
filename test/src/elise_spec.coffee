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
    
      it 'Should return a boolean when property is found', ->
        expect(Elise.get('Models')).to.be(true)
      
      it 'Should return undefined when invalid property is passed', ->
        expect(Elise.get('Undefined')).to.be(undefined)
        
    describe 'get template', ->
      it 'Should exist', ->
        expect(Elise.get_template).to.be.a('function')