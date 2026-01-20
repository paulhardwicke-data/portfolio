# Master of ICT capstone project
My 'Dealing with the Devils: Fairness Challenges of a 19-Team AFL Fixture' dissertation (in progress) addresses a complex combinatorial optimisation challenge of achieving fairness in Australian Football League (AFL) match scheduling. 

## Audiences
* Prepared for submission to the University of the Sunshine Coast for a Master of Information and Communications Technology.
* Stakeholders: The AFL, its match broadcast partners, match venues, participating clubs, and their supporters.
* Potential employers may wish to skip to the 'Employment relevance' section below for information on how my capstone project addresses Career Development Theory and Skills Framework for the Information Age (SFIA) capabilities.

## Problem definition
Rather than a simple single (17-match) or dual (34-match) round-robin season, the current 18 AFL teams play 11 opponents once and six opponents twice, for a total of 23 matches each. Trillions of possible combinations exist to select the opponents each team will play in repeat match-ups. Scheduling constraints and decisions can fuel debate and distrust in the AFL executive. The 2028 addition of the Tasmania Devils, making an uneven 19 teams, will exacerbate scheduling difficulty.

## Proposal
I will apply a weighted-sum minimisation model to quantify scheduling advantage in terms of teams' home ground advantage, player welfare, strength of schedule (relative strength of opponents), and travel burden. I will analyse interdependent data sets, including known scheduling constraints, to establish equity baselines, using historical match data from seasons 2012 to 2025. Methodology will include multi-objective optimisation with a Pareto frontier; e.g., offsetting teams' total travel burdens against runs of consecutive home or away games, or breaks. 

## Constraints 
### Commercial requirements
* At least 43 matches played at Marvel Stadium, and at least 47 matches at the MCG, per season.
* Each team must have at least one home match against either Collingwood or Essendon.
* In non-Victorian states, broadcasts involving home-state teams must not overlap, and a maximum of one home match is played per round.

### Home ground advantage
* All teams play a minimum of five matches in Victoria and at least one at the MCG.
* Teams play no more than two home/away games in a three-week span.

### Player welfare
* A minimum of five clear days between matches.
* Teams must not play three consecutive away (or home) games.

### Strength of schedule
Marquee protection: Grand final rematches, traditional rivalries, and blockbusters such as ANZAC Day matches, are mandatory.
Teams must not meet for the first and only time in the final round of a season. 
There must be at least six rounds between repeat match-ups, with the second meeting not to occur before Round 11.
Weighted rule: Previous season placings dictate team groupings into top, middle, and bottom third cohorts for repeat match-up allocation.

### Travel burden
* At least six rounds must separate repeat visits to WA, and to Queensland, by interstate visitors.
* Every team must travel to WA at least once.
* Non-Victorian teams that travelled in the final round of the previous season must not travel in the final round of the current season.
* Teams must not play consecutive matches in two different 'away states'.
* Victorian teams must play outside Victoria a minimum of five times.

## Employment relevance
### Career Development Theory
This project demonstrates the following planned happenstance traits:
* Adaptability (SFIA: HSIN): Solving the 19th team problem' via multi-objective optimisation, mirroring my ability to adapt to requirements such as migrating legacy web content to SharePoint CMS.
* Optimism (SFIA: GOVN): Approaching subjective fairness with the belief it can be quantified, while addressing the gap between my current skills and a preference for data management work.
* Persistence (SFIA: QUAS): Compiling 14 seasons of data with meticulous attention to detail, which is reflected in maintaining distinction-level GPAs while working full-time.

### SFIA capabilities
* Analytical techniques (ANLY): Applying Pareto frontier analysis to conflicting objectives.
* Information governance (GOVN): Ensuring a single source of truth for marquee protections and the weighted rule.
* Quality assurance (QUAS): Validating the schedule against defined standards and constraints.
* Systems development (HSIN): Engineering transition from an 18-team to a 19-team configuration with multi-bye rounds.

20/01/2026