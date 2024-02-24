window.onload = () =>{
    const fileInput = document.getElementById("image");
    const preview = document.querySelector(".image-selector__preview");

    fileInput.addEventListener("change", (e) =>{
        let file = e.target.files[0];

        if(file){
            const reader = new FileReader();

            reader.onload = (e) => {
                let image = new Image();
                image.src = e.target.result;

                image.onload = () =>{
                    console.log("Image loaded");
                    preview.innerHTML = "";
                    preview.appendChild(image);
                    preview.style.display = "block";
                };
            }
            
            reader.readAsDataURL(fileInput.files[0]);
        }
    });
};