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
                      <div class="left-col">
        <div class="row" >
          <form style="width: 100%;">
            <div class="row">
              <div class="form-group">
                <label for="aTitle">
                  Announctment Title
                </label>
                <input type="text" name="clinic-title" id="clinic-title" autocomplete="off"
                       required value="${item.title}"/>
              </div>
            </div>
            <div class="row">
              <div class="form-group">
                <label for="reason">
                  Announctment Description
                </label>
                <textarea rows="4" cols="50" type="text" placeholder="reason" name="description"
                          id="description"> ${item.description} </textarea>
              </div>
            </div>
            <div class="row" style="display: flex;flex-wrap: wrap;justify-content: flex-start;">
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Location
                </label>
                <input type="text" name="location" id="location" autocomplete="off"
                       required value="${item.location}"/>
              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Date & Time
                </label>
                <input type="text" name="date-time" id="date-time" autocomplete="off"
                       required value="${item.datetime}"/>
              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Duration
                </label>
                <input type="text" name="duration" id="duration" autocomplete="off"
                       required value="${item.duration}"/>
              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Conduct By
                </label>
                <input type="text" name="conduct" id="conduct" autocomplete="off"
                       required value="${item.conduct}"/>
              </div>
              <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Max limit
                </label>
                <input type="text" name="max-patient" id="max-patient" autocomplete="off"
                       required value="${item.maxpatient}"/>
              </div>
               <div class="form-group" style="width: 250px;">
                <label for="aTitle">
                  Disease
                </label>
                <input type="text" name="disease" id="disease" autocomplete="off"
                       required value="${item.disease}"/>
              </div>
            </div>
            <div class="row">
              <div class="form-group d-flex-a-i-end">
                <button class="submitBtn " type="submit" onclick="return imageUpload()" > Make Announctment</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="right-col">
        <div class="row" >
          <form style="width: 100%;">
            <div class="row">
              <div class="form-group">
                <label for="aTitle">
                  Target Peoples
                </label>
                <input type="text" name="patient" id="patient" autocomplete="off"
                       required value="${item.Target}"/>
              </div>
            </div>
            <div class="row">
              <div class="form-group">
                <label for="aTitle">
                  Target MOH
                </label>
                <input type="text" name="target-MOH" id="target-MOH" autocomplete="off"
                       required value="${item.MOH}"/>
                  </div>
            </div>
            <div class="row">
              <div class="form-group d-flex-a-i-end">
                <div class="image-upload-card-container">
                  <div class="image-upload-card">
                    <img id="proof1" width="100%" />
                    <input type="file" accept="image/*" name="file" id="proof1input"
                           onchange="loadFile(event , 'proof1')" style="display: none;">

                    <label for="proof1input" style="cursor: pointer;">Upload Image</label>
                  </div>
<!--                                       <button onclick="imageUpload()">add</button>-->
                </div>
              </div>

            </div>
        </div>
      </div>
            `;
        })
    }

}