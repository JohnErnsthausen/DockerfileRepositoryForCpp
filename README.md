Maybe I don't need to do this

>  WORKDIR /usr/src/gtest
>  RUN mkdir build
>  WORKDIR /usr/src/gtest/build
>  RUN cmake -DBUILD_SHARED_LIBS=ON -Dgtest_build_samples=ON -G"Unix Makefiles" ..
>  RUN make
>  RUN cp -r ../include/gtest /usr/local/include/
>  RUN cp lib/lib*.so /usr/local/lib
>  WORKDIR /usr/src/gtest
>  RUN rm -rf build
>  RUN mkdir build
>  WORKDIR /usr/src/gtest/build
>  RUN cmake ..
>  RUN make
>  RUN cp lib/lib*.a /usr/local/lib

>  RUN ls -la /usr/src
>  WORKDIR /usr/src/gmock
>  RUN mkdir build
>  WORKDIR /usr/src/gmock/build
>  RUN cmake -DBUILD_SHARED_LIBS=ON -Dgmock_build_samples=ON -G"Unix Makefiles" ..
>  RUN make
>  RUN cp -r ../include/gmock /usr/local/include/
>  RUN ls -la lib
>  RUN cp lib/lib*.so /usr/local/lib
>  WORKDIR /usr/src/gmock
>  RUN rm -rf build
>  RUN mkdir build
>  WORKDIR /usr/src/gmock/build
>  RUN cmake ..
>  RUN make
>  RUN ls -la lib
>  RUN cp lib/lib*.a /usr/local/lib

