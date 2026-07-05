default:
    just turn-test

test:
    just turn-test

turn-test:
    ./policies/check.sh turn

pr-test:
    ./policies/check.sh pr

policies:
    just turn-test
