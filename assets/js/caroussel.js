let currentPosition = 0;
let cardCount = 5;
let cardWidth = window.innerWidth;
console.log(cardWidth)

let slider = document.querySelector(".caroussel .caroussel__wrapper");
let nextBtn = document.querySelector(".next-btn");
let prevBtn = document.querySelector(".prev-btn");

const next = () =>{
    currentPosition -= cardWidth;
    if (currentPosition < -cardWidth * (cardCount - 1)) { 
        currentPosition = 0; 
    }
    slider.style.transform = `translateX(${currentPosition}px)`;
};

const prev = () =>{
    currentPosition += cardWidth;
    if (currentPosition > 0) { 
        currentPosition = -cardWidth * (cardCount - 1); 
    }
    slider.style.transform = `translateX(${currentPosition}px)`;
}
nextBtn.addEventListener("click", () => next())
prevBtn.addEventListener("click", () => prev())

setInterval(() => {
	next();
}, 5000);