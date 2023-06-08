sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'RiskManagementLJ/Risks/test/integration/FirstJourney',
		'RiskManagementLJ/Risks/test/integration/pages/risksList',
		'RiskManagementLJ/Risks/test/integration/pages/risksObjectPage'
    ],
    function(JourneyRunner, opaJourney, risksList, risksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('RiskManagementLJ/Risks') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTherisksList: risksList,
					onTherisksObjectPage: risksObjectPage
                }
            },
            opaJourney.run
        );
    }
);