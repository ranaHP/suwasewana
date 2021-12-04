// "use strict";
class Calender {
    container_name = "";
    date = new Date();
    current_month = this.date.getMonth() + 1;
    current_year = this.date.getFullYear();
    month_name = ["January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ];
    event = []

    constructor(contaienrName) {
        this.container = document.getElementById(contaienrName);
        this.container_name = contaienrName;
        this.init();

    }
    setEventData( events ){
        this.event=events;
        this.addCalenderEvents();
    }

    init() {
        this.container.innerHTML = '';
        let calender = document.createElement('div');
        calender.classList.add('calender');
        calender.appendChild(this.createMothYear());
        calender.appendChild(this.createDaysContainer());
        this.container.appendChild(calender);
        this.addCalenderEvents();
    }


    getDateCount(year, month) {
        return 32 - new Date(year, month - 1, 32).getDate();
    }

    getStartDate(year, month) {
        return (new Date(year, month - 1)).getDay();
    }

    createMothYear() {
        // create month year container
        let month_year_container = document.createElement('div');
        month_year_container.classList.add("month-year-container");
        // create left arrow button

        // let arrow_left = document.createElement('i');
        // arrow_left.setAttribute("data-feather" ,"arrow-left-circle" );
        let arrow_left = document.createElement('i');
        // arrow_right.setAttribute("data-feather" ,"arrow-right-circle" );
        arrow_left.classList.add("pre-nxt-month-btn");
        arrow_left.setAttribute('onclick', this.container_name + '.previousMonth()');
        arrow_left.innerText = '<';
        // create month year title
        let month_year_title = document.createElement('span');
        month_year_title.innerText = this.month_name[this.current_month - 1] + " " + this.current_year;
        // create right arrow button
        let arrow_right = document.createElement('i');
        // arrow_right.setAttribute("data-feather" ,"arrow-right-circle" );
        arrow_right.classList.add("pre-nxt-month-btn");
        arrow_right.innerText = '>';
        arrow_right.setAttribute("onclick", this.container_name + ".nextMonth()")
        // append to month year contaienr
        month_year_container.appendChild(arrow_left);
        month_year_container.appendChild(month_year_title);
        month_year_container.appendChild(arrow_right);

        // return moth year container
        return month_year_container;

    }

    createDaysContainer() {

        // create days container
        let days_container = document.createElement('div');
        days_container.classList.add("days-container"); // add class
        // create day names set
        let days_names = document.createElement("div");
        days_names.classList.add("days-name");

        let dayName = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
        dayName.map(m => {
            // create day name
            let name = document.createElement("div");
            name.innerText = m;
            name.classList.add("d-name");
            // append to days name contaienr
            days_names.appendChild(name);
        });

        // append days name to day container
        days_container.appendChild(days_names);
        days_container.appendChild(this.createDays());
        // return days name container
        return days_container;
    }

    createDays() {
        // carete div for days contaienr
        let days = document.createElement('div');
        days.classList.add('days');
        let startDate = this.getStartDate(this.current_year, this.current_month);
        let lastMonthLastDate = this.getDateCount(this.current_year, this.current_month - 1);
        let currentDate = 1;
        let nextMonthDate = 1;
        let temp = startDate - 1;
        for (let i = 1; i <= 35; i++) {
            // crete div for date
            let day = document.createElement('div');
            day.classList.add("date");
            if (i <= startDate) {
                // set day number
                day.innerText = lastMonthLastDate - temp;
                temp--;
                // add dynamic id
                // day.id = "date"+i;
            } else if (i > startDate && currentDate <= this.getDateCount(this.current_year, this.current_month)) {
                // set day number
                day.innerText = currentDate;
                // add dynamic id
                day.id = "date" + currentDate;

                // check date to today
                if (currentDate == this.date.getDate() && this.current_month == this.date.getMonth() + 1) {
                    day.classList.add("today");
                } else {
                    day.classList.add("currentMonthday");
                }
                currentDate++;

            } else {
                // set day number
                day.innerText = nextMonthDate;
                nextMonthDate++;
                // add dynamic id
                // day.id = "date"+i;
            }


            // append date to day conatiner
            days.appendChild(day);

        }

        // return days
        return days;
    }

    addCalenderEvents() {
        this.event.map(eventItem => {
            console.log(this.current_month);
            if (this.current_month == eventItem.month && this.current_year == eventItem.year) {
                let day = document.getElementById("date" + eventItem.date);
                // console.log(JSON.stringify([eventItem]))
                day.setAttribute("onclick", 'popup.showCalenderEnvetPopup(' + JSON.stringify([eventItem]) + ')');
                // day.setAttribute("onclick", "asdasd('" + eventItem  + "')");
                let badge = document.createElement('div');
                badge.classList.add('badge');
                badge.innerText = eventItem.events.length;
                day.appendChild(badge);
            }
        })
    }

    nextMonth() {
        if (this.current_month > 11) {
            this.current_year++;
            this.current_month = 1
        } else {
            this.current_month++;
        }
        this.init();
    }

    previousMonth() {
        if (this.current_month < 2) {
            this.current_year--;
            this.current_month = 12
        } else {
            this.current_month--;
        }
        this.init();
    }

    rangeSelect(year, startMonth, endMonth, startDate, endDate) {

        this.event.map(eventItem => {
            console.log(this.current_month);
            if (this.current_month == eventItem.month && this.current_year == eventItem.year) {
                let day = document.getElementById("date" + eventItem.date);
                // console.log(JSON.stringify([eventItem]))
                day.setAttribute("onclick", 'popup.showCalenderEnvetPopup(' + JSON.stringify([eventItem]) + ')');
                // day.setAttribute("onclick", "asdasd('" + eventItem  + "')");
                let badge = document.createElement('div');
                badge.classList.add('badge');
                badge.innerText = eventItem.events.length;
                day.appendChild(badge);
            }
        })
    }
}

