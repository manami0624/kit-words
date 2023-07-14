document.addEventListener("DOMContentLoaded", function() {
  var memoLink = document.getElementById("memo-link");
  var pencilLink = document.getElementById("pencil-link");

  var memoTextOverlay = memoLink.querySelector(".text-overlay");
  var pencilTextOverlay = pencilLink.querySelector(".text-overlay");

  memoLink.addEventListener("mouseenter", function() {
    memoTextOverlay.style.display = "block";
  });
  memoLink.addEventListener("mouseleave", function() {
    memoTextOverlay.style.display = "none";
  });

  pencilLink.addEventListener("mouseenter", function() {
    pencilTextOverlay.style.display = "block";
  });
  pencilLink.addEventListener("mouseleave", function() {
    pencilTextOverlay.style.display = "none";
  });
});