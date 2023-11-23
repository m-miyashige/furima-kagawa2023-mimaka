function display_preview_main() {
  // 商品出品ページのフォームを取得し、ないなら終了
  const newItemForm = document.getElementsByClassName('items-sell-contents');
  if (!newItemForm) return null;

  // プレビューを表示するためのスペースを取得
  const previewMain= document.getElementById('preview-main');

  // input要素を取得
  const fileFieldMain = document.querySelector('input[type="file"][name="item[image]"]');
  
  fileFieldMain.addEventListener('change', function (e) {
    // 古いプレビューが存在する場合は削除
    const alreadyPreviewImageMain = document.querySelector('.preview-image-main');
    if (alreadyPreviewImageMain) {
      alreadyPreviewImageMain.remove();
    };

    // "プレビュー"の文字があれば削除
    const textContentPreviewMain = previewMain.textContent;
    if (textContentPreviewMain) {
      previewMain.textContent = '';
    };

    const file = e.target.files[0];

    if (!file) {
      previewMain.textContent = 'プレビュー';
      return null;
    };

    const blob = window.URL.createObjectURL(file);

    const previewImageMain = document.createElement('img');
    previewImageMain.setAttribute('class', 'preview-image-main');
    previewImageMain.setAttribute('src', blob);
    previewMain.appendChild(previewImageMain);
  });

};




function display_preview_sub() {
  // 商品出品ページのフォームを取得し、ないなら終了
  const newItemForm = document.getElementsByClassName('items-sell-contents');
  if (!newItemForm) return null;
  
  // 投稿できる枚数の制限を定義
  const previewSubImageLimits = 5;

  // プレビュー画像を生成・表示する関数
  const buildPreviewImageSub = (dataIndex, blob) => {
    const previewImageSub = document.createElement('img');
    previewImageSub.setAttribute('class', 'preview-image-sub');
    previewImageSub.setAttribute('src', blob);

    const previewSubElement = document.querySelector(`.preview-sub[data-index="${dataIndex}"]`);
    previewSubElement.appendChild(previewImageSub);
  };
  

  // PreviewSubを生成、表示する関数
  const buildNewPreviewSubElement = () => {
    const previewSubWrapper = document.getElementById('img-upload-sub');
    const lastPreviewSubElement =  previewSubWrapper.lastElementChild;
    const nextDataIndex = Number(lastPreviewSubElement.getAttribute('data-index')) + 1;
    const newPreviewSubElement = lastPreviewSubElement.cloneNode(true);

    newPreviewSubElement.setAttribute('data-index', nextDataIndex);
    newPreviewSubElement.lastElementChild.setAttribute('data-index', nextDataIndex);
    newPreviewSubElement.lastElementChild.innerHTML = '';
    newPreviewSubElement.lastElementChild.textContent = "プレビュー";

    newPreviewSubElement.querySelector('input').setAttribute('data-index', nextDataIndex);
    newPreviewSubElement.querySelector('input').value = '';

    previewSubWrapper.appendChild(newPreviewSubElement);
    newPreviewSubElement.addEventListener('change', changeFileFieldSub);
  };
  

  const deletePreviewSubImage = (dataIndex) => {
    const deletePreviewSubImage = document.querySelector(`.preview-sub[data-index="${dataIndex}"]`).firstChild;
    deletePreviewSubImage.remove();
    const deletePreviewSub = document.querySelector(`.preview-sub[data-index="${dataIndex}"]`);
    deletePreviewSub.textContent = 'プレビュー';
  };


  // input要素で値の変化が起きた際に呼び出される関数
  const changeFileFieldSub = (e) => {
    const dataIndex = e.target.getAttribute('data-index');
    const file = e.target.files[0];

    if (!file) {
      deletePreviewSubImage(dataIndex);
      return null;
    };

    const blob = window.URL.createObjectURL(file);
      
    // プレビューの文字を削除
    const previewSub = document.querySelector(`.preview-sub[data-index="${dataIndex}"]`);
    if (previewSub.textContent) {
      previewSub.textContent = '';
    };

    // 既にプレビュー画像がある場合は差し替える
    const alreadyPreviewSubImage = document.querySelector(`.preview-sub[data-index="${dataIndex}"]`).firstChild;
    if (alreadyPreviewSubImage) {
      alreadyPreviewSubImage.setAttribute("src", blob);
      return null;
    };

    buildPreviewImageSub(dataIndex, blob);

    const previewImageSubCount = document.querySelectorAll(".preview-sub").length;
    if (previewImageSubCount < previewSubImageLimits) {
      buildNewPreviewSubElement();
    };
  };
    

    
  // input要素を取得
  const fileFieldSub = document.querySelector('input[type="file"][name="item[images_sub][]"]');
  fileFieldSub.addEventListener('change', changeFileFieldSub);

};
  

window.addEventListener('turbo:load', display_preview_main);
window.addEventListener('turbo:load', display_preview_sub);
window.addEventListener('turbo:render', display_preview_main);
window.addEventListener('turbo:render', display_preview_sub);