function cal_tax_and_profit() {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  let item_price_value;
  let add_tax_price_value;
  let profit_value;

  item_price.addEventListener("keyup", ()=>{
    item_price_value = item_price.value;
    add_tax_price_value = Math.floor(item_price_value * 0.1);
    profit_value = item_price.value - add_tax_price_value;

    add_tax_price.innerHTML = add_tax_price_value.toLocaleString();
    profit.innerHTML = profit_value.toLocaleString();
  });
};

window.addEventListener('turbo:load', cal_tax_and_profit);