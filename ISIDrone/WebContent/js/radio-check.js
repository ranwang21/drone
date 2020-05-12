const statusDiv = document.getElementById("statusDiv")
const status = document.querySelectorAll("div.status")

const divClick = (event) => {
    event.preventDefault()
    const label = event.target
    const input = label.previousElementSibling
    console.log(label.textContent)
    console.log(input.value)
}

for (let i = 0; i < status.length; i++) {
    status[i].addEventListener("click", event => divClick(event))
}
