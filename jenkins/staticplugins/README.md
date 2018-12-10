This is a tar file with a set of the plugins used for configuring a preexisting Jenkins instance (Scenario 1 in the installer),
the tar file is manually copied over, extracted, and copied to the appropriate location.

Our dockerized scenarios don't use this, they run a script that takes `plugins.txt` as input and fetches and installs these plugins automatically, which is far cleaner, and what we should have done from the start

We should do that everywhere, but it will require porting the upstream Jenkins docker scripts over.
