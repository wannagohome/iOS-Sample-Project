# iOS-Sample-Project

### Setup

This project uses [Tuist](https://github.com/tuist/tuist) for project management and [Needle](https://github.com/uber/needle) for dependency injection. So these two must be installed before running.

Installing tuist
```
curl -Ls https://install.tuist.io | bash
```

Installing needle
```
brew install needle
```

and run
```
tuist fetch
tuist cache warm // (opntional)
tuist generate
```