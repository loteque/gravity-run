# In-Person Playtest Evidence Report

Date compiled: 2026-08-28

## Purpose

This document preserves the developer's retrospective observations from in-person playtests of Gravity Run / Commander Quacker. It is an evidence record, not a design verdict. Observations, player-reported reactions, developer interpretations, and open questions are separated so later decisions do not silently turn memory into fact.

## Evidence source and limitations

The evidence was reconstructed through a structured 18-question interview on 2026-08-28, including optional clarifying follow-ups.

Known test populations:

- Portland Retro Gaming Expo (PRGE), approximately two years before this interview: about 30 observed players, including men, women, and children.
- Bar playtests: about 15 additional observed players, mostly adult men; some were sober and some intoxicated.

The developer generally presented the then-current build rather than preserving a frozen, versioned playtest build. Exact build identities and exact per-player counts were not recorded. Most numerical statements below are therefore retrospective estimates, not instrumented measurements.

The developer deliberately let players discover the game cold and generally remained silent during play. Friends were discouraged from teaching each other while a test was in progress. This strengthens evidence about what the game itself communicated, but the developer's physical presence and the social/event settings could still affect behavior and verbal feedback.

## High-level evidence summary

The playtests support a mixed but promising picture:

- Basic movement and shooting were understood almost immediately.
- Controls were repeatedly perceived as responsive and easy to pick up.
- Art, visual presentation, characters, dialogue, and the Commander Quacker premise landed consistently well.
- Most players voluntarily replayed at least once after dying.
- A small, curious subset discovered surprisingly creative uses of the gravity system.
- The gravity system was often discovered accidentally and was sometimes mistaken for controller failure or a game bug.
- The upgrade interface was the most consistent comprehension failure.
- The black-hole screen-glitch effect caused immediate nausea, dizziness, or sensory overload in multiple players and caused affected players to look away and put down the controller.
- Players repeatedly showed curiosity about additional enemies, weapons, upgrades, and other things to discover.

These playtests establish real external engagement and meaningful usability problems. They do not establish commercial demand, long-term retention, willingness to pay, or family-sustaining revenue.

## Observations by topic

### 1. Attraction and self-selection

Observed:

- More experienced or "hardcore" players sometimes noticed the game from a distance, watched another player, and asked to play next without prompting.
- This occurred at both PRGE and bars.
- More casual players often appeared interested but hesitant. Some tried the game after encouragement from friends or the developer.
- Bar players generally approached the game in a more socially enthusiastic, low-stakes way.
- PRGE players arrived more ready to critique their experience and the game.

Interpretation:

- The game can attract experienced players before direct explanation.
- The genre or presentation may signal difficulty to casual players.
- The bar and expo populations should not be treated as one homogeneous sample.

Unresolved:

- Whether hesitation is primarily caused by shmup genre expectations, the upgrade UI, visual density, or another factor.

### 2. First-minute comprehension

Observed:

- The developer remembers essentially all players immediately understanding how to move and shoot.
- Players immediately treated asteroids as obstacles and the black hole as a hazard to avoid.
- Players did not require a tutorial or explanatory text to begin basic play.
- PRGE players often softened their initially critical posture almost immediately after interacting with the controls; comments described the controls as snappy and the game as something they could simply pick up and play.

Interpretation:

- The conventional arcade/shmup layer communicates itself very effectively.
- Basic control feel is one of the project's strongest demonstrated assets and should be protected from unnecessary redesign.

### 3. Gravity discovery and comprehension

Observed:

- Only some players discovered or deliberately engaged with the gravity system.
- Gravity discovery was described as accidental.
- Players who noticed the effect sometimes asked the developer whether gravity was actually present in the game. The developer withheld confirmation until after the playtest.
- Some players responded by staying farther away from asteroids.
- A smaller subset experimented creatively, including attempts to orbit asteroids.
- Discovery sometimes generated an immediate "wow" reaction.
- Only the most curious and risk-tolerant players tended to persist with gravity experimentation.
- Failed attempts to judge a route through a gravity zone could result in asteroid collision, health loss, or death.
- There was no direct or deliberately designed reward for successful gravity engagement in the tested build.
- Some players did not recognize gravity as intentional at all and instead thought the controller was broken or the game was glitching.

