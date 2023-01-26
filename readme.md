# Checkers game + Leaderboard appchains w/ IBC
App Chains local deployment based on Docker, with IBC communications.

## Build the Docker images

To build the **image for the checkers game with the leaderboard**, clone the repository and run below build commands.

### All-in-one build script

Create the 3 docker images using the shell script `build.sh`:
```
$ chmod +x ./build.sh
$ ./build.sh
```

### Manual images' creation

1. Build the docker image for the **Checkers chain**:
```
docker build -f Dockerfile-checkers . -t checkers_img --no-cache
```

2. Build the docker image for the **Leaderbaord chain**:

```
docker build -f Dockerfile-leaderboard . -t leaderboard_img --no-cache
```

3. Build the docker image for the **IBC Go Relayer**:

```
cd relayer && docker build -f Dockerfile . -t relayer_img --no-cache
```

## Start the local chains & network

You can use the provided compose file to spin up a network with a checkers blockchain, a leaderboard chain and a relayer:

```
docker-compose up
```

Observe the output of `docker-compose` until the chains are ready. It takes some time for the chains to be ready. 

## Start the IBC Go Relayer

When the chains are ready, start the relayer process:

```
docker exec relayer ./run-relayer.sh 
```

Wait till the connection is etablished and a channel is created. 

## Create a game and play it till end

An easy way is to start the test script, jump into container:

```
$ docker exec -it checkers bash
```

and run:

```
$ ./test.sh 1 cosmos14y0kdvznkssdtal2r60a8us266n0mm97r2xju8 cosmos1n4mqetruv26lm2frkjah86h642ts84qyd5uvyz
```

This will create and play a game in the Checkers chain. The number `1` indicates the game index. You can increase it for the next test if you want it to play another game. It lets win the second address.

After a game is over, you can query the player information:

```
checkersd query leaderboard list-player-info
```

You can send the score of the player to leaderboard chain. In the checkers chain container:

```
checkersd tx leaderboard send-candidate leaderboard channel-0 foo --from cosmos14y0kdvznkssdtal2r60a8us266n0mm97r2xju8
```

After a while, you can jump into the leaderboard chain:

```
docker exec -it leaderboard bash
```

to query the received player information:

```
leaderboardd q leaderboard list-player-info
```

## Versions

Cosmos SDK: `stargate - v0.45.4`

Go: `1.18.x`

Node: `18.x`