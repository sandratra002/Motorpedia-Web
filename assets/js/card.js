// window.onload = () =>{
    let detailsBtn = document.querySelectorAll(".mini-card__detail-btn");
    let closeBtn = document.querySelectorAll(".detail-card__close");
    let detailsCards = document.querySelectorAll(".details-card");
    let body = document.querySelector("body");

    detailsBtn.forEach((button, index) => {
        button.addEventListener("click", () =>{
            detailsCards[index].classList.remove("hidden");
            body.classList.add("inactive");
        })
    });

    closeBtn.forEach((button, index) => {
        button.addEventListener("click", () =>{
            detailsCards[index].classList.add("hidden");
            body.classList.remove("inactive");
        })
    });
// };