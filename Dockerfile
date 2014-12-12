from deliverous/wheezy
add app /opt/extreme_startup/

run apt-get update && \
    apt-get install -y --no-install-recommends ruby sudo && \
    apt-get clean
run apt-get update && \
    apt-get install -y bundler libxslt-dev libxml2-dev && \
    cd /opt/extreme_startup && bundle update && \
    apt-get remove -y bundler libxslt-dev libxml2-dev &&\
    apt-get autoremove -y &&\
    apt-get clean

env RACK_ENV production
cmd cd /opt/extreme_startup && ruby web_server.rb
