# Playtest-Driven Development Roadmap

Date: 2026-08-28

## Purpose

This roadmap converts the historical in-person playtest evidence into a narrow sequence of development and validation gates. It is intentionally not a feature wish list.

The objective is to answer one strategic question:

> Is Gravity Run / Commander Quacker worth advancing toward a commercial Steam release, and if so, what is the smallest evidence-backed path forward?

The current recommendation is **continue, but only through a focused validation sprint rather than committing immediately to full production**.

Why:

- players demonstrated real external engagement, voluntary replay, strong response to art/characters/humor, and curiosity about additional content;
- gravity produced distinctive creative behavior in a subset of players;
- serious usability/accessibility failures remain in the black-hole effect, gravity legibility, upgrade interface, weapon-control discoverability, and encounter state;
- commercial demand and durable retention are still unmeasured.

## Phase 0: Freeze the evidence baseline

Priority: Immediate

### Work

- Keep `docs/PLAYTEST_EVIDENCE_2026-08-28.md` as the historical retrospective record.
- For every future playtest build, record the exact Git commit and exported build identity.
- Preserve raw notes separately from later interpretation.
- Recover historical itch.io analytics if available, including page views, browser plays/downloads, follows, referrals, and timing. Do not invent missing metrics.

### Question resolved

Can later tests be compared to a known build and known historical baseline?

### Success

Every new test session can be traced to an exact build and produces structured observations rather than memory alone.

---

## Phase 1: Remove high-severity blockers without expanding scope

Priority: P0

### 1A. Black-hole comfort redesign

Work:

- reduce or replace the screen-wide glitch effect;
- prototype a lower-intensity distortion that still communicates danger;
- consider an effects-intensity/comfort setting if a strong effect remains.

Question resolved:

Can the black hole remain visually distinctive without causing immediate nausea, dizziness, sensory overload, look-away behavior, or session termination?

Success:

Fresh testers can encounter the effect and continue playing comfortably. Any recurrence of immediate adverse reactions is treated as a failed iteration, not dismissed as taste.

### 1B. Off-screen asteroid bug

Work:

- reproduce asteroids becoming stuck to the right of the visible play area;
- define deterministic bounds/despawn/encounter-completion behavior;
- fix the defect and verify that an encounter cannot stall on an invisible asteroid.

Question resolved:

Can encounter completion be trusted?

Success:

No required asteroid remains alive and unreachable/invisible during repeated test runs.

### 1C. Newly acquired weapon controls

Work:

- add immediate contextual control feedback when a new weapon becomes usable;
- ensure keyboard and gamepad cues match the active bindings.

Question resolved:

Does an upgrade reliably convert into intentional player action?

Success:

Fresh players can fire a newly acquired weapon without developer explanation.

### Exit gate for Phase 1

Do not add major new content until the comfort defect, encounter-state defect, and basic weapon-use ambiguity have credible fixes.

---

## Phase 2: Make the signature systems readable while preserving discovery

Priority: P0/P1

### 2A. Gravity legibility prototype

Work:

Prototype one or more nonverbal cues that make external force legible. Candidate approaches include environmental pull cues, ship reaction, particles/field visualization, sound, or local trajectory feedback.

Avoid a mandatory text tutorial unless testing demonstrates that nonverbal communication cannot do the job.

Question resolved:

Can first-time players recognize gravity as intentional without being told what advanced maneuvers to perform?

Success:

In fresh cold tests, players no longer commonly attribute gravity-induced motion to broken controls or a glitch. At least some still discover higher-order uses themselves.

Failure signal:

Players understand that gravity exists but continue treating it exclusively as something to avoid.

### 2B. Gravity reward prototype

Work:

Add one small, directly perceivable payoff for intentional gravity use. Do not build a large meta-progression system for this test.

Candidate rewards:

- speed/momentum advantage;
- scoring/style bonus;
- resource or weapon benefit;
- tactical enemy positioning;
- safer/faster route available through skilled navigation.

Question resolved:

Does rewarding successful gravity use turn curiosity into repeatable strategy?

Success:

Players who understand gravity voluntarily choose to use it even when conventional movement is available.

Failure signal:

Players understand the mechanic and reward but still overwhelmingly avoid using it.

### 2C. Upgrade-interface legibility

Work:

Preserve the puzzle/discovery quality that some skilled players enjoyed, while making interaction state understandable:

- what is selectable;
- where an upgrade can go;
- whether an action succeeded;
- what changed;
- how the result can be used.

Question resolved:

Can the upgrade screen remain a discovery space without making casual players succeed accidentally or stall in confusion?

Success:

Fresh casual players can intentionally complete at least one upgrade and explain what they changed, while exploratory players still find things to figure out.

### Exit gate for Phase 2

Proceed only if the next cold playtest shows materially improved gravity and upgrade comprehension without damaging the game's pick-up-and-play quality.

---

## Phase 3: Build a small content-validation slice

Priority: P1

### Work

Use existing systems to add a deliberately constrained set of meaningful variety before adding more general infrastructure.

