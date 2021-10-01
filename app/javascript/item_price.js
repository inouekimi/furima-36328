// const timer = 60000
window.addEventListener('load', () => {
  // setInterval('location.reload()',timer);
// ページ全体が読み込まれた後にイベント発火
  const priceInput = document.getElementById("item-price");
  console.log(priceInput)
  // 変数priceInputにhtmlのid情報を代入
  priceInput.addEventListener("input", () => {
    // 変数priceInputに入力が行われたらイベント発火
    const inputValue = priceInput.value;
    // 変数inputValueに実際に入力した金額をvalue属性で取得する
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(inputValue - (inputValue * 0.1));
  })
  
});