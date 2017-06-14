// $(function() {
//   $("#draggable").draggable();
//   $("#droppable").droppable({
//     drop: function(event, ui) {
//       $(this).addClass("ui-state-highlight").find("p").html("Dropped!");
//     }
//   });
// });
//
$(document).ready(function($) {
  $(".droppable").droppable({
    accept: ".draggable",
    drop: function(event, ui) {
      var $clone = ui.helper.clone();
      if (!$clone.is(".inside-droppable")) {
        $(this).append(
          $clone.addClass("inside-droppable").draggable({
            containment: ".droppable",
            tolerance: "fit",
            position: "relative"
          })
        );

        // $clone.resizable({
        //   animate: "true",
        //   ghost: "true",
        //   handles: "ne, nw, se, sw"
        // });
      }
    }
  });
  $(".draggable").draggable({
    helper: "clone",
    revert: "invalid"
  });
});
