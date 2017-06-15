$(document).ready(function($) {
  // set the droppable area to "accept" the draggable items
  // hold in the elements on drop action
  $(".droppable").droppable({
    accept: ".draggable",
    drop: function(event, ui) {
      var top = ui.helper.position().top;
      var left = ui.helper.position().left;
      var height = ui.helper.css("height");
      var width = ui.helper.css("width");
      var background = ui.helper.css("background-color");

      // ajax request that saves the coordinates of the elements
      var floorplanId = ui.helper.context.id;
      var $clone = ui.helper.clone();
      if (!$clone.is(".inside-droppable")) {
        $(this).append(
          $clone.addClass("inside-droppable").draggable({
            containment: ".droppable",
            tolerance: "fit",
            position: "relative",
            drop: function() {
              console.log(floorplanId);
            }
          })
        );

        // resizing the element
        $clone.resizable({
          animate: "true",
          ghost: true,
          handles: "ne, nw, se, sw",
          stop: function(event, ui) {
            $.ajax({
              method: "PUT",
              url:
                window.location.pathname + "/" + $(this).attr("id") + "/update",
              dataType: "JSON",
              data: {
                id: ui.helper.attr("id"),
                top: ui.helper.css("top"),
                left: ui.helper.css("left"),
                width: ui.helper.css("width"),
                height: ui.helper.css("height"),
                background: background
              }
            }).done(function(data) {
              $clone.attr("id", data.floorplan.id);
              console.log(data.floorplan.id);
              console.log(data.floorplan);
            });
          }
        });
      }

      // this is new, need to CREATE (POST)
      if (!floorplanId) {
        // console.log("WE ARE CREATING");
        $.ajax({
          method: "POST",
          url: window.location.pathname + "/add",
          dataType: "JSON",
          data: {
            top: top,
            left: left,
            width: width,
            height: height,
            background: background
          }
        }).done(function(data) {
          $clone.attr("id", data.floorplan.id);
          // console.log(data.floorplan.id);
          // console.log(data.floorplan);
        });
      } else {
        $.ajax({
          method: "PUT",
          url:
            window.location.pathname + "/" + ui.helper.context.id + "/update",
          dataType: "JSON",
          data: {
            id: ui.helper.context.id,
            top: top,
            left: left,
            width: width,
            height: height,
            background: background
          }
        }).done(function(data) {
          $clone.attr("id", data.floorplan.id);
          // console.log(data.floorplan.id);
          // console.log(data.floorplan);
        });
      }
    }
  });
  // hides the ghost element animation that comes back to the original position of the draggable
  $(".draggable").draggable({
    helper: "clone",
    revert: "invalid"
  });
});
