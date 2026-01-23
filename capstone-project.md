# Master of ICT capstone project
My 'Dealing with the Devils: Fairness Challenges of a 19-Team AFL Fixture' dissertation (in progress) addresses a complex combinatorial optimisation challenge to achieve fairness in Australian Football League (AFL) match scheduling. 

## Target audience
The dissertation is being prepared for submission to the University of the Sunshine Coast as part of a Master of Information and Communications Technology.  
Stakeholders are the AFL, its match broadcast partners, match venues, participating clubs and players, and their supporters.

## Problem definition
Rather than playing a single (17-match) or dual (34-match) round-robin, the 18 AFL teams play 11 opponents once and six opponents twice; i.e., 23 matches per team per season.  
Trillions of combinations exist to pair opponents for repeat match-ups. Pairings of repeat opponents can fuel debate on each team's relative advantages and disadvantagess.  
Myriad scheduling constraints apply, some of which are listed below for reference.  
The 2028 addition of the Tasmania Devils, making an uneven 19 teams, will exacerbate scheduling difficulty.

## Proposal
I will quantify scheduling advantage in terms of teams' home ground advantage, player welfare, strength of schedule (i.e., opponent strength), and travel burden, by applying a weighted-sum minimisation model.  
I will analyse interdependent data sets to establish equity baselines, using historical match data from seasons 2012 to 2025, to inform recommendations for scheduling changes.  
Methodology will include multi-objective optimisation with a Pareto frontier; e.g., balancing teams' total travel burdens against runs of consecutive home or away games, or breaks. 

## Scheduling constraints 
Constraints impact the distribution of marquee matches, venue assignments, broadcast slots, and repeat match-ups.  
'Soft' constraints  are preferred but not mandatory, and include the 'weighted rule', where the previous season's ladder placings dictate team groupings for repeat match-up allocations.  
'Hard' constraints must be incorporated to the schedule, and include the following:  
**Home ground advantage:**  
* Maximum 1 home match per round in non-Victorian states.
* Minimum 43 matches at Marvel Stadium and 47 at the MCG.
* Minimum 1 home match against either Collingwood or Essendon.
* Minimum 5 matches in Victoria and 1 at the MCG.
**Player welfare:**
* Minimum 5 clear days between matches.
* Minimum 6 rounds must separate repeat visits to WA and to Queensland.
* Teams must not play 3 consecutive away (or home) games.
**Strength of schedule:**
* Marquee protection: Grand final rematches, traditional rivalries, and blockbusters such as ANZAC Day matches, are mandatory.
* Minimum 6 rounds between repeat match-ups, with the second meeting not to occur before Round 11.

**Travel burden:**
* Every team must travel to WA at least once.
* Non-Victorian teams that travelled in the final round of the previous season must not travel in the final round of the current season.
* Teams must not play consecutive matches in two different 'away states'.
* Victorian teams must play outside Victoria a minimum of 5 times.
  

Portfolio updated 23/01/2026