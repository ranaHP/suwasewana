class FormInputValidation {
    lowerCaseLetters = /[a-z]/g;
    numbers = /[0-9]/g;
    upperCaseLetters = /[A-Z]/g;

    mobileValidation(mobile, fieldName) {
        const regExp = /[a-zA-Z]/g;
        let isValida = true;
        if (mobile.length !== 10) {
            this.setErrorMessageForField("invalid mobile number", fieldName, 0)
            isValida = false;
        }
        if (mobile.length === 10) {
            this.setErrorMessageForField("valid mobile number", fieldName, 1)
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



//    for nic validation
    nicValidation(name, fieldName) {
        let NICNo=name.value;
        let isValida = true;
        var dayText = 0;
        var year = "";
        var month = "";
        var day = "";
        var gender = "";
        const regExp = /[a-zA-Z]/g;
        // console.log(regExp.test(NICNo.substr(0, 9)));
        if (NICNo.length != 10 && NICNo.length != 12) {
            // console.log("if")
            isValida = false;
            this.setErrorMessageForField("Invalid NIC NO", fieldName, 0)


        } else if (NICNo.length == 10 && regExp.test(NICNo.substr(0, 9)) ) {
            // console.log("else if")
            this.setErrorMessageForField("Invalid NIC NO", fieldName, 0)
            isValida = false;
        }
        else {
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
                // $("#error").html("Invalid NIC NO");
                this.setErrorMessageForField("Invalid NIC NO", fieldName, 0)
            } else {

                //Month
                if (dayText > 335) {
                    day = dayText - 335;
                    month = "December";
                }
                else if (dayText > 305) {
                    day = dayText - 305;
                    month = "November";
                }
                else if (dayText > 274) {
                    day = dayText - 274;
                    month = "October";
                }
                else if (dayText > 244) {
                    day = dayText - 244;
                    month = "September";
                }
                else if (dayText > 213) {
                    day = dayText - 213;
                    month = "Auguest";
                }
                else if (dayText > 182) {
                    day = dayText - 182;
                    month = "July";
                }
                else if (dayText > 152) {
                    day = dayText - 152;
                    month = "June";
                }
                else if (dayText > 121) {
                    day = dayText - 121;
                    month = "May";
                }
                else if (dayText > 91) {
                    day = dayText - 91;
                    month = "April";
                }
                else if (dayText > 60) {
                    day = dayText - 60;
                    month = "March";
                }
                else if (dayText < 32) {
                    month = "January";
                    day = dayText;
                }
                else if (dayText > 31) {
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
    nameValidation(name, fieldName) {

        let isValida = true;
        if (name === "") {
            this.setErrorMessageForField("required*", fieldName, 0)
            isValida = false;
        }
        if(name.length>0){
            this.setErrorMessageForField(" ", fieldName, 0)
            isValida = true;
        }

        if (!name) {
            this.setErrorMessageForField("required*", fieldName, 0)
            isValida = false;
        }
        return isValida;

    }

    setErrorMessageForField(error, field, status) {
        document.getElementById(field).innerHTML = error;
        if(status){
            document.getElementById(field).classList.add("form-field-success");
            document.getElementById(field).classList.remove("form-field-error");
        }else{
            document.getElementById(field).classList.remove("form-field-success");
            document.getElementById(field).classList.add("form-field-error");
        }
        // status ? document.getElementById(field).classList.add("form-field-success") : document.getElementById(field).style.color = "red";
    }
}