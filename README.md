# hello-docker-world

Submission to the ["Hello Docker World challenge"](https://blog.hypriot.com/post/build-smallest-possible-docker-image/)

## How to build

Here's the transcript of how it is built.
```sh
$ nasm -felf64 hdwc.asm
$ ld hdwc.o
$ strip a.out
$ head -c-185 a.out > hdwc
$ chmod +x hdwc
$ file hdwc
hdwc: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped, with debug_info
$ ./hdwc
Hello Docker World!
$ docker build -t julie-bouillon/hdwc .
Sending build context to Docker daemon     64kB
Step 1/3 : FROM scratch
 ---> 
Step 2/3 : ADD hdwc /hdwc
 ---> 50b9237b2f8d
Removing intermediate container 0c6ca65a2146
Step 3/3 : CMD /hdwc
 ---> Running in cc9b9bd2e6e5
 ---> 4bb0a20b74f4
Removing intermediate container cc9b9bd2e6e5
Successfully built 4bb0a20b74f4
$ docker images
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
julie-bouillon/hdwc   latest              98e1fd775416        10 seconds ago      185B
$ docker run julie-bouillon/hdwc
Hello Docker World!
$
```

Idea on how to create very small executable shamelessly taken from [here](http://timelessname.com/elfbin/). I haven't been all the way as described in the article so it is most probably possible to even reduce the executable.

