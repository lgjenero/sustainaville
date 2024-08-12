const gameTemplateSystemNew = '''
Create imaginary profiles for 5 representatives in an imaginary state's parliament, including their parties, constituencies, and lobbying groups.
Create a list of 8 bills for each of the representatives according to their goals/lobbying_groups/constituency etc. that are supposed to lead to the representatives ultimate goal.
DO NOT use real life names and references.

One of the representative should be focused on sustainability and green transition. This will be the player's representative.
Make the representatives a bit adverserial towards the player.
Make sure you provide ALL fields that are mandatory in the output.
''';

const gameTemplateSystem = '''
Create detailed profiles for 5 representatives in an imaginary state's parliament, including their parties, constituencies, and lobbying groups.
Create a list of 8 bills for each of the representatives in the input data according to their goals/lobbying_groups/constituency etc.that are supposed to lead to the representatives ultimate goal.
DO NOT use real life names and references.

The first representative should be focused on sustainability and green transition.
Make the representatives a bit adverserial towards the player.


There will be a few places in the data where design data is needed. This is the JSON format of that data:
design: {
  body: cool_brown | orange_pink | warm_brown | off_white | pale_orange | yellow | blue_grey | orange | pink,
  eyes: eyes_amber | eyes_blue | eyes_brown | eyes_dark | eyes_green | eyes_light_brown | eyes_pale_blue,
  hair: short | bun | mid_with_wisp | long_straight | shaggy | short_with_hairpin | long_with_hairpin | short_with_midsplit | side_bangs_left | bangs | topknot | short_male | short_with_forelock | short_with_clip | side_bangs_right | short_straight | bun_with_forelock | choppy | short_formal | buzzcut | knots | short_with_sideburns | pigtails | emo | short_with_swoop | short_with_wisp,
  hairColor: ginger | blond | light_brown | dark_brown | white | grey | black,
  clothes: business_suit_blue | business_suit_brown | business_suit_gery | business_suit_green | casual_jacket_blue | casual_jacket_brown | casual_jacket_green | casual_jacket_purple | coat_beige | coat_blue | coat_brown | coat_red | dress_blue | dress_green | dress_white | expensive_suit_blue | expensive_suit_brown | expensive_suit_grey | hoodie_and_pants_blue | hoodie_and_pants_brown | hoodie_and_pants_green | hoodie_and_pants_grey | hoodie_and_pants_red | jacket_and_pants_blue | jacket_and_pants_brown | jacket_and_pants_red | jacket_and_pants_yellow | jersey_blue | onesie_orange | onesie_red | onesie_yellow | overalls_blue | overalls_brown | overalls_green | overalls_purple | robe_black | robe_grey | robe_white | shirt_and_pants_brown | shirt_and_pants_green | shirt_and_pants_grey | shirt_and_pants_purple | shirt_and_skirt_green | shirt_and_skirt_red | shirt_and_skirt_yellow | suit_and_tie_black | suit_and_tie_blue | suit_and_tie_navy | suit_and_tie_purple | suit_black | suit_blue | suit_brown | suit_green | suit_white | sweater_and_pants_blue | sweater_and_pants_brown | sweater_and_pants_purple | sweater_and_pants_red | sweater_and_pants_white | tshirt_and_pants_blue | tshirt_and_pants_brown | tshirt_and_pants_green | tshirt_and_pants_light_blue | tshirt_and_pants_olive_green | tshirt_and_pants_orange | tshirt_and_pants_pink | tshirt_and_pants_purple | tshirt_and_pants_red | tshirt_and_pants_yellow,
  faceHair: null | beard_brown | beard_white | beard_blond | beard_ginger | beard_grey | mustache_ginger | mustache_blond | mustache_brown | mustache_grey | mustache_white,
  eyewear: null | glasses_black | glasses_blue | glasses_green | glasses_grey | glasses_purple | glasses_red | monocle_brass | monocle_gold | monocle_silver,
  hat: null | beanie_blue | beanie_brown | beanie_grey | beanie_pink | beanie_yellow | hat_amber | hat_beige | hat_brown | snapback_cap_blue | snapback_cap_green | snapback_cap_pink | snapback_cap_red | snapback_cap_white | snapback_cap_yellow,
}

The response should be ONLY in JSON format that looks like this:
{
  representatives: [
    {
      id: unique Id of the representative
      name: Unique and reflective of the imaginary state's culture
      design: { design data }
      partyId: Id of the representative's party
      constituencyId: Id of the representative's constituency
      lobbyingGroupIds: [ List of Lobbying Group Ids that are tied to the representative, max 2; as a list ]
      supportBase: [ Who are their main supporters - e.g., workers, business owners, activists; as a list ]
      primaryIdeals: [ What are the primary ideals of the representative; as a list ]
      secondary Ideals: [What are the secondary ideals of the representative; as a list ]
      shortTermGoal: Specific legislative goals for the current term
      longTermGoal: Career aspirations, major reforms
      previousOccupation: E.g., Lawyer, Businessperson, Activist
      education: Level and field of education
      personalBackground: Family, hometown, personal anecdotes
      personalityTraits: [ What are the personality traits of the representative; as a list ]
      strengths: [ What are the strenghts of the representative in terms of politics, deal making, etc.; as a list ]
      weaknesses: [ What are the weaknesses of the representative in terms of politics, deal making, etc.; as a list ]
    }
  ]
  parties: [
    {
      id: unique Id of the party
      name: Distinctive names for each party
      ideologicalStance: Overall political stance and key ideologies
      keyPolicies: [ Primary policies the party supports; as a list ]
      supportBase: [ Demographics and groups that primarily support the party; as a list ]
      leader: { design data }
      officeStyle: eco | industry | money | workers
    }
  ]
  constituencies: [
    {
      id: unique Id of the constituency
      name: Unique name for each constituency
      geographicalArea: key geographic features of the constitiency
      economy: Main industries, economic status, issues, etc.
      demography: Age distribution, economic status
      keyIssues: [ Top concerns and issues facing the constituency; as a list ]
    }
  ]
  lobbyingGroups: [
    {
      id: unique Id of the lobbying group
      name: Unique name for each lobbying group
      agenda: Main objectives and interests of the group
      areasOfInfluence: Sectors or issues the group focuses on
      supportBase: [ Who supports or funds the group; as a list ]
      influenceLevel: Low, Medium, High - indicating the group's influence in politics
      financialStrength: Low, Medium, High - indicating the group's finacial strength and contributions in politics
      leader: { design data }
      officeStyle: eco | industry | money | workers
    }
  ]
  representativeBills: [
    {
      representativeId: Id of the sponsor of the bills
      bills: [
        {
          id: unique Id of the bill
          name: name of the bill
          description: What does the bill want to achieve and how (what funding, cuts, etc. are needed)
        }
      ]
    }
  ]
}
''';

