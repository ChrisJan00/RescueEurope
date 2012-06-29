import QtQuick 1.1

Image {
    id: map
    source: "pics/europe-fit.png"

    // EUROZONE
    Country {
        id: austria
        x: 239
        y: 374
        name: "Austria"
        sourceNormal: "pics/eurozone/austria.png"
        sourceHover: "pics/eurozone/austria_hover.png"
        sourcePressed: "pics/eurozone/austria_press.png"

        debt: 100
        capacity: 10000
    }
    Country {
        id: belgium
        x: 169
        y: 336
        name: "Belgium"
        sourceNormal: "pics/eurozone/belgium.png"
        sourceHover: "pics/eurozone/belgium_hover.png"
        sourcePressed: "pics/eurozone/belgium_press.png"

        debt: 100
        capacity: 4000
    }
    Country {
        id: cyprus
        x: 478
        y: 578
        name: "Cyprus"
        sourceNormal: "pics/eurozone/cyprus.png"
        sourceHover: "pics/eurozone/cyprus_hover.png"
        sourcePressed: "pics/eurozone/cyprus_press.png"

        debt: 300
        capacity: 1000
    }
    Country {
        id: estonia
        x: 344
        y: 192
        name: "Estonia"
        sourceNormal: "pics/eurozone/estonia.png"
        sourceHover: "pics/eurozone/estonia_hover.png"
        sourcePressed: "pics/eurozone/estonia_press.png"

        debt: 130
        capacity: 3500
    }
    Country {
        id: finland
        x: 307
        y: 18
        name: "Finland"
        sourceNormal: "pics/eurozone/finland.png"
        sourceHover: "pics/eurozone/finland_hover.png"
        sourcePressed: "pics/eurozone/finland_press.png"

        debt: 149
        capacity: 5500
        newLoan: 900
    }
    Country {
        id: france
        x: 89
        y: 340
        name: "France"
        sourceNormal: "pics/eurozone/france.png"
        sourceHover: "pics/eurozone/france_hover.png"
        sourcePressed: "pics/eurozone/france_press.png"

        debt: 500
        capacity: 20000
        newLoan: 100
        loanDecay: 1.1
        interests: 1.1
        interestDecay: 1.1
        returnDelay: 4000
        decayDelay : 3000
    }
    Country {
        id: germany
        x: 203
        y: 281
        name: "Germany"
        sourceNormal: "pics/eurozone/germany.png"
        sourceHover: "pics/eurozone/germany_hover.png"
        sourcePressed: "pics/eurozone/germany_press.png"

        debt: 100
        capacity: 30000
    }
    Country {
        id: greece
        x: 366
        y: 470
        name: "Greece"
        sourceNormal: "pics/eurozone/greece.png"
        sourceHover: "pics/eurozone/greece_hover.png"
        sourcePressed: "pics/eurozone/greece_press.png"

        debt: 900
        capacity: 2000
    }
    Country {
        id: ireland
        x: 46
        y: 258
        name: "Ireland"
        sourceNormal: "pics/eurozone/ireland.png"
        sourceHover: "pics/eurozone/ireland_hover.png"
        sourcePressed: "pics/eurozone/ireland_press.png"

        debt: 300
        capacity: 2400
    }
    Country {
        id: italy
        x: 207
        y: 407
        name: "Italy"
        sourceNormal: "pics/eurozone/italy.png"
        sourceHover: "pics/eurozone/italy_hover.png"
        sourcePressed: "pics/eurozone/italy_press.png"

        debt: 300
        capacity: 2400
    }
    Country {
        id: luxembourg
        x: 201
        y: 358
        name: "Luxembourg"
        sourceNormal: "pics/eurozone/luxembourg.png"
        sourceHover: "pics/eurozone/luxembourg_hover.png"
        sourcePressed: "pics/eurozone/luxembourg_press.png"

        debt: 100
        capacity: 2400
    }
    Country {
        id: malta
        x: 295
        y: 576
        name: "Malta"
        sourceNormal: "pics/eurozone/malta.png"
        sourceHover: "pics/eurozone/malta_hover.png"
        sourcePressed: "pics/eurozone/malta_press.png"

        debt: 200
        capacity: 1000
    }
    Country {
        id: netherlands
        x: 178
        y: 306
        name: "Netherlands"
        sourceNormal: "pics/eurozone/netherlands.png"
        sourceHover: "pics/eurozone/netherlands_hover.png"
        sourcePressed: "pics/eurozone/netherlands_press.png"

        debt: 200
        capacity: 10000
    }
    Country {
        id: portugal
        x: 0
        y: 461
        name: "Portugal"
        sourceNormal: "pics/eurozone/portugal.png"
        sourceHover: "pics/eurozone/portugal_hover.png"
        sourcePressed: "pics/eurozone/portugal_press.png"

        debt: 400
        capacity: 1000
    }
    Country {
        id: slovenia
        x: 283
        y: 407
        name: "Slovenia"
        sourceNormal: "pics/eurozone/slovenia.png"
        sourceHover: "pics/eurozone/slovenia_hover.png"
        sourcePressed: "pics/eurozone/slovenia_press.png"

        debt: 400
        capacity: 2000
    }
    Country {
        id: slowakia
        x: 317
        y: 360
        name: "Slowakia"
        sourceNormal: "pics/eurozone/slowakia.png"
        sourceHover: "pics/eurozone/slowakia_hover.png"
        sourcePressed: "pics/eurozone/slowakia_press.png"

        debt: 222
        capacity: 2000
    }
    Country {
        id: spain
        x: 20
        y: 436
        name: "Spain"
        sourceNormal: "pics/eurozone/spain.png"
        sourceHover: "pics/eurozone/spain_hover.png"
        sourcePressed: "pics/eurozone/spain_press.png"

        debt: 900
        capacity: 8000
    }

    ////////////////////// EU

    Country {
        id: bulgaria
        x: 387
        y: 431
        isEuroZone: false
        name: "Bulgaria"
        sourceNormal: "pics/EU/bulgaria.png"
        sourceHover: "pics/EU/bulgaria_hover.png"
        sourcePressed: "pics/EU/bulgaria_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: czech
        x: 269
        y: 343
        isEuroZone: false
        name: "Czech Republic"
        sourceNormal: "pics/EU/czech.png"
        sourceHover: "pics/EU/czech_hover.png"
        sourcePressed: "pics/EU/czech_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: denmark
        x: 227
        y: 238
        isEuroZone: false
        name: "Denmark"
        sourceNormal: "pics/EU/denmark.png"
        sourceHover: "pics/EU/denmark_hover.png"
        sourcePressed: "pics/EU/denmark_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: great_britain
        x: 78
        y: 183
        isEuroZone: false
        name: "United Kingdom"
        sourceNormal: "pics/EU/great_britain.png"
        sourceHover: "pics/EU/great_britain_hover.png"
        sourcePressed: "pics/EU/great_britain_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: hungary
        x: 312
        y: 375
        isEuroZone: false
        name: "Hungary"
        sourceNormal: "pics/EU/hungary.png"
        sourceHover: "pics/EU/hungary_hover.png"
        sourcePressed: "pics/EU/hungary_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: latvia
        x: 340
        y: 219
        isEuroZone: false
        name: "Latvia"
        sourceNormal: "pics/EU/latvia.png"
        sourceHover: "pics/EU/latvia_hover.png"
        sourcePressed: "pics/EU/latvia_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: lithuania
        x: 341
        y: 245
        isEuroZone: false
        name: "Lithuania"
        sourceNormal: "pics/EU/lithuania.png"
        sourceHover: "pics/EU/lithuania_hover.png"
        sourcePressed: "pics/EU/lithuania_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: poland
        x: 284
        y: 280
        isEuroZone: false
        name: "Poland"
        sourceNormal: "pics/EU/poland.png"
        sourceHover: "pics/EU/poland_hover.png"
        sourcePressed: "pics/EU/poland_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: romania
        x: 359
        y: 368
        isEuroZone: false
        name: "Romania"
        sourceNormal: "pics/EU/romania.png"
        sourceHover: "pics/EU/romania_hover.png"
        sourcePressed: "pics/EU/romania_press.png"

        debt: 900
        capacity: 8000
    }

    Country {
        id: sweden
        x: 253
        y: 49
        isEuroZone: false
        name: "Sweden"
        sourceNormal: "pics/EU/sweden.png"
        sourceHover: "pics/EU/sweden_hover.png"
        sourcePressed: "pics/EU/sweden_press.png"

        debt: 900
        capacity: 8000
    }
}
