pragma solidity^0.4.24;

contract AlphaHealthSurvey {

    struct SurveyAnswer {
        string wallet;
        // age, fever, breathing, cough, sore_throat, body_aches, diarrhea, none_symtoms;
        uint[8] symptoms;

        // contact_covid, international_travel, live_visited_covid, nursing, health_care_work
        uint[5] exposures;

        // chronic_lung_asthma, heart_failure, diabetes, neurologic, weak_immune_system,
        // dialisys, cirrhosis_liver, pregnacy, obesity, none_conditions;
        uint[10] conditions;
    }

    address person;

    constructor() public {
        person = msg.sender;
    }

    modifier onlyperson() {
        if (msg.sender == person) {
            _;
        }
    }

    SurveyAnswer[] public answers;

    function registerAnswer(
        string _wallet,
        uint[8] _symptoms,
        uint[5] _exposures,
        uint[10] _conditions) public onlyperson {
            answers.push(SurveyAnswer(_wallet, _symptoms, _exposures, _conditions));
        }
}
