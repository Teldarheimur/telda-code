if [ $(head -c 2 $1) == "#!" ]; then
    echo "  Start location:"
    tail -n+2 $1 | tail -c +5 | readbinnum short
    echo "  Code:"
    tail -n+2 $1 | tail -c +7 | hexd
else
    echo "  Start location:"
    tail -c +5 $1 | readbinnum short
    echo "  Code:"
    tail -c +7 $1 | hexd
fi
