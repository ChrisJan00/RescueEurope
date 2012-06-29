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

        function restartCountry() {
            debt = 100
            capacity = Math.random()*2000 // ocapacity = 10000;
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay= 0.1
            returnDelay = 4000
            decayDelay = 3000

            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }


    }
    Country {
        id: belgium
        x: 169
        y: 336
        name: "Belgium"
        sourceNormal: "pics/eurozone/belgium.png"
        sourceHover: "pics/eurozone/belgium_hover.png"
        sourcePressed: "pics/eurozone/belgium_press.png"

        function restartCountry() {
            debt = 100
            capacity = Math.random()*2000 // ocapacity = 4000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: cyprus
        x: 478
        y: 578
        name: "Cyprus"
        sourceNormal: "pics/eurozone/cyprus.png"
        sourceHover: "pics/eurozone/cyprus_hover.png"
        sourcePressed: "pics/eurozone/cyprus_press.png"

        function restartCountry() {
            debt = 300
            capacity = Math.random()*2000 // ocapacity = 1000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: estonia
        x: 344
        y: 192
        name: "Estonia"
        sourceNormal: "pics/eurozone/estonia.png"
        sourceHover: "pics/eurozone/estonia_hover.png"
        sourcePressed: "pics/eurozone/estonia_press.png"

        function restartCountry() {
            debt = 130
            capacity = Math.random()*2000 // ocapacity = 3500
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: finland
        x: 307
        y: 18
        name: "Finland"
        sourceNormal: "pics/eurozone/finland.png"
        sourceHover: "pics/eurozone/finland_hover.png"
        sourcePressed: "pics/eurozone/finland_press.png"

        function restartCountry() {
            debt = 149
            capacity = Math.random()*2000 // ocapacity = 5500
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: france
        x: 89
        y: 340
        name: "France"
        sourceNormal: "pics/eurozone/france.png"
        sourceHover: "pics/eurozone/france_hover.png"
        sourcePressed: "pics/eurozone/france_press.png"

        function restartCountry() {
            debt = 500
            capacity = Math.random()*2000 // ocapacity = 20000
            newLoan = 100
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: germany
        x: 203
        y: 281
        name: "Germany"
        sourceNormal: "pics/eurozone/germany.png"
        sourceHover: "pics/eurozone/germany_hover.png"
        sourcePressed: "pics/eurozone/germany_press.png"

        function restartCountry() {
            debt = 100
            capacity = Math.random()*2000 // ocapacity = 30000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: greece
        x: 366
        y: 470
        name: "Greece"
        sourceNormal: "pics/eurozone/greece.png"
        sourceHover: "pics/eurozone/greece_hover.png"
        sourcePressed: "pics/eurozone/greece_press.png"

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 2000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: ireland
        x: 46
        y: 258
        name: "Ireland"
        sourceNormal: "pics/eurozone/ireland.png"
        sourceHover: "pics/eurozone/ireland_hover.png"
        sourcePressed: "pics/eurozone/ireland_press.png"

        function restartCountry() {
            debt = 300
            capacity = Math.random()*2000 // ocapacity = 2400
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: italy
        x: 207
        y: 407
        name: "Italy"
        sourceNormal: "pics/eurozone/italy.png"
        sourceHover: "pics/eurozone/italy_hover.png"
        sourcePressed: "pics/eurozone/italy_press.png"

        function restartCountry() {
            debt = 300
            capacity = Math.random()*2000 // ocapacity = 2400
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: luxembourg
        x: 201
        y: 358
        name: "Luxembourg"
        sourceNormal: "pics/eurozone/luxembourg.png"
        sourceHover: "pics/eurozone/luxembourg_hover.png"
        sourcePressed: "pics/eurozone/luxembourg_press.png"

        function restartCountry() {
            debt = 100
            capacity = Math.random()*2000 // ocapacity = 2400
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: malta
        x: 295
        y: 576
        name: "Malta"
        sourceNormal: "pics/eurozone/malta.png"
        sourceHover: "pics/eurozone/malta_hover.png"
        sourcePressed: "pics/eurozone/malta_press.png"

        function restartCountry() {
            debt = 200
            capacity = Math.random()*2000 // ocapacity = 1000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: netherlands
        x: 178
        y: 306
        name: "Netherlands"
        sourceNormal: "pics/eurozone/netherlands.png"
        sourceHover: "pics/eurozone/netherlands_hover.png"
        sourcePressed: "pics/eurozone/netherlands_press.png"

        function restartCountry() {
            debt = 200
            capacity = Math.random()*2000 // ocapacity = 10000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: portugal
        x: 0
        y: 461
        name: "Portugal"
        sourceNormal: "pics/eurozone/portugal.png"
        sourceHover: "pics/eurozone/portugal_hover.png"
        sourcePressed: "pics/eurozone/portugal_press.png"

        function restartCountry() {
            debt = 400
            capacity = Math.random()*2000 // ocapacity = 1000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: slovenia
        x: 283
        y: 407
        name: "Slovenia"
        sourceNormal: "pics/eurozone/slovenia.png"
        sourceHover: "pics/eurozone/slovenia_hover.png"
        sourcePressed: "pics/eurozone/slovenia_press.png"

        function restartCountry() {
            debt = 400
            capacity = Math.random()*2000 // ocapacity = 2000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: slowakia
        x: 317
        y: 360
        name: "Slowakia"
        sourceNormal: "pics/eurozone/slowakia.png"
        sourceHover: "pics/eurozone/slowakia_hover.png"
        sourcePressed: "pics/eurozone/slowakia_press.png"

        function restartCountry() {
            debt = 222
            capacity = Math.random()*2000 // ocapacity = 2000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
    Country {
        id: spain
        x: 20
        y: 436
        name: "Spain"
        sourceNormal: "pics/eurozone/spain.png"
        sourceHover: "pics/eurozone/spain_hover.png"
        sourcePressed: "pics/eurozone/spain_press.png"

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

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

        function restartCountry() {
            debt = 900
            capacity = Math.random()*2000 // ocapacity = 8000
            newLoan = 900
            loanDecay = 10
            interests = 1.1
            interestDecay = 0.1
            returnDelay = 4000
            decayDelay = 3000
            // internal
            budget = capacity
            rescued = false
            toReturn = 0
            health = Math.random() * 20
            edu = Math.random() * 8
            science = Math.random() * 4
            unempl = Math.random() * 20
            pension = Math.random() * 20
            canCut = true
        }

    }
}
