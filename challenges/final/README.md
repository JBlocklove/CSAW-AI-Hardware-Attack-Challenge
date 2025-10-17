# Final Challenge

Welcome to the final challenge in the 2025 CSAW AI Hardware Attack Challenge!

As each team used different methods of completing the qualifying challenges, we want you to be able to expand upon what you did and be more creative, so rather than target a single specific IP core, the target for the final challenge is a complete hardware root-of-trust called OpenTitan.

A silicon root-of-trust like OpenTitan is a component which contains security primitives and other security features that you can use as the base level of trustworthiness in its connected hardware. As such, it makes for an incredibly high-value target for potential adversaries.

## Instructions
There is only a single challenge for the final: use generative AI to modify the source code of OpenTitan to introduce and exploit vulnerabilities. As with the previous challenges, you must be able to show that OpenTitan still functions (simulates) as expected in their normal testing apparatus. You must also be able to provide all of your logs/conversations/etc. from using AI for these tasks.

### OpenTitan
You can find information on OpenTitan at their [official website](https://opentitan.org/) as well as their [GitHub](https://github.com/lowRISC/opentitan)

OpenTitan provides their own [official Docker container](https://github.com/lowRISC/opentitan/tree/master/util/container) which has all of the tools the project needs. You are welcome to use whatever system you see fit, but we will be testing your final designs in the OpenTitan docker container so it *must* work there.

#### Rules
- You may modify any part of OpenTitan.
- OpenTitna must still work as intended (must pass all original testbenches).
- The design must be testable under the official OpenTitan Docker container.

## Submission
You must submit the following:
- A README detailing the following:
    - How you used an AI to modify the code. This should include details on your method of interaction (API, website UI, etc.), the model(s) used, and any additional supporting framework that might have been used around the AI. *This is largely what we will be judging to determine points for creative AI usage.*
    - How your Trojan(s) work.
    - How to test your Trojan(s).
- Your modified source code
- Testbench(es) which demonstrates the Trojan working in the OpenTitan Docker environment.
- All AI interactions that led to your completed design.

*Note:* OpenTitan is a large project. Please only provide the files which you created/modified. For testing we will handle adding them to the project.

All files should be submitted in the following format to [this Google form](https://forms.gle/RN9i98bGyHDAvtU77):
```
submission.zip
├── README.md
├── rtl/
│   └── <all modified RTL>
├── tb/
│   └── <testbench to exploit Trojan>
└── ai/
    └── <all AI interactions (chat logs, etc.)>
```

### Presentation
**All final teams must give a presentation to the judges at/during CSAW 2025.** Teams who are not able to attend in person are expected to present remotely. The currently scheduled time slot for this challenge is **10AM ET, on 7 November**.

#### Presentation Guidelines:
- Approximately 20 minutes in length + 5 minutes for questions
- Must thoroughly explain the use of AI to generate Trojans

## Judging

### Judging Rubric

Due to the open-ended nature of this final challenge, there is unfortunately no standard rubric we can give for determining points. However, below you will find a general list of aspects the judges will be looking for.

#### Trojans
- Trojan severity
- Trojan stealthiness
    - We encourage you to demonstrate this creatively. There are many tools which exist to detect hardware Trojans, can you evade them?

#### Use of AI
- How involved did a user need to be (more automated will be better)
- How creatively were you able to use the AI
- How well documented is their use of the AI
- If the team built an automated tool, how usable it is

#### README
- How well did the team explain their process
- How well documented are their strategies

#### Presentation
- How well did you meet time requirements
- How well was the information presented


#### NOTE: If AI is not used or if AI interaction logs are not provided, the submission will be **disqualified**.

