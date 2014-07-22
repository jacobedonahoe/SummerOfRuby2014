// make the response
response = $.ajax({
  url: "/quotes.json",
  dataType: "JSON",
  method: "GET"
});

//when the data comes back..
response.success(function(data){
  var html, quotes, ul;
  
  var ul= $("#quotes");
  quotes = data;

  //use jQuery's .each method to iterate
  $.each(quotes, function(index, quote){
    html = "<li>";
    html += quote["text"] + " = " + quote["person"];
    html += "</li>";

    //convert the string to a jQuery object
    html = $(html);

    ul.append(html); //add the list item to the unordered list
  });

});
