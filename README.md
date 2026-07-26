# doggy-countdown

A countdown to the day **Simba** — a Cocker Spaniel puppy — comes home:
**Monday 24 August 2026**.

The site is a single static page: a live countdown, a progress bar that fills as
the day approaches, and a small gallery. On the day itself the countdown is
replaced by a homecoming message.

## Running it

Open `public/index.html` in a browser. There is no build step.

To serve it the way production does:

```sh
docker build -t doggy-countdown .
docker run --rm -p 8080:8080 doggy-countdown
```

## How it ships

Tagging `v*` runs the shared publish workflow, which builds the image, pins its
digest into `deploy/deployment.yaml`, and publishes `deploy/` as a cosign-signed
OCI artifact. The platform pulls that artifact and reconciles it.

## Where it runs

https://simba.platform.devantler.tech

The shared platform gateway already holds a `*.platform.devantler.tech`
certificate, so this app needs no certificate of its own, and external-dns
creates the DNS record from the HTTPRoute hostname.
