void intTos(register char *str, register unsigned short num) {
    {
        register unsigned short num_ = num;
        do {
            str++;
        } while (num_ /= 10);
    }
    str--[0] = '\0';

    do {
        str--[0] = num % 10 + '0';
    } while (num /= 10);
}
