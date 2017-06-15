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
      console.log(background);
      // ajax request that saves the coordinates of the elements
      $.ajax({
        url: window.location.pathname + "/add",
        method: "POST",
        dataType: "JSON",
        data: {
          top: top,
          left: left,
          width: width,
          height: height,
          background: background
        }
      }).done(function(data) {
        console.log(data.floorplan);
      });

      // cloning the draggable element
      var $clone = ui.helper.clone();
      if (!$clone.is(".inside-droppable")) {
        var topPos = $(this).position().top;
        var leftPos = $(this).position().left;

        $(this).append(
          $clone.addClass("inside-droppable").draggable({
            containment: ".droppable",
            tolerance: "fit",
            position: "relative"
          })
        );
        // resizing the element
        $clone.resizable({
          animate: "true",
          ghost: true,
          handles: "ne, nw, se, sw"
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
