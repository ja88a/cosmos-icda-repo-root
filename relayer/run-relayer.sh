#!/bin/sh

rly config init
rly chains add-dir configs
rly paths add-dir paths

rly keys restore checkers alice "cinamon legend ..."
rly keys restore checkers bob "stamp later develop betray boss ranch abstract puzzle calm right bounce march orchard edge correct canal fault miracle void dutch lottery lucky observe armed"

rly keys restore leaderboard alice "cinamon legend ..."
rly keys restore leaderboard bob "stamp later develop betray boss ranch abstract puzzle calm right bounce march orchard edge correct canal fault miracle void dutch lottery lucky observe armed"

rly tx link checkers -d -t 3s --src-port leaderboard --dst-port leaderboard --version leaderboard-1
rly start checkers