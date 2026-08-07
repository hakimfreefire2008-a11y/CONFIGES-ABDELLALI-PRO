// CONFIGES ABDELLALI PRO

console.log("App Started");


const cards = document.querySelectorAll(".card");


cards.forEach(card => {

    card.addEventListener("click", () => {

        alert(
        "سيتم فتح قسم: " + card.querySelector("h2").innerText
        );

    });

});
