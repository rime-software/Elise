describe 'Header View', ->
  
  it 'Should be accessable from Elise', ->
    expect(Elise.get('Views/Header')).to.be.a('function')
