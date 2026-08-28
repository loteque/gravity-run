# Playtest-Derived Design Recommendations

Date: 2026-08-28

## Purpose

This document turns the historical in-person playtest evidence into design recommendations. It does not treat every observation as a mandate. Each recommendation states the evidence basis, confidence, competing explanation where useful, and what would count as success.

The corresponding evidence record is `docs/PLAYTEST_EVIDENCE_2026-08-28.md`.

## Recommendation 1: Replace or substantially reduce the black-hole glitch effect before broader testing

Priority: P0

Confidence: High

Evidence basis:

- Multiple players reported nausea, dizziness, or sensory overload.
- The reaction was immediate.
- Affected players looked away and put down the controller.
- Some observers declined to play because of the effect.

Recommendation:

Treat the current glitch presentation as a failed implementation, not as a style preference. Preserve the fiction and danger of the black hole, but redesign the effect so it communicates distortion without overwhelming the whole visual field.

Possible implementation directions:

- reduce amplitude, frequency, and full-screen displacement;
- confine distortion spatially around the black hole or ship instead of affecting the entire image;
- avoid rapid high-contrast flashing or large disorienting screen warps;
- expose an effects-intensity or comfort option if the effect remains material to the presentation.

Success looks like:

- new players can enter the black-hole state without immediately looking away or terminating the session;
- players still understand that the black hole is dangerous and visually exceptional.

Failure condition:

- even after reduction, players continue reporting immediate nausea/dizziness or avert their gaze.

## Recommendation 2: Make gravity legible as an intentional force without turning it into a tutorial lecture

Priority: P0

Confidence: High

Evidence basis:

- gravity was discovered accidentally;
- some players asked whether gravity was actually present;
- some interpreted gravity-induced movement as controller failure or a game glitch;
- a small subset experienced a strong "wow" moment once they recognized the mechanic.

Recommendation:

The game needs to communicate "an external force is acting on the ship" before it needs to explain the full system. Preserve discovery of advanced uses, but remove ambiguity about whether the software is malfunctioning.

Potential cues to prototype:

- a subtle directional field or particle flow near gravity sources;
- ship/engine/body feedback that visibly reacts to external pull;
- a trajectory or motion cue that appears only when gravity materially changes the ship's path;
- sound design tied to entering and strengthening gravity influence;
- environmental animation that demonstrates other objects being pulled before the player is strongly affected.

Do not assume more text is the answer. The strongest current evidence is that players like being able to pick up the controller and play without explanatory text.

Success looks like:

- first-time players recognize unexpected ship motion as an intentional world force rather than broken input;
- some players still discover advanced gravity behavior through experimentation rather than being told every possibility.

## Recommendation 3: Give skilled gravity play an actual payoff

Priority: P1

Confidence: Medium-high

Evidence basis:

- creative players attempted orbiting and other gravity experiments;
- gravity discovery produced strong surprise;
- only the most curious/risk-tolerant players persisted;
- failed experimentation could cost health or cause death;
- there was no direct designed reward for succeeding.

Recommendation:

If gravity is meant to be the game's signature system, successful use should create value beyond the intrinsic pleasure of mastery.

Prototype rewards that fit the existing game rather than adding a new meta-system by default. Examples:

- speed or momentum advantage;
- safer or faster traversal through a dangerous region;
- score multiplier or style bonus;
- weapon charge, cooldown reduction, or resource gain for close gravity maneuvers;
- enemy-positioning opportunities created by gravity;
- shortcuts or encounter routes only accessible through good gravity judgment.

Strong competing explanation:

The mechanic may remain a niche delight for highly exploratory players even after rewards are added. Do not build the entire game around it until another test shows broader intentional engagement.

Success looks like:

- players who understand gravity voluntarily use it when a safer conventional route exists;
- successful gravity play changes outcomes in a way players can perceive and describe.

## Recommendation 4: Preserve the upgrade system's puzzle quality while removing accidental incomprehension

Priority: P0

Confidence: High

Evidence basis:

- upgrade UI was the most repeated comprehension failure;
- casual players paused for long periods, asked questions, and sometimes succeeded accidentally without understanding why;
- skilled players explored freely;
- a handful of players strongly enjoyed "solving" the interface and compared the experience to Fez.

Recommendation:

Do not flatten the system into a conventional menu solely to make it obvious. The evidence suggests that discovery itself has value for some players. Instead, distinguish productive mystery from mechanical opacity.

The player should be able to infer:

1. what can be interacted with;
2. what action they just performed;
3. whether that action succeeded;
4. what changed on the ship;
5. how to use the result.

The player does not necessarily need to know every future possibility or optimal combination.

Potential changes:

- stronger hover/focus/selection states;
- visible attachment targets or compatibility feedback;
- immediate before/after visual feedback on the ship;
- reversible experimentation where practical;
- clear rejection feedback instead of silent failure;
- a small amount of diegetic labeling if needed, while avoiding a wall of explanatory text.

