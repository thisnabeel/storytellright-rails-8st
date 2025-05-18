$.FroalaEditor.DefineIcon('insertChord', { NAME: 'pencil' });
$.FroalaEditor.RegisterCommand('insertChord', {
  title: 'Add Chord',
  undo: true,
  focus: false,
  callback: function () {
    // chapter = $(".surahs-list").val()
    // input = $(".verse").val();
    // verse = chapter + ":" +input 
    cursor = this
    this.html.getSelected
    txt = this.selection.text()

    $(".chords-box-list").each(function(){
      console.log($(this).html())
    })

    cursor.html.insert('<span class="lyric-chord">'+txt+'</span>');
    cursor.customPlugin.hidePopup()

  },
});