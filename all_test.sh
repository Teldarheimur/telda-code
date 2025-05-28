make

for b in tests/*.tb
    do echo $b:
    $b
done