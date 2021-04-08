function itemPrice() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = Math.floor(inputValue * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - addTax.innerHTML);
  });
};

window.addEventListener("load", itemPrice)