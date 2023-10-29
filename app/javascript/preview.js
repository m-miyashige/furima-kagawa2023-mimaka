document.addEventListener('turbo:load', function () {
  // 商品出品ページのフォームを取得
  const newItemForm = document.getElementsByClassName('items-sell-contents');

  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('preview');

  // 商品出品ページのフォームがないならここで終了
  if (!newItemForm) return null;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="item[image]"]');
  fileField.addEventListener('change', function (e) {
  });


});