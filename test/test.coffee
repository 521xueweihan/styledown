require './setup'

Styledown = require '.'
Cheerio = require 'cheerio'

describe 'styledown', ->
  before ->
    @load = (html) ->
      @html = Styledown.parse(html)
      @$ = Cheerio.load(@html)

  it '#parse', ->
    expect(Styledown.parse).be.function

  describe 'basic markdown', ->
    beforeEach ->
      @load '''
      # Hello
      there
      '''

    it 'text', ->
      expect(@$("h1").text()).eql 'Hello'
      expect(@$("p").text()).eql 'there'

    it 'classnames', ->
      expect(@$("h1").is('.-sm')).be.true
      expect(@$("p").is('.-sm')).be.true

  describe 'jade technologies', ->
    beforeEach ->
      @load '''
      ### Button

          a.button
            | Hello
      '''

    it '-sm-example', ->
      expect(@$(".-sm-example").length).eql 1

    it 'example rendering', ->
      expect(@$("a.button").length).eql 1
      expect(@$("a.button").html()).eql "Hello"

    it 'text', -> console.log @html
