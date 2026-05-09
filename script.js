const button = document.getElementById('checkButton');
const result = document.getElementById('checkResult');

button?.addEventListener('click', () => {
  const now = new Date().toLocaleString('ja-JP');
  result.textContent = `Static Web Apps 検証ページは表示できています。確認時刻: ${now}`;
});
