// alert("class")
class selectVacClinics {

    ClinicArray = [
        {
            description:"",
            dose_count:"",
            duration:"",
            location:"",
            max_patient:"",
            start_date_time:"",
            target_age_limit:"",
            target_moh:"",
            target_people:"",
            tittle:"",
            v_id:""
        }
    ];
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
                <div class="left_row_right"><input type="text" required  id="clinic-title" value="${item.tittle}"></div>

              </div>
              <div class="left_row">
                <div class="left_row_left"><span> description  </span></div>
                <div class="left_row_right"><input type="text" required id="description" value="${item.description}"></div>
              </div>
              
              <div class="left_row">
                <div class="left_row_left"><span> start_date_time  </span></div>
                <div class="left_row_right"><input type="text" required id="start_date_time" value="${item.start_date_time}"></div>
              </div>
              
              <div class="left_row">
                <div class="left_row_left"><span> duration  </span></div>
                <div class="left_row_right"><input type="text" required id="duration" value="${item.duration}"></div>
              </div>
              
              <div class="left_row">
                <div class="left_row_left"><span>Location</span></div>
                <div class="left_row_right"><input type="text" id="Location" required value="${item.location}"></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span> Target MOH</span></div>
                <div class="left_row_right"><input type="text" id="Target-MOH" required value="${item.target_moh}"></div>
              </div>
              <div class="left_row">
                <div class="left_row_left"><span>  Target Peoples</span></div>
                <div class="left_row_right"><input type="text" id="Target-Peoples" required value="${item.target_people}"></div>
              </div>
           
            </div>
            <div class="basic-right">
              <div class="left_row">
                <div class="left_row_left"><span> Max limit</span></div>
                <div class="left_row_right"><input type="text" id="Max-limit" required value="${item.max_patient}"></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> Age limit</span></div>
                <div class="left_row_right"><input type="text" id="Age-limit" required value="${item.target_age_limit}"></div>
              </div>

              <div class="left_row">
                <div class="left_row_left"><span> Vaccine name</span></div>
                <div class="left_row_right"><input type="text" id="Vaccine-name" required value="${item.v_id}"></div>
              </div>
              <div class="image-upload-card-container">
                <div class="image-upload-card">
                  <img id="proof1" width="100%" />
                  <input type="file" accept="image/*" name="file" id="proof1input"
                         onchange="loadFile(event , 'proof1')" style="display: none;">

                  <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                </div>
<!--                                                          <button onclick="imageUpload()">add</button>-->
              </div>
            </div>
            `;
        })
    }


}