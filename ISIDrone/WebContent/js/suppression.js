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
    let divTitle = document.getElementById('order-main-title')
    let divBody = document.getElementById('order-body-title')
    divTitle.innerHTML = 'Suppression'
    divBody.innerHTML = "Voulez-vous supprimer la commande sélectionnée ?"
    let link = document.getElementById('confirm-link')
    link.setAttribute('href', 'remove-order?order_id=' + id)
}

function setIdProduct(id) {
    let link = document.getElementById('confirm-link')
    link.setAttribute('href', 'delete-product?category=1&productToremoveId=' + id)

}

function setIdUpdateExp(id, isExp) {
    let divTitle = document.getElementById('order-main-title')
    let divBody = document.getElementById('order-body-title')
    if (isExp === 'true') {
        divTitle.innerHTML = 'Confirmation'
        divBody.innerHTML = 'Voulez-vous expédié la commande sélectionnée ?'
    } else {
        divTitle.innerHTML = 'Annulation'
        divBody.innerHTML = "Voulez-vous annuler l'expédition de la commande sélectionnée ?"
    }
    let link = document.getElementById('confirm-link')
    link.setAttribute('href', 'edit-order-exp?order_id=' + id + '&is_exp=' + isExp)
}
