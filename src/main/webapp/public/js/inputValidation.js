class FormInputValidation {
     mobileValidation(mobile, fieldName) {
        const regExp = /[a-zA-Z]/g;
        if (mobile.length !== 10) {
            this.setErrorMessageForField("Invalid Mobile Number", fieldName)
        }
        if (mobile.length === 10) {
            this.setErrorMessageForField("Valid Mobile Number", fieldName)
        }
        if(!mobile.startsWith("0")) {
            this.setErrorMessageForField("Mobile number must start with 0", fieldName)
        }

        if (regExp.test(mobile) || mobile.includes(" ")) {
            this.setErrorMessageForField("Characters or space cannot be used", fieldName)
        }
        if (mobile === "") {
            this.setErrorMessageForField("Required", fieldName)
        }
         if (!mobile ) {
             this.setErrorMessageForField("Required", fieldName)
         }

    }

    setErrorMessageForField(error, field) {
        document.getElementById(field).innerHTML = error;
    }
}