$(document).on('ready page:load', function() {
  // for now just fetch the whole set of tags on document load
  var tags = [];
  refresh_tags(tags);

  // submit button event handler
  /*$('#submit_tag').on('click', function() {
    var tag_string = $('#tag_input').val();
    if (tag_string == "") {
      return;
    }
    $.ajax("/new",{
      method: "POST",
      data: {
        tag_string: tag_string,
      },
      success: function(data, status) {
        alert('Tag '+tag_string+' mit neuem Manifest hinzugefügt!\n'+"id: "+data.id+", tag_id: "+data.tag_id+", date: "+data.date+", till_date: "+data.till_date);
        refresh_tags(tags);
        $('#tag_input').val("");
      }
    });
  }); */
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
      $('#tag_input').autocomplete({
        source: tags
      });
    }
  });
}

