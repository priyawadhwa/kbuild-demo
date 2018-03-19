FROM gcr.io/distroless/base:latest AS initial
COPY files/f* /dir/

FROM gcr.io/google-appengine/debian9:latest
RUN apt-get update && apt-get install -y curl
COPY --from=0 /dir/foo /tmp/foo
COPY --from=initial /dir/foo2 /tmp/foo2
ENV hello hello