Success looks like:

- casual players can intentionally complete one upgrade without asking what happened;
- exploratory players still have room to discover combinations, structure, or hidden affordances.

## Recommendation 5: Make newly acquired weapon controls immediately discoverable

Priority: P0

Confidence: High

Evidence basis:

- players acquired upgraded weapons but did not know which button fired them.

Recommendation:

The game should acknowledge the newly usable action at acquisition time. A short, contextual control cue is preferable to expecting players to remember a control chart.

Possible approaches:

- show the relevant button icon next to the newly installed weapon;
- briefly animate the mapped input when the upgrade becomes active;
- allow the first successful installation to trigger a compact test-fire prompt;
- keep the control reminder accessible from pause/UI without forcing a tutorial sequence.

Success looks like:

- players who acquire a weapon use it intentionally within the same run without asking the developer how.

## Recommendation 6: Fix off-screen asteroid persistence directly

Priority: P0

Confidence: High

Evidence basis:

- asteroids can become stuck to the right of the visible area;
- players can believe the encounter is finished when it is not.

Recommendation:

Treat this as a deterministic gameplay bug. Do not design around it. Establish explicit lifetime, despawn, bounds, or encounter-completion rules for asteroids.

Success looks like:

- no encounter can stall because a required asteroid is alive but unreachable or invisible.

## Recommendation 7: Protect the current movement and shooting feel

Priority: Constraint

Confidence: High

Evidence basis:

- essentially all players understood movement and shooting immediately;
- critical expo players reportedly softened quickly after feeling the controls;
- players described the controls as snappy;
- external public feedback has also characterized the controls positively, though that evidence should remain separate from this in-person record.

Recommendation:

Do not undertake broad input or movement redesign without a specific measured problem. Changes to gravity communication, progression, or content should be tested against the risk of damaging the current pick-up-and-play strength.

Success looks like:

- new features do not add mandatory onboarding before basic movement/shooting becomes fun.

## Recommendation 8: Treat art, Commander Quacker, and humor as core product assets

Priority: Protect and extend

Confidence: High

Evidence basis:

- players consistently praised art/graphics/effects;
- laughter and smiles during dialogue were repeatedly observed;
- almost nobody skipped dialogue;
- the space-duck premise and "Quack in the Spacetime Continuum" subtitle reliably generated amusement.

Recommendation:

Preserve the character-forward identity. Future polish should increase coherence and production quality without sanding away the absurd space-duck premise.

Do not infer from this that players will buy the game because they like the art. The evidence supports attraction and delight, not willingness to pay.

## Recommendation 9: Add experiential variety before adding broad new infrastructure

Priority: P1

Confidence: Medium-high

Evidence basis:

- players asked for more weapons and enemies;
- some replay behavior appeared driven by curiosity about what else existed;
- the current repository already contains broader gameplay/upgrades infrastructure than the authored campaign content.

Recommendation:

Use the existing systems to create a deliberately small set of meaningful new encounters, enemy behaviors, weapon experiences, and gravity situations. Prefer content that tests the strongest hypotheses over adding another general-purpose system.

A good addition should answer at least one question:

- Does this make gravity tactically valuable?
- Does this create a new decision rather than a reskinned obstacle?
- Does this motivate another run?
- Does this deepen Commander Quacker's identity or world?

Success looks like:

- players encounter meaningful novelty before the point where previous testers tended to stop;
- the new content produces changed behavior, not just positive comments.

## Recommendation 10: Design the next build as an experiment, not as "the finished game"

Priority: P1

Confidence: High

Evidence basis:

- current evidence contains both strong positive signals and unresolved core-loop problems;
- commercial demand and long-term retention remain unmeasured;
- historical tests were not instrumented and exact build identities were not preserved.

Recommendation:

The next development milestone should be a focused validation build that fixes the highest-severity failures and tests whether the promising signals survive cleaner measurement.

Record for each future test:

- exact commit/build identity;
- test setting and audience;
- first-run comprehension;
- whether gravity is recognized as intentional;
- whether gravity is deliberately used;
- upgrade completion without assistance;
- newly acquired weapon use;
- number of voluntary retries;
- session stop reason;
- requests for more content;
- voluntary follow/download/wishlist actions where applicable;
- any comfort/accessibility problems.

## Design hypothesis to carry forward

A useful working hypothesis is:

> Gravity Run has a strong immediately legible arcade shell and a memorable character/visual identity. Its deeper potential lies in turning gravity and upgrades from opaque curiosities into understandable systems that still reward discovery, then giving players enough authored variety to make that discovery worth pursuing.

Confidence: Medium.

This hypothesis should be allowed to lose. If improved legibility and a real gravity payoff do not increase deliberate gravity use, replay depth, or player curiosity in fresh tests, the project should reduce the design weight placed on gravity rather than rationalizing the result away.
