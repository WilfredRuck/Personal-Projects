 $(document).ready(function(){
    setTimeout(function() {
      $('#success').fadeOut('slow');
    }, 5000); // <-- time in milliseconds
});

 function copyText(code) {
  var copyText = document.getElementById("#random-code");
  console.log(copyText);
  code.select();
  document.execCommand("Copy");
  alert("Copied!");
}