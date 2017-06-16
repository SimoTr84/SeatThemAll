
// 0. Fix route for update
before:
floorplans/:id/update (NB. this is :id)

after: (make it this)
/resturaunts/:id/floorplans/:floorplanId/update
(1. move it inside /resturaunts)
(2. use :floorplanId)


// 1. If dragging from top left, create (POST)
// 2. If dragging from inside droppable, update (PUT)

// Need to do

// create
$.ajax({
  method: 'POST'
  url: window.location.pathname + "/add",
})

// update
$.ajax({
  method: 'PUT'
  url: window.location.pathname + ui.helper.context.id + "/update",
})



// ---------

List the floorplans for each restaurants



// QUESTIONS
- why isn't "raise" working? is it something to do with $.ajax?
- are we actually hitting the floorplan#update route?
- why are we always trying to find a floorplan with id: 1
