window.addEventListener('DOMContentLoaded', function load() {
    window.removeEventListener('DOMContentLoaded', load, false)

    function getById(param) {
        return document.getElementById(param)
    }

    const btnEditProduct = getById("btnEditProduct")
    btnEditProduct.addEventListener('click', btnEditClick)

    function btnEditClick() {
        const errorMessage = getById("editProductError")
        const form = getById("formEditProduct")
        const name = getById("editProductName")
        const price = getById("editProductPrice")
        const stock = getById("editProductStock")

        if (name.value.length === 0 || price.value.length === 0 || stock.value.length === 0) {
            errorMessage.style.display = "block";
        } else {
            errorMessage.style.display = "none";
            form.submit()
        }

    }

}, false)