Interpretation:

- Gravity has evidence of experiential novelty and emergent depth, but weak legibility.
- The current risk/reward structure discourages much of the audience from exploring the game's most distinctive mechanic.
- There is a meaningful distinction between discovering gravity and understanding that gravity is a system worth mastering.

Strong competing explanation:

- The creative behavior may mainly reflect the personality of a small group of highly exploratory players rather than a broadly compelling mechanic.

Evidence that would weaken confidence in gravity as a core differentiator:

- After improved legibility, most players still avoid gravity rather than use it.
- Successful gravity maneuvers do not improve survival, positioning, scoring, or player enjoyment.
- Players understand the system but still prefer conventional shooting and dodging.

### 4. Upgrade-system behavior

Observed:

- The upgrade interface intimidated many casual players.
- Skilled players tended to click around freely and approach it as a puzzle, without much fear of making a mistake.
- Casual players showed long pauses, asked the developer questions, clicked more slowly, and sometimes made the system work accidentally without understanding what had happened.
- A handful of players "solved" the interface and strongly enjoyed that discovery experience.
- Some of those players compared the experience to Fez.
- When asked to identify the single most common failure across tests, the developer identified the upgrade screen.
- When asked for the most common unprompted criticism, the developer again identified lack of upgrade-system clarity.

Interpretation:

- Opacity is not merely incidental; it is a central feature of the current upgrade experience.
- For a subset of players, solving that opacity is enjoyable.
- For many casual players, the same opacity is a barrier rather than a puzzle.
- The design problem is not necessarily "make upgrades obvious." It is to preserve discovery while eliminating accidental success and incomprehensible interaction.

Open design tension:

- The upgrade system was intentionally opaque. The playtests do not yet establish whether that design intent serves the broader game.

### 5. Upgraded-weapon discoverability

Observed:

- Players had trouble discovering which button fired newly acquired upgraded weapons.

Interpretation:

- A reward can become functionally invisible after acquisition if the player does not know how to activate it.
- This likely weakens the motivational value of upgrades independently of the upgrade-selection puzzle itself.

### 6. Replay and learning after death

Observed:

- Almost everyone was remembered as immediately trying again at least once after dying.
- Some casual players handed the controller to a more skilled friend, watched, and then tried again afterward.
- Skilled players tended to jump back in and deliberately try different approaches.
- Casual players were mixed: some tried new things, while others repeated the same strategy while attempting to execute it better.
- A small subset made several attempts and spent much of that time experimenting with gravity.
- Some players said that additional weapons or enemies would motivate them to jump back in and get farther.

Interpretation:

- Death generally did not end engagement on first contact.
- The game supports both mastery-driven retry behavior and experimentation-driven retry behavior.
- Observation of a skilled player may function as informal onboarding for casual players.

Limitation:

- "Almost everyone" is retrospective. It should not be converted into a fabricated replay percentage.

### 7. Session length and stopping behavior

Observed:

- Most players played for several minutes.
- Players often experimented with falling into the black hole or eventually died from repeated asteroid hits.
- Many played a second run; some played about three runs.
- After the second or third death, players usually stopped.
- The developer's impression was that some were becoming a little bored while others simply seemed satisfied with the few minutes they had played.
- Players knew they were playing a short demo.

Interpretation:

- The observed stop point may reflect both limited content and the expectations set by a demo context.
- Boredom cannot be dismissed simply because the build was known to be a demo.

Strong competing explanation:

- Short sessions may be primarily an artifact of expo/bar context and demo expectations rather than insufficient retention.

### 8. Content curiosity

