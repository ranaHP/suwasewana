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
                                <div class="announe-title"  id="title">${title}</div>
                                <div class="post-date" id="date">posted date -:${today} </div>
                            </div>
                            <div class="down">
                                  <div class="description" id="description">
                                     ${description}
                                   </div>

                            </div>
                        </div>
    `



}

selectedOptionList1 = [];
function AddDValue1(){
    // alert("data")
    const Value = document.querySelector('#DArea').value;

    if(!Value) return;
    if(selectedOptionList1.findIndex(item => Value == item) == -1){
        selectedOptionList1.push(Value);
        const Text = document.querySelector('option[value="' + Value + '"]').label;
        const option=document.createElement("option");
        option.value="";
        option.text="";
        // document.getElementById('selected-options-container').appendChild(option);
        document.getElementById("selected-options-container1").innerHTML += `
        <div class="selected-options">
           <p id="option"> ${Value}</p>
            <div class="close-btn" onclick="deleteSelectedItem1('${Value}')">
                    X
            </div>
        </div>
        `
    }
    console.log(selectedOptionList1.map(i=>{
        console.log(i)
    }));
    // document.querySelector('#PArea').value ="";


}

selectedOptionList = [];
function AddValue(){
    // alert("data")
    const Value = document.querySelector('#PArea').value;

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
           <p id="option"> ${Value}</p>
            <div class="close-btn" onclick="deleteSelectedItem('${Value}')">
                    X
            </div>
        </div>
        `
    }
    console.log(selectedOptionList.map(i=>{
        console.log(i)
    }));
    // document.querySelector('#PArea').value ="";





}

selectedOptionList = [];

function deleteSelectedItem(value){
    let index = selectedOptionList.findIndex(item => value == item);
    console.log(index)
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

selectedOptionList = [];
function deleteSelectedItem1(value){
    let index = selectedOptionList1.findIndex(item => value == item);
    console.log(index)
    let temp  = selectedOptionList1.filter(item => item != value);
    selectedOptionList1 = temp;
    document.getElementById("selected-options-container1").innerHTML = "";
    for(let i = 0; i < selectedOptionList1.length ; i++){
        document.getElementById("selected-options-container1").innerHTML += `
        <div class="selected-options">
            ${selectedOptionList1[i]}
            <div class="close-btn" onclick="deleteSelectedItem1('${selectedOptionList1[i]}')">
                    X
            </div>
        </div>
        `
    }}
