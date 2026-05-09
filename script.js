// 疎通チェック用ボタンを取得
const button = document.getElementById('checkButton');

// チェック結果を表示する要素を取得
const result = document.getElementById('checkResult');

// ボタンが存在する場合のみ、クリックイベントを登録する
button?.addEventListener('click', () => {
  // 現在時刻を日本語形式で取得
  const now = new Date().toLocaleString('ja-JP');

  // 画面上に疎通確認メッセージを表示
  result.textContent = `Static Web Apps 検証ページは表示できています。確認時刻: ${now}`;
});