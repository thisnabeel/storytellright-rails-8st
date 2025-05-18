//Insert Ayah
$.FroalaEditor.RegisterShortcut(65, 'ayah', false, false, true);

// RTL
$.FroalaEditor.RegisterShortcut(188, 'rightToLeft', false, false, true);
$.FroalaEditor.RegisterShortcut(190, 'leftToRight', false, false, true);


// Define popup template.
$.extend($.FroalaEditor.POPUP_TEMPLATES, {
  'customPlugin.popup': '[_BUTTONS_][_CUSTOM_LAYER_]'
});

// Define popup buttons.
$.extend($.FroalaEditor.DEFAULTS, {
  fa_popupButtons: ['popupClose', '|', 'insertAyah', 'insertRawAyah'],
});


var changeDirection = function (dir, align) {
      this.selection.save();
      var elements = this.selection.blocks();
      for (var i = 0; i < elements.length; i++) {
        var element = elements[i];
        if (element != this.$el.get(0)) {
         $(element)
           .css('direction', dir)
           .css('text-align', align);
        }
      }

      this.selection.restore();
    }

    $.FroalaEditor.DefineIcon('rightToLeft', {NAME: 'long-arrow-left'});
    $.FroalaEditor.RegisterCommand('rightToLeft', {
      title: 'RTL',
      focus: true,
      undo: true,
      refreshAfterCallback: true,
      callback: function () {
        changeDirection.apply(this, ['rtl', 'right']);
      }
    })

    $.FroalaEditor.DefineIcon('leftToRight', {NAME: 'long-arrow-right'});
    $.FroalaEditor.RegisterCommand('leftToRight', {
      title: 'LTR',
      focus: true,
      undo: true,
      refreshAfterCallback: true,
      callback: function () {
        changeDirection.apply(this, ['ltr', 'left']);
      }
    })


// The custom popup is defined inside a plugin (new or existing).
$.FroalaEditor.PLUGINS.customPlugin = function (editor) {
  // Create custom popup.
  function initPopup () {
    // Load popup template.
    var template = $.FroalaEditor.POPUP_TEMPLATES.customPopup;
    if (typeof template == 'function') template = template.apply(editor);

    // Popup buttons.
    var popup_buttons = '';

    // Create the list of buttons.
    if (editor.opts.fa_popupButtons.length > 1) {
      popup_buttons += '<div class="fr-buttons">';
      popup_buttons += editor.button.buildList(editor.opts.fa_popupButtons);
      popup_buttons += '</div>';
    }

    // Load popup template.
    var template = {
      buttons: popup_buttons,
      custom_layer: '<div class="custom-layer"><select class="form-control surahs-list"></select><input type="text" class="verse form-control" /></div>'
    };

    $.get( "http://api.alquran.cloud/surah", function( data ) {


      i = 0
      while (i < 114) {
        number = data.data[i].number
        name = data.data[i].name.replace('سورة ', '')
        $(".surahs-list").append("<option value="+number+">"+number+". "+name+"</option>")
        i++;
      }


    });

    // Create popup.
    var $popup = editor.popups.create('customPlugin.popup', template);

    return $popup;
  }

  // Show the popup
  function showPopup () {
      console.log("working")

    // Get the popup object defined above.
    var $popup = editor.popups.get('customPlugin.popup');

    // If popup doesn't exist then create it.
    // To improve performance it is best to create the popup when it is first needed
    // and not when the editor is initialized.
    if (!$popup) $popup = initPopup();

    // Set the editor toolbar as the popup's container.
    editor.popups.setContainer('customPlugin.popup', editor.$tb);

    // If the editor is not displayed when a toolbar button is pressed, then set BODY as the popup's container.
    // editor.popups.setContainer('customPlugin.popup', $('body'));

    // Trigger refresh for the popup.
    // editor.popups.refresh('customPlugin.popup');

    // This custom popup is opened by pressing a button from the editor's toolbar.
    // Get the button's object in order to place the popup relative to it.
    var $btn = editor.$tb.find('.fr-command[data-cmd="ayah"]');

    // Compute the popup's position.
    var left = $btn.offset().left + $btn.outerWidth() / 2;
    var top = $btn.offset().top + (editor.opts.toolbarBottom ? 10 : $btn.outerHeight() - 10);

    // Show the custom popup.
    // The button's outerHeight is required in case the popup needs to be displayed above it.
    editor.popups.show('customPlugin.popup', left, top, $btn.outerHeight());

  }

  // Hide the custom popup.
  function hidePopup () {
    editor.popups.hide('customPlugin.popup');
  }

  // Methods visible outside the plugin.
  return {
    showPopup: showPopup,
    hidePopup: hidePopup
  }
}

