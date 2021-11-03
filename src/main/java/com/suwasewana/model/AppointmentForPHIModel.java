package com.suwasewana.model;

public class AppointmentForPHIModel {
    AppointmentModel appointment;
    AppointmentTypeModel appointmentType;
    User user;

    public AppointmentForPHIModel( AppointmentModel appointment,
            AppointmentTypeModel appointmentType,
            User user ){
        this.appointment = appointment;
        this.appointmentType = appointmentType;
        this.user = user;
    }

}