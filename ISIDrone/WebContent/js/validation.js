function getById(param) {
    return document.getElementById(param)
}

// Validation du formulaire de modification d'un produit
const btnEditProduct = getById("btnEditProduct")
btnEditProduct.addEventListener('click', btnEditProductClick)

const successMessage = getById("successMsgProduct")
const errorMessage = getById("editProductError")
const errorName = getById("errorName")
const errorPrice = getById("errorPrice")
const errorStock = getById("errorStock")

const form = getById("formEditProduct")
const name = getById("editProductName")
const price = getById("editProductPrice")
const stock = getById("editProductStock")

function btnEditProductClick() {

    if (name.value.length === 0 || price.value.length === 0 || stock.value.length === 0 || price.value < 0 || stock.value < 0) {
        // successMessage.style.display = "none";
        errorMessage.style.display = "block";
        errorName.style.display = name.value.length === 0 ? "block" : "none"
        errorPrice.style.display = price.value.length === 0 ? "block" : "none"
        errorStock.style.display = stock.value.length === 0 ? "block" : "none"
    } else {
        errorMessage.style.display = "none";
        form.submit()
    }
}