
# 2048

The classic version of 2048 game.

## Usage

- **Install requirements**: \
    `make setup-dev-env3` \
    This will create a virtualenv and download all requirements

- **Activate the  Env and install game**: 
    ```bash
    source env3/bin/activate
    make install
    ```
- **Run the game binary** stored in *dist/game*

## Development Setup

#### Clone the branch
`git clone git@github.com:harshkrishna3/2048game.git`

#### Setup virtual env and download requirements
- Using Makefile: `make setup-dev-env3`
- Manually
    ```bash
    virtualenv -p /bin/<python_version> env3
    # Activate the env and install the requirements
    ./env3/bin/activate && pip install -r requirements.txt
    ```
- Activate the env, and make your changes!