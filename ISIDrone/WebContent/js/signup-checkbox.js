let isCheck = false

function disableFormLiv() {
    let checkbox = document.getElementById('liv_box')
    if (checkbox.checked) {
        isCheck = true
        document.getElementById("liv_no").disabled = true
        document.getElementById("liv_street").disabled = true
        document.getElementById("liv_zip").disabled = true
        document.getElementById("liv_city").disabled = true
        document.getElementById("liv_state").disabled = true
        document.getElementById("liv_tel").disabled = true
    } else {
        isCheck = false
        document.getElementById("liv_no").disabled = false
        document.getElementById("liv_street").disabled = false
        document.getElementById("liv_zip").disabled = false
        document.getElementById("liv_city").disabled = false
        document.getElementById("liv_state").disabled = false
        document.getElementById("liv_tel").disabled = false
    }
}

function getIsCheck() {
    return isCheck
}