Feature: 
	In order to understand the profile of establishments in a selected authority
	I want to see how food hygiene ratings are distributed by percentage

  	Scenario: Viewing establishment ratings for a selected local authority

		Given a local authority with establishment ratings as follows:

			| Establishment | Rating |
			| A 			| 5		 |
			| B 			| 5 	 |
			| C 			| 1 	 |
			| D 			| Exempt |

		When I select that local authority
		Then I should see a tabular breakdown as follows:

			| Rating 		| Percentage |
			| 5-star		|	50%		 |
			| 4-star		| 	0%		 |
			| 3-star		| 	0%		 |
			| 2-star		| 	0%		 |
			| 1-star		|	25%		 |
			| Exempt		|	25%		 |