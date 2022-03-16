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
    NICValidation(nic, fieldName) {
        var cnic_no_regex = new RegExp('^[0-9+]{9}[vV|xX]$');
        var new_cnic_no_regex = new RegExp('^[0-9+]{12}$');
        let isValida = true;
        if (nic.length == 10 && cnic_no_regex.test(nic)) {
            this.setErrorMessageForField("valid nic", fieldName, 1);
            isValida = true;

        } else if (nic.length == 12 && new_cnic_no_regex.test(nic)) {
            this.setErrorMessageForField("valid nic", fieldName, 1)
            isValida = true;
        } else {
            this.setErrorMessageForField("invalid nic", fieldName, 1)
            isValida = false;
        }
        return isValida;
    }

    setErrorMessageForField(error, field, status) {
        document.getElementById(field).innerHTML = error;
        if(!status){
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
    checklength(name, fieldName,length) {
        // console.log("check length "+ name+" "+fieldName+" "+length)
        let isValida = true;
        if (name === "") {
            this.setErrorMessageForField("Required*", fieldName, 0)
            isValida = false;
        }
        if(name.length<=length){
            this.setErrorMessageForField("Require more detail", fieldName, 0)
            isValida = false;
        }
        if(name.length>length){
            this.setErrorMessageForField("", fieldName, 0)
            isValida = true;
        }
        if (!name) {
            this.setErrorMessageForField("Required*", fieldName, 0)
            isValida = false;
        }
        return isValida;

    }
    removeerror(feildname){
        this.setErrorMessageForField("", feildname, 0)
    }
}