const gameTemplatePrompt = 'Create data for a game set in a country like the US';

enum GameTemplateFields {
  gameData('<<<gameData>>>');

  final String tag;
  const GameTemplateFields(this.tag);
}

const gameTemplateSystemConsituencies = '''
Create imaginary constituencies for 5 representatives in an imaginary state's parliament.
They should be diverse and have distinct key issues, demograpny, geography, etc.
DO NOT use real life names and references.
''';

const gameTemplateSystemParties = '''
Create 3 imaginary parties for 5 representatives in an imaginary state's parliament.
They should be diverse and have distinct key issues, support, ideals, goals, etc.
DO NOT use real life names and references.
''';

const gameTemplateSystemLoggyingGroups = '''
Create 4 imaginary lobbying groups for 5 representatives in an imaginary state's parliament.
They should be diverse and have distinct key issues, support, agendas, goals, etc.
DO NOT use real life names and references.
''';

final gameTemplateSystemRepresentatives = '''
Create imaginary profiles for exactly 5 representatives in an imaginary state's parliament.
This is the data
${GameTemplateFields.gameData.tag}

DO NOT use real life names and references.

One of the representative must be focused on sustainability and green transition.
This will be the player's representative.
Make the representatives adverserial towards the player.
Make sure you provide ALL fields that are mandatory in the output.
Always add Id of the player representative in the results.
''';

final gameTemplateSystemBills = '''
Create bills for representatives in an imaginary state's parliament.
The bills are constructed in such a way the player will need to cooperate with different representatives to make sure to pass his bills.
This is the data
${GameTemplateFields.gameData.tag}

Create a list of 8 bills for each of the representatives according to their goals/lobbying_groups/constituency etc. that are supposed to lead to the representatives ultimate goal.
DO NOT use real life names and references.
''';
