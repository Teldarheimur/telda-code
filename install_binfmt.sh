#!/bin/sh
echo ":telda:M::álvur2\\n::$(realpath t):" | sudo tee /proc/sys/fs/binfmt_misc/register