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
    // 古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview-image');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    previewList.appendChild(previewImage);
  });


});