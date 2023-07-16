document.addEventListener("DOMContentLoaded", function() {
  var memoLink = document.getElementById("memo-link");

  var memoTextOverlay = memoLink.querySelector(".text-overlay");

  memoLink.addEventListener("mouseenter", function() {
    memoTextOverlay.style.display = "block";
  });
  memoLink.addEventListener("mouseleave", function() {
    memoTextOverlay.style.display = "none";
  });
});