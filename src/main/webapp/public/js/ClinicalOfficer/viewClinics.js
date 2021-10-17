function search(){
    let count=0
    const input = document.getElementById('filter').value.toUpperCase();
    const cardContainor = document.getElementById('card-containor');
    const card = cardContainor.getElementsByClassName('live-card')

    for(let i=0 ; i<card.length ;i++){
        let title = card[i].querySelector('#clinic-title');

        if(title.innerHTML.toUpperCase().indexOf(input) > -1){
            card[i].style.display=""
        }else{
            card[i].style.display="none"
        }
    }
}