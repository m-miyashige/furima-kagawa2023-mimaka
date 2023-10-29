document.addEventListener('turbo:load', function () {
  const newItemForm = document.getElementsByClassName('items-sell-contents');

  if (!newItemForm) return null;
  console.log("previewが読み込まれました");
});