Observed:

- Some players explicitly wanted to see more or different weapons and enemies.
- The developer's strongest behavioral impression from the tests was that players kept playing partly because they expected more content and more things to experiment with.
- Players appeared interested in discovering additional upgrade possibilities.

Interpretation:

- Curiosity about what comes next appears to be an important motivational axis.
- Current evidence favors adding carefully chosen experiential variety over adding systems merely because infrastructure exists for them.

### 9. Art, characters, humor, and story

Observed:

- The developer remembers all players smiling or laughing at the dialogue.
- Only one player was remembered as skipping through it.
- Players consistently commented positively on the art.
- The subtitle "The Quack in the Spacetime Continuum" reliably received laughs.
- Players specifically found the space-duck premise humorous.
- When asked for the most common unprompted compliment, the developer identified artwork, graphics, special effects, and visual/UI presentation.

Interpretation:

- Commander Quacker, the visual direction, and the game's humor are among the clearest positive signals from the tests.
- Behavioral evidence such as laughter and low dialogue-skipping is stronger than verbal praise alone.

Limitation:

- The developer was physically present, so direct compliments may be socially inflated.

### 10. Black-hole glitch effect

Observed:

- Multiple women reported that the black-hole screen-glitch effect was too strong and unpleasant.
- Reported symptoms included nausea, dizziness, and sensory overload.
- Reactions were immediate.
- Affected players looked away and put the controller down.
- At least some people who did not want to play were deterred specifically by this effect.

Interpretation:

- This is not cosmetic feedback. The effect has demonstrated the ability to terminate play immediately.
- The current implementation is a high-severity accessibility and comfort problem.

Caution:

- The observed gender pattern is worth preserving as part of the historical record, but the sample is too small and informal to conclude that the effect intrinsically affects women more strongly.

### 11. Off-screen asteroid state

Observed:

- Asteroids can sometimes become stuck off the right side of the screen.
- This can make it appear that all asteroids are gone.

Interpretation:

- This is a gameplay/state defect rather than a player-learning problem and should be fixed directly.

### 12. Commercial-interest behaviors

Observed:

- The developer collected some email addresses.
- Cards were handed out.
- The developer believes some players followed the game/developer on itch.io after the demos.

Interpretation:

- These actions are stronger evidence of interest than polite praise alone.
- The counts and conversion rates are not known, so they do not yet establish commercial demand.

## Strongest positive signals

1. Basic movement and shooting are immediately legible.
2. Control feel appears strong and helped win over critical expo players quickly.
3. Visual art, effects, characters, and humor repeatedly landed well.
4. Most players were remembered as voluntarily replaying at least once.
5. Gravity produced genuine surprise and creative experimentation in a small subset.
6. Players showed curiosity about additional enemies, weapons, upgrades, and content.
7. Some players took follow-up actions such as giving an email address, taking cards, or following on itch.io.

## Strongest negative signals

1. The black-hole glitch effect produced immediate nausea, dizziness, sensory overload, look-away behavior, and session termination.
2. The upgrade system was the most consistent comprehension failure.
3. Gravity was sometimes interpreted as broken input or game malfunction.
4. Upgraded-weapon controls were not sufficiently discoverable.
5. Some players appeared bored by the second or third death.
6. Asteroids can become stuck off-screen and create false completion state.

## Developer's own summary

The developer summarized the playtests as successful in showing that players enjoyed engaging with the world, characters, and systems, while also showing that systems such as gravity and the upgrade language were opaque or difficult to read. The developer felt the art was headed in the right direction.

## What the evidence does not establish

These playtests do not establish:

- product-market fit;
- willingness to pay;
- Steam conversion;
- long-term retention;
- console suitability;
- which player segment should be the primary target;
- whether additional content alone would materially improve retention;
- whether gravity can become broadly compelling after its legibility and reward structure are improved.

Those questions require new measurement rather than retrospective interpretation.
