window.addEventListener('DOMContentLoaded', function load() {
    window.removeEventListener('DOMContentLoaded', load, false)

    function getById(param) {
        return document.getElementById(param)
    }

    // Validation du formulaire de modification d'un produit
    const btnEditProduct = getById("btnEditProduct")
    btnEditProduct.addEventListener('click', btnEditProductClick)

    function btnEditProductClick() {
        const errorMessage = getById("editProductError")
        const errorName = getById("errorName")
        const errorPrice = getById("errorPrice")
        const errorStock = getById("errorStock")

        const form = getById("formEditProduct")
        const name = getById("editProductName")
        const price = getById("editProductPrice")
        const stock = getById("editProductStock")

        if (name.value.length === 0 || price.value.length === 0 || stock.value.length === 0) {
            errorMessage.style.display = "block";
            errorName.style.display = name.value.length === 0 ? "block" : "none"
            errorPrice.style.display = price.value.length === 0 ? "block" : "none"
            errorStock.style.display = stock.value.length === 0 ? "block" : "none"
        } else {
            errorMessage.style.display = "none";
            form.submit()
        }
    }


    // Validation du formulaire d'ajout d'une categorie
    const btnAddCategory = getById("btnAddCategory")
    btnAddCategory.addEventListener('click', btnAddCategoryClick)

    function btnAddCategoryClick() {
        const errorMessage = getById("addCategoryError")
        const errorName = getById("errorNameCategory")
        const errorOrder = getById("errorOrderCategory")

        const form = getById("formAddCategory")
        const name = getById("addCategoryName")
        const order = getById("addCategoryPosition")

        if (name.value.length === 0 || order.value.length === 0) {
            errorMessage.style.display = "block";
            errorName.style.display = name.value.length === 0 ? "block" : "none"
            errorOrder.style.display = order.value.length === 0 ? "block" : "none"
        } else {
            errorMessage.style.display = "none";
            form.submit()
        }
    }

}, false)
