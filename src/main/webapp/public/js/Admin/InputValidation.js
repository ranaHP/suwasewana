class FormInputValidation {
    $;


    mobileValidation(mobile, fieldName) {
        const regExp = /[a-zA-Z]/g;
        let isValida = true;
        console.log(mobile.length)
        if (mobile.length !== 10) {
            this.setErrorMessageForField("invalid mobile number", fieldName, 0)
            isValida = false;
        }
        if (mobile.length === 10) {
            this.setErrorMessageForField("", fieldName, 1)
            isValida = true;
        }
        if (!mobile.startsWith("0")) {
            this.setErrorMessageForField("mobile number must start with 0", fieldName, 0)
            isValida = false;
        }

        if (regExp.test(mobile) || mobile.includes(" ")) {
            this.setErrorMessageForField("characters or space cannot be used", fieldName, 0)
            isValida = false;
        }
        if (mobile === "") {
            this.setErrorMessageForField("required*", fieldName, 0)
            isValida = false;
        }
        if (!mobile) {
            this.setErrorMessageForField("required*", fieldName, 0)
            isValida = false;
        }
        return isValida;

    }
    selectCheck(name,fieldName){
        // console.log("select check "+ name+" "+fieldName)
        let isValida = true;
        if(!name){
            console.log("name is not come")
            isValida = false;
        }
        else {
            var CTypeObj = document.getElementById(name);
            var datalist = document.getElementById(CTypeObj.getAttribute("list"));
            // console.log(datalist);
            let ComplainType=(datalist.options.namedItem(CTypeObj.value));
            // console.log("id"+datalist.options.namedItem(CTypeObj.value).id);
            if(!ComplainType && ComplainType!=""){
                // console.log("empty comp type" +ComplainType)
                this.setErrorMessageForField("Required*", fieldName, 0)
                isValida = false;
            }
            else {
                // console.log(" not empty comp type" +ComplainType)
                this.setErrorMessageForField("", fieldName, 0)
                isValida = true;
            }
            return isValida;
        }

    }
    SearchSelect(val, feild) {
        let isValida = true;
        if (val == "") {
            this.setErrorMessageForField("required*", feild, 0)
            isValida = false;
        } else {
            this.setErrorMessageForField("", feild, 0)
            isValida = true;
        }
        return isValida;
    }

    nameValidation(name, fieldName) {
        let isValida = true;
        if (name === "") {
            this.setErrorMessageForField("required*", fieldName, 0)
            isValida = false;
        }
        if (name.length > 0) {
            this.setErrorMessageForField(" ", fieldName, 0)
            isValida = true;
        }

        if (!name) {
            this.setErrorMessageForField("required*", fieldName, 0)
            isValida = false;
        }
        return isValida;

    }

    nicValidation(name, fieldName) {
        let NICNo = name.value;
        let isValida = true;
        var dayText = 0;
        var year = "";
        var month = "";
        var day = "";
        var gender = "";
        if (NICNo.length != 10 && NICNo.length != 12) {
            // console.log("if")
            isValida = false;
            this.setErrorMessageForField("Invalid NIC NO", fieldName, 0)
        } else if (NICNo.length == 10 && !this.$.isNumeric(NICNo.substr(0, 9))) {
            // console.log("else if")
            this.setErrorMessageForField("Invalid NIC NO", fieldName, 0)
            isValida = false;
        } else {
            this.setErrorMessageForField("", fieldName, 0)
            isValida = true;
            // Year
            if (NICNo.length == 10) {
                year = "19" + NICNo.substr(0, 2);
                dayText = parseInt(NICNo.substr(2, 3));
            } else {
                year = NICNo.substr(0, 4);
                dayText = parseInt(NICNo.substr(4, 3));
            }

            // Gender
            if (dayText > 500) {
                gender = "Female";
                dayText = dayText - 500;
            } else {
                gender = "Male";
            }

            // Day Digit Validation
            if (dayText < 1 && dayText > 366) {
                $("#error").html("Invalid NIC NO");
            } else {

                //Month
                if (dayText > 335) {
                    day = dayText - 335;
                    month = "December";
                } else if (dayText > 305) {
                    day = dayText - 305;
                    month = "November";
                } else if (dayText > 274) {
                    day = dayText - 274;
                    month = "October";
                } else if (dayText > 244) {
                    day = dayText - 244;
                    month = "September";
                } else if (dayText > 213) {
                    day = dayText - 213;
                    month = "Auguest";
                } else if (dayText > 182) {
                    day = dayText - 182;
                    month = "July";
                } else if (dayText > 152) {
                    day = dayText - 152;
                    month = "June";
                } else if (dayText > 121) {
                    day = dayText - 121;
                    month = "May";
                } else if (dayText > 91) {
                    day = dayText - 91;
                    month = "April";
                } else if (dayText > 60) {
                    day = dayText - 60;
                    month = "March";
                } else if (dayText < 32) {
                    month = "January";
                    day = dayText;
                } else if (dayText > 31) {
                    day = dayText - 31;
                    month = "Febuary";
                }

                // Show Details
                // console.log("Gender : " + gender)
                // console.log("Year : " + year)
                // console.log("Month : " + month)
                // console.log("Day :" + day)
            }
        }
        return isValida;
    }

    selectValidation(select_feild) {
        let isValida = true;
        if (select_feild.value == 1) {
            select_feild.style.border = "1px solid rgb(219, 23, 23)"
            isValida = false;
        } else {
            select_feild.style.border = "none"
            isValida = true;
        }
        return isValida;
    }

    CheckConformPassword(pass1, pass2, fieldName) {
        let isValida = true;
        this.setErrorMessageForField("", fieldName, 0)
        // console.log("password/"+pass1.value+"/")
        if (pass1.value != pass2.value) {
            // console.log("error password not match")
            this.setErrorMessageForField("passwords are not match", fieldName, 0)
            // pass1.value="";
            // pass2.value="";
            pass1.style.border = "1px solid rgb(219, 23, 23)";
            pass2.style.border = "1px solid rgb(219, 23, 23)";
            isValida = false;
        } else if (!pass1.value || !pass2.value) {
            this.setErrorMessageForField("required*", fieldName, 0)
            isValida = false;
        } else {
            // console.log("password mathch")
            pass1.style.border = "none";
            pass2.style.border = "none";
            isValida = true;
        }
        return isValida;
    }


    CheckPassword() {
        let isValida = true;
        // console.log("check password work")
        var myInput = document.getElementById("input_password");
        var letter = document.getElementById("letter");
        var capital = document.getElementById("capital");
        var number = document.getElementById("number");
        var length = document.getElementById("length");
        var pass1 = document.getElementById("password1");
        document.getElementById("message").style.display = "block";
        var lowerCaseLetters = /[a-z]/g;
        var upperCaseLetters = /[A-Z]/g;
        var numbers = /[0-9]/g;
        // When the user clicks outside of the password field, hide the message box
        myInput.onblur = function () {
            // console.log("blure work")
            document.getElementById("message").style.display = "none";
        }

        // When the user starts to type something inside the password field
        myInput.onkeyup = function () {
            // Validate lowercase letters
            //   console.log("on key up in p text")

            if (myInput.value.match(lowerCaseLetters)) {
                letter.classList.remove("invalid");
                letter.classList.add("valid");
            } else {
                letter.classList.remove("valid");
                letter.classList.add("invalid");
            }

            // Validate capital letters

            if (myInput.value.match(upperCaseLetters)) {
                capital.classList.remove("invalid");
                capital.classList.add("valid");
            } else {
                capital.classList.remove("valid");
                capital.classList.add("invalid");
            }

            // Validate numbers

            if (myInput.value.match(numbers)) {
                number.classList.remove("invalid");
                number.classList.add("valid");
            } else {
                number.classList.remove("valid");
                number.classList.add("invalid");
            }

            // Validate length
            if (myInput.value.length >= 8) {
                length.classList.remove("invalid");
                length.classList.add("valid");
            } else {
                length.classList.remove("valid");
                length.classList.add("invalid");
            }
        }
        if (myInput.value.match(lowerCaseLetters) &&
            myInput.value.match(upperCaseLetters) &&
            myInput.value.match(numbers) &&
            (myInput.value.length >= 8)
        ) {
            isValida = true;
        } else {
            isValida = false;
        }
        return isValida;
    }

    CheckPasswordwithoutblock() {
        let isValida = true;
        // console.log("check password work")
        var myInput = document.getElementById("input_password");
        var letter = document.getElementById("letter");
        var capital = document.getElementById("capital");
        var number = document.getElementById("number");
        var length = document.getElementById("length");
        var pass1 = document.getElementById("password1");
        var lowerCaseLetters = /[a-z]/g;
        var upperCaseLetters = /[A-Z]/g;
        var numbers = /[0-9]/g;
        // When the user clicks outside of the password field, hide the message box
        myInput.onblur = function () {
            // console.log("blure work")
            document.getElementById("message").style.display = "none";
        }

        // When the user starts to type something inside the password field
        myInput.onkeyup = function () {
            // Validate lowercase letters
            //   console.log("on key up in p text")

            if (myInput.value.match(lowerCaseLetters)) {
                letter.classList.remove("invalid");
                letter.classList.add("valid");
            } else {
                letter.classList.remove("valid");
                letter.classList.add("invalid");
            }

            // Validate capital letters

            if (myInput.value.match(upperCaseLetters)) {
                capital.classList.remove("invalid");
                capital.classList.add("valid");
            } else {
                capital.classList.remove("valid");
                capital.classList.add("invalid");
            }

            // Validate numbers

            if (myInput.value.match(numbers)) {
                number.classList.remove("invalid");
                number.classList.add("valid");
            } else {
                number.classList.remove("valid");
                number.classList.add("invalid");
            }

            // Validate length
            if (myInput.value.length >= 8) {
                length.classList.remove("invalid");
                length.classList.add("valid");
            } else {
                length.classList.remove("valid");
                length.classList.add("invalid");
            }
        }
        if (myInput.value.match(lowerCaseLetters) &&
            myInput.value.match(upperCaseLetters) &&
            myInput.value.match(numbers) &&
            (myInput.value.length >= 8)
        ) {
            isValida = true;
        } else {
            isValida = false;
        }
        return isValida;
    }
    passwordValidation(password, fieldName) {
        let isValida = true;
        if (password.length < 8) {
            this.setErrorMessageForField("password should have minimum 8 characters", fieldName, 0);
            isValida = false;
        }
        if (password.length >= 10) {
            this.setErrorMessageForField("valid password", fieldName, 1);
            isValida = true;
        }

        if(!password.match(this.lowerCaseLetters)){
            this.setErrorMessageForField("lowercase letter required", fieldName,0);
            isValida = false;
        }
        if(!password.match(this.upperCaseLetters)){
            this.setErrorMessageForField("uppercase letter required", fieldName,0);
            isValida = false;
        }
        if(!password.match(this.numbers)){
            this.setErrorMessageForField("number required", fieldName,0);
            isValida = false;
        }
        if (password.includes(" ")) {
            this.setErrorMessageForField("space cannot be used", fieldName,0);
            isValida = false;
        }

        if (password === "") {
            this.setErrorMessageForField("required*", fieldName,0);
            isValida = false;
        }
        if (!password) {
            this.setErrorMessageForField("required*", fieldName,0);
            isValida = false;
        }
        return isValida;
    }
    checkpasserror(fieldName) {
        if (!this.CheckPasswordwithoutblock()) {
            this.setErrorMessageForField("Invalid password type", fieldName, 0)
        } else {
            this.setErrorMessageForField("", fieldName, 0)
        }
    }


    setErrorMessageForField(error, field, status) {
        document.getElementById(field).innerHTML = error;
    }
}