Target categories:

- a small number of distinct enemy/obstacle behaviors;
- a curated set of weapons/upgrades that create clearly different play decisions;
- authored situations where gravity has tactical value;
- enough progression/encounter variety to test the historical "what else is there?" motivation;
- continued Commander Quacker dialogue/art/worldbuilding where it supports pacing rather than interrupts it.

Do not expand the medium/large upgrade catalog, drones, meta-progression, or other broad systems merely because scaffolding exists for them. Each addition should earn its place through a testable player experience.

### Question resolved

Was historical player curiosity primarily a reaction to missing content, and does meaningful added variety extend engagement?

### Success

Fresh players continue because they are encountering or anticipating qualitatively new situations, not merely because the developer tells them more content exists.

### Failure signals

- session length remains effectively unchanged after the highest-friction issues are fixed;
- players stop despite knowing more content is ahead;
- new weapons/enemies are noticed but do not alter decisions;
- gravity remains a novelty rather than a useful system.

---

## Phase 4: Structured external validation

Priority: P1

### Test design

Run fresh cold playtests with participants who were not part of the historical sample. Keep event/bar/social tests if useful, but also include quieter tests where session length is not externally constrained.

For every participant, record at minimum:

- exact build/commit;
- player self-described familiarity with shmups/action games;
- whether movement/shooting are discovered without help;
- whether gravity is recognized as intentional;
- whether gravity is deliberately used and why;
- whether the first upgrade is completed intentionally;
- whether a newly acquired weapon is fired without help;
- deaths and voluntary retries;
- approximate session duration;
- stop reason in the player's own words;
- content requests;
- adverse comfort/accessibility reactions;
- voluntary follow/download/wishlist/email actions where applicable.

Keep observations separate from post-session opinion.

### Recommended comparison

Where practical, compare at least two builds or conditions rather than trusting one favorable session. Useful A/B candidates include:

- old vs revised gravity cue;
- gravity reward absent vs present;
- old vs revised upgrade interaction feedback;
- high vs reduced black-hole visual intensity, but do not intentionally expose participants to a version already known to cause acute symptoms solely for experimental purity.

### Question resolved

Do the strongest historical signals reproduce after the known failure modes are corrected?

### Success

The improved build retains snappy first-minute play, art/character appeal, and voluntary replay while increasing intentional gravity/upgrades engagement and eliminating the known acute comfort failure.

---

## Phase 5: Commercial-validation gate

Priority: After Phase 4, not before

### Work

If fresh tests remain promising:

- establish a coherent public title/branding direction;
- prepare a polished public demo suitable for Steam evaluation;
- resolve project-level licensing, third-party asset provenance, and required attribution before commercial distribution;
- ensure controller-only campaign/dialogue flow works if controller support is part of the release promise;
- establish persistence where unlock/progression expectations require it;
- create a Steam page early enough to measure actual interest rather than relying solely on verbal enthusiasm;
- collect wishlist/follow/demo behavior and compare it with playtest behavior.

### Question resolved

Does observed enjoyment convert into measurable commercial interest?

### Success

Not a predetermined revenue number. Success is evidence strong enough to justify the next production investment, based on actual player behavior such as voluntary demo play, return behavior, follows/wishlists, and continued interest after exposure to the improved core loop.

### Stop/reduce-scope condition

If players still do not deliberately use gravity, retention does not improve, and commercial interest remains weak after the known legibility and content problems are addressed, reduce the project's scope or treat it as a polished portfolio/small-release project rather than expanding production indefinitely.

---

## Work order

The recommended order is:

1. **Black-hole comfort/accessibility fix**
2. **Off-screen asteroid-state fix**
3. **New-weapon input discoverability**
4. **Gravity legibility prototype**
5. **Upgrade-interface legibility prototype**
6. **One gravity reward prototype**
7. **Fresh cold playtest of the revised core**
8. **Small authored content/encounter expansion**
9. **Structured external validation with build-bound evidence**
10. **Commercial Steam validation if the evidence earns it**

## What not to do yet

- Do not rewrite the project because the existing code has technical debt.
- Do not add a large progression/meta system before validating the current core.
- Do not expand every existing upgrade category simply because it is already scaffolded.
- Do not treat positive comments as proof of willingness to pay.
- Do not dismiss the black-hole reaction as subjective preference.
- Do not solve gravity opacity by immediately explaining every mechanic in text.
- Do not declare the game commercially validated from historical expo/bar playtests alone.

## Current strategic disposition

**CONTINUE TO FOCUSED VALIDATION.**

The historical playtests contain enough positive behavioral evidence to justify another development/test cycle: strong pick-up-and-play controls, repeated replay, clear visual/character appeal, and emergent experimentation. They also identify concrete failures severe enough that a full-production commitment would be premature.

The next milestone is therefore not "finish Gravity Run." It is:

> Make the existing promising game readable and comfortable enough that a fresh playtest can fairly test whether its gravity-driven experimentation and content curiosity deserve a commercial production commitment.
