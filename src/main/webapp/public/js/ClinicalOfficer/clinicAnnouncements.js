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
        alert("came")
        this.ClinicArray.map((item) => {
            this.container.innerHTML += `
 <div class="AC_container">
      <div class="AC_Body_container" id="AC_Body_container">
        <div class="Container_left">
          <div class="LRow">
            <div class="form-item">
              <input type="text" id="clinicID"  autocomplete="off" required>
              <label class="name" for="clinicID">Search by Name</label>
              <span class="error" id="LfullName" onclick="view()"><img src="${this.url}/images/icons/search.svg" width="10px" style="padding-top: 8px"/></span>
            </div>
          </div>
          <div class="LRow">
            <label>Title</label><br>
            <input type="text" name="" id="Title">
          </div>
          <div class="LRow mt5">
            <textarea rows='1'>${item.description}</textarea>
            <label id="Des">Description</label>

          </div>
          <div class="LRow">

            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <img src="${this.url}/images/icons/circle.svg" width="8px"/>
                </div>
                <div class="row_text">
                  <label>Location</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text" value="${item.location}">
              </div>
            </div>

            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <img src="${this.url}/images/icons/calendar.svg" width="8px"/>
                </div>
                <div class="row_text">
                  <label>Date & Time</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text" value="${item.datetime}">
              </div>
            </div>
            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <img src="${this.url}/images/icons/clock.svg" width="8px"/>
                </div>
                <div class="row_text">
                  <label>Duration</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text" value="${item.duration}">
              </div>
            </div>
            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <img src="${this.url}/images/icons/user.svg" width="8px"/>
                </div>
                <div class="row_text">
                  <label>Conduct By</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text" value="${item.conduct}">
              </div>
            </div>
            <div class="DRow">
              <div class="DRow_Left">
                <div class="icon">
                  <img src="${this.url}/images/icons/triangle.svg" width="8px"/>
                </div>
                <div class="row_text">
                  <label >Max limit</label>
                </div>
              </div>
              <div class="DRow_Right">
                <input type="text" value="${item.maxpatient}">
              </div>
            </div>

          </div>
        </div>
        <div class="Container_right">
          <div class="RRow">
            <textarea rows='1' id="TargetP" placeholder='Type target patients here...'>${item.disease}</textarea>
            <label id="target">Target Participant</label>
          </div>
          <div class="RRow">
            <div class="row ">
              <div class="image-upload-card-list-container">

                <div class="image-upload-card-container">
                  <div class="image-upload-card">
                    <img id="proof3" width="100%"/>
                    <input type="file" accept="image/*" name="image" id="proof3input"
                           onchange="loadFile(event, 'proof3')" style="display: none;">
                    <label id="upload-btn" for="proof3input" style="cursor: pointer;">Upload Image</label>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <button id="sybmit">submit</button>
    </div>
            `;
        })
    }

}
