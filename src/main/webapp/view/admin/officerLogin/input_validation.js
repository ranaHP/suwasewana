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

}