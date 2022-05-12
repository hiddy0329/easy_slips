document.addEventListener("DOMContentLoaded", () => {
  const orderNumberInput = document.querySelector(".form-control");
    if (orderNumberInput){
      const inputElement = document.querySelector(".form-control");
      inputElement.addEventListener("input", () => {
        const keyword = document.querySelector(".form-control").value;
        console.log(keyword);
      });
    };
  });