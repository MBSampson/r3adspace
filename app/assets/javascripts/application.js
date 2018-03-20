// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

function displayImageField(){
  document.getElementById("ad_image").style.visibility = "visible";
  document.getElementById("ad-image-btn").style.visibility = "hidden";
}

function toggleAdPreview(){

  creationContainer   = document.getElementById("ad-creation-container");
  previewContainer    = document.getElementById("ad-preview-container");

  // Obtain visibility from previewContainer
  style = window.getComputedStyle(previewContainer);
  previewContainerDisplay = style.getPropertyValue('display');

  if(previewContainerDisplay === 'none'){
    previewContainer.style.display = 'block';
    creationContainer.style.display = 'none';
  } else {
    previewContainer.style.display = 'none';
    creationContainer.style.display = 'block';
  }

  fillAdPreviewTags();
}
function fillAdPreviewTags(){
  creationTitle       = document.getElementById("ad_title");
  creationPrice       = document.getElementById("ad_price");
  creationDescription = document.getElementById("ad_description");
  creationImage       = document.getElementById("ad_image");

  previewTitle        = document.getElementById("ad-verify-title");
  previewPrice        = document.getElementById("ad-verify-price");
  previewDescription  = document.getElementById("ad-verify-description");
  previewimage        = document.getElementById("ad-verify-image");

  num = convertToCurrency(Number(creationPrice.value));

  previewTitle.innerHTML = creationTitle.value;
  previewPrice.innerHTML = num;
}

function convertToCurrency(a_num){
  return '$' + a_num.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
}
