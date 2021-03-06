define [
  'use!Underscore', 
  'use!Backbone',
  "order!libs/qunit-git",
], (_, Backbone) ->
  "use strict"
  
  $ = jQuery
  class NodesSpeedTest
    constructor: (app) ->
      ng = app.nodes
      filehandler = app.file_handler
      app.clearWorkspace()
      
      n1 = ng.create_node("Number")
      n2 = ng.create_node("Vector3")
      rnd = ng.create_node("Random")
      node_mult = ng.create_node("MathMult")
      
      node_mult.fields.getField("factor").setValue(3)
      
      ng.connections.create
        from_field: n1.v_out
        to_field: node_mult.v_in
      ng.connections.create
        from_field: rnd.v_out
        to_field: n1.v_in
      
      ng.render()
      
      JSLitmus.test "Simple math.mult function", () ->
        ng.render()
