void intTos(char *str, unsigned short num) {
    {
        unsigned short num_ = num;
        do {
            str++;
        } while (num_ /= 10);
    }
    str--[0] = '\0';

    do {
        str--[0] = num % 10 + '0';
    } while (num /= 10);
}
