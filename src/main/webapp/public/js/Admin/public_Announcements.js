function card()
{
    date = new Date()
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = mm + '/' + dd + '/' + yyyy;

    var title = document.getElementById("title").value;
    var description = document.getElementById("description").value;

    let text =document.getElementById('announcement')
    text.innerHTML =`
                        <div class="left">
                            <div class="image-container">
                                <img id="images" width="160px" height="120px">
                            </div>
                        </div>
                        <div class="right">
                            <div class="up">
                                <div class="announe-title"  id="hii">${title}</div>
                                <div class="post-date">posted date -:${today} </div>
                            </div>
                            <div class="down">
                                  <div class="description">
                                     ${description}
                                   </div>
                                
                            </div>
                        </div>
    `



}

selectedOptionList = [];

function AddValue(){
    const Value = document.querySelector('#SelectColor').value;
    if(!Value) return;
    if(selectedOptionList.findIndex(item => Value == item) == -1){
        selectedOptionList.push(Value);
        const Text = document.querySelector('option[value="' + Value + '"]').label;
        const option=document.createElement("option");
        option.value="";
        option.text="";
        // document.getElementById('selected-options-container').appendChild(option);
        document.getElementById("selected-options-container").innerHTML += `
        <div class="selected-options">
            ${Value}
            <div class="close-btn" onclick="deleteSelectedItem('${Value}')">
                    X
            </div>
        </div>
        `
    }
    console.log(selectedOptionList);
    document.querySelector('#SelectColor').value ="";

}

selectedOptionList = [];

function deleteSelectedItem(value){
    let index = selectedOptionList.findIndex(item => value == item);
    let temp  = selectedOptionList.filter(item => item != value);
    selectedOptionList = temp;
    document.getElementById("selected-options-container").innerHTML = "";
    for(let i = 0; i < selectedOptionList.length ; i++){
        document.getElementById("selected-options-container").innerHTML += `
        <div class="selected-options">
            ${selectedOptionList[i]}
            <div class="close-btn" onclick="deleteSelectedItem('${selectedOptionList[i]}')">
                    X
            </div>
        </div>
        `
    }}
