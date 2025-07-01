# July Challenge!
Welcome to the first challenge in the 2025 CSAW AI Hardware Attack Challenge!

The first challenges will focus on leveraging generative AI to add hardware Trojans to an AES core. Three difficulties of challenge will be provided: easy, medium, and hard, with each worth increasing points.

## Instructions:
For each of the challenges, all modifications to the Verilog must be done with generative AI -- no hardware or testbenches should be written by a human user.

Your task is to use generative AI to modify the source code of the provided AES core (from https://github.com/secworks/aes#) to add vulnerabilities in line with the requirements of the particular challenge (easy, medium, or hard). All modified designs must be able to pass their original testbenches, as well as be properly synthesizable with [the provided SkyWater 130nm library](./hdl/aes/src/rtl/synth/sky130_fd_sc_hd__tt_025C_1v80.lib).

The three challenges are as follows:
### Easy - Basic Key Leakage Trojan
#### Objective:
Modify the AES design to insert a hardware Trojan that leaks part or all of the secret key through any mechanism of your choice.

#### Rules:
- You may modify any part of the AES design.
- Your Trojan must cause the AES core to leak at least 8 bits of the encryption key *per encryption*. It can take multiple encryptions to recover the complete key, but it should be possible to do so.
- You may use any form of direct (simulateable) output for the leakage. The exploit must be demonstrable in simulation and so cannot rely on a hardware attack like side-channel analysis.
- Your Trojan may be always active, or use a simple trigger (e.g., time-based or input value).
- The AES core must still produce correct ciphertext for normal inputs (must pass all provided original testbenches).
- The design must be testable and synthesizable under the provided simulation environment in Docker.

### Medium
#### Objective:


#### Rules:

### Hard
#### Objective:
Insert a hardware Trojan into a flattened Verilog netlist of the AES core. The Trojan must leak the lower 8 bits of the encryption key (`key[7:0]`), one bit per encryption, using the LSB of the ciphertext output.

#### Rules:
- You may only modify the flattened netlist provided in the source code.
- You may insert any needed additional logic.
- The AES core must still produce correct ciphertext when the Trojan is not intended to leak the key (must pass all provided original testbenches).
- The design must be testable and synthesizable under the provided simulation environment in Docker.

## Submission:
For each challenge you must submit the following:
- A README detailing the following:
    - How you used an AI to modify the code. This should include details on your method of interaction (API, website UI, etc.), the model(s) used, and any additional supporting framework that might have been used around the AI. *This is largely what we will be judging to determine points for creative AI usage.*
    - How your Trojan works.
    - How to test your Trojan.
- Your modified source code
- The yosys synthesis results from the source code modification.
- A testbench (can be a modified version of the supplied `tb_aes.v`) which demonstrates the Trojan working.
- All AI interactions that led to your completed design.

All files should be submitted in the following format to [this Google form]():
```
submission.zip
├── README.md
├── rtl/
│   └── <all modified RTL>
├── tb/
│   └── <testbench to exploit Trojan>
└── ai/
    └── <all AI interactions>
```


## Judging:
### Grading Rubric

| Category               | Points | Criteria                                                                 |
|------------------------|--------|--------------------------------------------------------------------------|
| Functional Correctness | 20     | AES operates correctly for normal inputs (passes all base test vectors) |
| Trojan Effectiveness   | 25     | Key leakage occurs as specified; trigger activates correctly            |
| Stealthiness           | 15     | Trojan does not affect output under normal inputs                       |
| Code Quality           | 10     | Clean Verilog, comments, modular insertion                              |
| Documentation          | 10     | README explains design, trigger, and payload clearly                    |
| Simulation Proof       | 20     | Waveform or output logs show Trojan working as intended                 |
| **Total**              | **100**|                                                                          |


## Docker:
