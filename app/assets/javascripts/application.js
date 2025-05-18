// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require froala.js
//= require sortable-rails
//= require reveal
//= require moment
//= require typewatch.js

//= require_tree .

//

//
$.fn.contentEdit = function (callback) {
  return this.each(function () {
    var $this = $(this);
    var htmlOld = $this.html();

    var contentTimer;
    $this.bind("blur keyup paste copy cut mouseup", function () {
      clearTimeout(contentTimer);
      contentTimer = setTimeout(function () {
        var htmlNew = $this.html();
        if (htmlOld !== htmlNew && $this.attr("url") != undefined) {
          $this.trigger("change");
          htmlOld = htmlNew;
          value = htmlOld;
          box = $this;

          hash = {};
          hash[box.attr("key")] = value;
          hash["_method"] = "post";
          $.ajax({
            type: "PUT",
            dataType: "json",
            url: box.attr("url"),
            contentType: "application/json",
            data: JSON.stringify(hash),
            success: function (res) {
              console.log(res);
              callback(htmlNew, $this);
            },
          });
        } else {
          callback(htmlNew, $this);
        }
      }, 1000);
    });
  });
};