// Define an icon and command for the button that opens the custom popup.
$.FroalaEditor.DefineIcon('ayah', { NAME: 'bookmark'})
$.FroalaEditor.RegisterCommand('ayah', {
  title: 'Add Ayah',
  undo: false,
  focus: false,
  popup: true,
  // Buttons which are included in the editor toolbar should have the plugin property set.
  plugin: 'customPlugin',
  callback: function () {
    // if (!this.popups.isVisible('customPlugin.popup')) {
    //   this.customPlugin.showPopup();
    // }
    // else {
    //   if (this.$el.find('.fr-marker')) {
    //     this.events.disableBlur();
    //     this.selection.restore();
    //   }
    //   this.popups.hide('customPlugin.popup');
    // }

    cursor = this
    this.html.getSelected
    verse = this.selection.text()

    if (! /[-]/.test(verse)) {
      printVerses(verse)
    } else {
      range = verse.split("-")

      surah = range[0].split(":")[0]
      start = parseInt(range[0].split(":")[1])
      end = parseInt(range[1].split(":")[1])

      x = start
      verses =  []
      while (x < (end + 1)) {
        verses.push(surah + ":" + x)
        x = x + 1
      }

      // console.log(verses)
      verses.forEach(printVerses)
    }

    function printVerses(verse){
      $.ajaxSetup({ cache: true, jsonpCallback: 'quranData' }); // define ajax setup
      $.getJSON("http://api.globalquran.com/ayah/"+verse+"/quran-simple", {
          format : "json"
      }, function(data)
      {    
          $.each(data.quran, function(i, by)
          {
            $.each(by, function (verseNo, line) {
                    // cursor.html.insert(line.verse);
                    // cursor.link.insert("http://natadarrab.com/ayah/"+verse, line.verse, {'target': '_blank', 'rel': 'nofollow'})
                    // cursor.link.insert('<p>'+verse+' - '+line.verse+'</p>');
                    cursor.html.insert('<p>'+line.verse+' - '+'<a target="_blank" href="http://www.quran.com/'+line.surah+':'+line.ayah+'">'+verse+'</a>'+'</p>');
            });
          });
        cursor.customPlugin.hidePopup()
      });
    }


  }
});

// Define custom popup close button icon and command.
$.FroalaEditor.DefineIcon('popupClose', { NAME: 'times' });
$.FroalaEditor.RegisterCommand('popupClose', {
  title: 'Close',
  undo: false,
  focus: false,
  callback: function () {
    this.customPlugin.hidePopup();
  }
});

// Define custom popup 1.
$.FroalaEditor.DefineIcon('insertAyah', { NAME: 'paint-brush' });
$.FroalaEditor.RegisterCommand('insertAyah', {
  title: 'Add Verse',
  undo: false,
  focus: false,
  callback: function () {
    chapter = $(".surahs-list").val()
    input = $(".verse").val();
    verse = chapter + ":" +input 
    cursor = this
    this.html.getSelected


    $.ajaxSetup({ cache: true, jsonpCallback: 'quranData' }); // define ajax setup
        $.getJSON("http://api.globalquran.com/ayah/"+verse+"/quran-simple", {
            format : "json"
        }, function(data)
        {    
            $.each(data.quran, function(i, by)
            {
              $.each(by, function (verseNo, line) {
                      // cursor.html.insert(line.verse);
                      // cursor.link.insert("http://natadarrab.com/ayah/"+verse, line.verse, {'target': '_blank', 'rel': 'nofollow'})
                      cursor.link.insert('<p>In '+verse+'</p><h4 style="text-align: left;"><span style="background-color: rgb(84, 172, 210);color: rgb(255, 255, 255);">&nbsp; ​'+line.verse+' &nbsp;</span></h4>');
              });
            });
          cursor.customPlugin.hidePopup()
        });
    }
});

$.FroalaEditor.DefineIcon('insertRawAyah', { NAME: 'pencil' });
$.FroalaEditor.RegisterCommand('insertRawAyah', {
  title: 'Add Raw Verse',
  undo: false,
  focus: false,
  callback: function () {
    // chapter = $(".surahs-list").val()
    // input = $(".verse").val();
    // verse = chapter + ":" +input 
    cursor = this
    this.html.getSelected
    verse = this.selection.text()

    if (! /[-]/.test(verse)) {
      printVerses(verse)
    } else {
      verses = verse.split("-")
      verses.forEach(printVerses)
    }

    function printVerses(verse){
      $.ajaxSetup({ cache: true, jsonpCallback: 'quranData' }); // define ajax setup
      $.getJSON("http://api.globalquran.com/ayah/"+verse+"/quran-simple", {
          format : "json"
      }, function(data)
      {    
          $.each(data.quran, function(i, by)
          {
            $.each(by, function (verseNo, line) {
                    // cursor.html.insert(line.verse);
                    // cursor.link.insert("http://natadarrab.com/ayah/"+verse, line.verse, {'target': '_blank', 'rel': 'nofollow'})
                    // cursor.link.insert('<p>'+verse+' - '+line.verse+'</p>');
                    cursor.html.insert('<p>'+line.verse+' - '+verse+'</p>');
            });
          });
        cursor.customPlugin.hidePopup()
      });
    }

  }
});
