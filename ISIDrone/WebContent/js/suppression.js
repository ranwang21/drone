const openModalButtons = document.querySelectorAll('[data-modal-target]')
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay-supp')

openModalButtons.forEach(button => {
    button.addEventListener('click', () => {
        const modal = document.querySelector(button.dataset.modalTarget)
        openModal(modal)
    })
})

overlay.addEventListener('click', () => {
    const modals = document.querySelectorAll('.modal-supp.active')
    modals.forEach(modal => {
        closeModal(modal)
    })
})

closeModalButtons.forEach(button => {
    button.addEventListener('click', () => {
        const modal = button.closest('.modal-supp')
        closeModal(modal)
    })
})

function openModal(modal) {
    if (modal == null) return
    modal.classList.add('active')
    overlay.classList.add('active')
}

function closeModal(modal) {
    if (modal == null) return
    modal.classList.remove('active')
    overlay.classList.remove('active')
}

function setIdCategory(id) {
    let link = document.getElementById('confirm-link')
    link.setAttribute('href', 'remove-category?category_id=' + id)
}

function setIdOrder(id) {
    let link = document.getElementById('confirm-link')
    link.setAttribute('href', 'remove-order?order_id=' + id)
}

function setIdOrderExp(id) {
    let link = document.getElementById('confirm-link')
    link.setAttribute('href', 'edit-order-exp?order_id=' + id)
}

function setIdProduct(id) {
    let link = document.getElementById('confirm-link')
    link.setAttribute('href', 'delete-product?category=1&productToremoveId=' + id)

}
