# CSAW AI Hardware Attack Challenge

Shield: [![CC BY-NC 4.0][cc-by-nc-shield]][cc-by-nc]

This work is licensed under a
[Creative Commons Attribution-NonCommercial 4.0 International License][cc-by-nc].

[![CC BY-NC 4.0][cc-by-nc-image]][cc-by-nc]

[cc-by-nc]: https://creativecommons.org/licenses/by-nc/4.0/
[cc-by-nc-image]: https://licensebuttons.net/l/by-nc/4.0/88x31.png
[cc-by-nc-shield]: https://img.shields.io/badge/License-CC%20BY--NC%204.0-lightgrey.svg

## Competition Description
Participating teams will be tasked with leveraging AI tools, such as LLMs, to insert and exploit hardware vulnerabilities and Trojans for various open-source hardware designs. These can include cryptographic accelerators, processors, communication IPs, etc. Each month leading up to the in-person final at CSAW, a new challenge (or challenges) will be issued. Each of these challenges will remain available for the duration of the competition until the finalist teams are selected so new teams can join at any time. At the conclusion of each month’s challenges, a winning team will be selected and awarded a small hardware prize. Potential challenges could include:
    - Inserting a Trojan that can evade detection by state of the art security analysis tools and models.
    - Modifying security checks to allow a Trojan-infected hardware module to pass verification.
    - Modifying a design to make it more vulnerable to potential side-channel attacks.
    - Etc.
All challenges must be completed using AI tools and all information regarding those tools must be submitted, including complete and detailed logs of their use, i.e. if an LLM is being used, we require all conversations with the model be submitted.

## Timeline:
- 1 July: First challenge given
- 1 August: Second challenge given
- 1 September: Third challenge given
- 1 October: Fourth challenge given
- 8 October: All challenges due
- 10 October: Finalist teams will be notified and invited to participate in finals at CSAW in New York City
    - We may not be able to fly all teams out, depending on their location. Global participation is still encouraged. If you cannot attend a CSAW event in person we will arrange for virtual presentations.
- 15 October: Final challenge given
- 14 November: Final challenge presentations and poster session at CSAW in New York City

#### Note: The challenges do not need to be completed within the month they are given, this is just when we are releasing them. We will also update a monthly leaderboard in this repository as the competition progresses. All teams will have up until the 8 October deadline to submit their challenges to earn points and be considered as a finalist team.

## Judging:
Each challenge will have its own rubric regarding how points can be awarded. Challenges will have their base functionality automatically graded, and manual judging will take place over the following days to ensure all rules were followed, as well as to award additional points for completing further objectives. These extra points will be awarded for each competition for things like “most creative use of AI”. Please refer to each challenge's rubric for how this will be done.

## Registration:
No need to register up front, please submit your team's registration using [this form](https://docs.google.com/forms/d/e/1FAIpQLSciLI2mEVj3aZ30QzYz1wToWwuoGoEVIB-mPer6PY_K603YYw/viewform?usp=header) when you are submitting your solutions for your first competition!

## Prizes:
Prizes for this competition are still being sourced, but the top 3 teams at the conclusion during CSAW will receive hardware or pre-purchased space on a future Tiny Tapeout!

## Open-Sourcing:
- We will be exclusively using open-source designs for this competition, as well as open-source EDA tools for evaluation!
- We intend to open-source all results at the conclusion of the competition. Any submissions will carry the copyright of the original design as well as be under the Creative Commons license used in this repository. **Submission of a design to this competition implies consent for us to release the design. This will be specified in the submission form as well.**
    - If you wish to open-source your submission under your own repository we fully support that. We ask that you specify this in the submission form so that we may provide a link to your repository(ies). We note that if your repository is later made private/removed we will then push your design to this repo.

---

# Challenges:

## July Challenge!
You can find all information for the first challenge [here!](./challenges/july_challenges)

## Using the Docker:
We are providing a Docker container with some tools already installed so you can check the functionality of the design. You do not need to use the Docker, but we encourage using it at least once before submission to ensure that your design is working in that environment, as that is the container we will be using to verify submissions.

### Quick Start (Pull & Run)

Grab the pre-built image from Docker Hub and drop into your competition environment:

```bash
docker pull <your-hub-username>/competition:1.0
docker run --rm -it <your-hub-username>/competition:1.0
```
This will drop you into a `zsh` shell as the non-root user `devuser`, with the full challenge tree mounted at `~/challenges`.

### Developing Locally, Testing in Container
We expect most of you would rather do your development on your own machine and just test using the Docker. To do that, you will need to mount your modified `challenges` directory in place of the one built into the Docker. You can do that by running like this:
```bash
docker run --rm -it \
  -v "<path to your local challenges directory>":/home/devuser/challenges \
  JBlocklove/csaw-aha-competition:1.0
```

### Offline Docker
If you can’t pull from Docker Hub, download the provided [csaw-aha-competition-1.0.tar.gz](https://drive.google.com/file/d/1CsJBnApkB9772kfkewy-NmKiUYKFg6qj/view?usp=sharing) from out Google Drive and load it manually:
```bash
# Load the image into Docker
gunzip -c csaw-aha-competition-1.0.tar.gz | docker load

# Run it
docker run --rm -it csaw-aha-competition:1.0
```
