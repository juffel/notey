$(document).on('ready page:load', function() {
  // for now just fetch the whole set of tags on document load
  var tags = [];
  refresh_tags(tags);
  // submit on press enter
  $('#tag_input').keyup(function(event) {
    if(event.keyCode == 13) {
      $('#submit_tag').click();
    }
  });
});

// loads all tags from server and puts into the passed variable
function refresh_tags(tags) {
  tags = [];
  $.ajax("/tags", {
    success: function(data, status) {
      $(data).each(function() {
        tags.push(this.name);
      });
      // initialize autocomplete
      $('#manifestation_tag').autocomplete({
        source: tags
      });
    }
  });
}

