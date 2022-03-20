
class selectClinics {
    ClinicArray = [];
    container;
    url = "http://localhost:8080/test_war_exploded/public/";
    constructor(container) {
        this.container = document.getElementById(container);
    }
    setData(data) {
        if(!data) return;
        this.ClinicArray = data;
        this.container.innerHTML=" ";
        console.log(data);
        // alert("came")
        this.ClinicArray.map((item) => {
            this.container.innerHTML += `
        <div class="basic_left">
              <div class="left_row">
                <div class="left_row_left"><span>clinic-title  </span></div>
                <div class="left_row_right"><input type="text" name="clinic-title" id="clinic-title" autocomplete="off"
                                                   required value="${item.title}" readonly/></div>

              </div>
              <div class="left_row">
                <div class="left_row_left"><span> description  </span></div>
                <div class="left_row_right"><input type="text" placeholder="reason" autocomplete="off" name="description"
                                                      id="description" value="${item.description}"/></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> start_date_time  </span></div>
                <div class="left_row_right"><input type="text" name="date-time" id="date-time" autocomplete="off"
                                                   required value="${item.date}" readonly/></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> duration  </span></div>
                <div class="left_row_right"><input type="text" name="duration" id="duration" autocomplete="off"
                                                   required value="${item.duration}" readonly/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span>Location</span></div>
                <div class="left_row_right"> <input type="text" name="location" id="location" autocomplete="off"
                                                    required value="${item.location}" readonly/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span> Target MOH</span></div>
                <div class="left_row_right"><input type="text" name="target-MOH" id="target-MOH" autocomplete="off"
                                                   required value="${item.MOH}" readonly/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span>  Target Peoples</span></div>
                <div class="left_row_right"><input type="text" name="patient" id="patient" autocomplete="off"
                                                   required value="${item.Target}"/></div>
              </div>
           

            </div>
            <div class="basic-right">
               <div class="left_row">
                <div class="left_row_left"><span> Max limit</span></div>
                <div class="left_row_right"> <input type="number" name="max-patient" id="max-patient" autocomplete="off"
                                                    required value="${item.maxpatient}"/></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> Disease</span></div>
                <div class="left_row_right"><input type="text" name="disease" id="disease" autocomplete="off"
                                                   required value="${item.disease}" readonly/></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span> Conduct by</span></div>
                <div class="left_row_right"><input type="text" id="conduct"  required value="${item.conduct}" readonly/></div>
              </div>
              <div class="image-upload-card-container">
                <div class="image-upload-card" style="margin-bottom: 220px">
                  <img id="proof1" width="100%" />
                  <input type="file" accept="image/*" name="file" id="proof1input"
                         onchange="loadFile(event , 'proof1')" style="display: none;">

                  <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                </div>
<!--<%&#45;&#45;                <div><button onclick="imageUpload()">Create announcement</button></div>&#45;&#45;%>-->
<!--<%&#45;&#45;                                                          <button onclick="imageUpload()">add</button>&#45;&#45;%>-->
              </div>
            </div>
            `;
        })
    }

}