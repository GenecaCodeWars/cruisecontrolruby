To run in Cloud9, go to terminal and enter:
ruby app.rb -p $PORT -o $IP

To test posting data to your service, go to another terminal and enter:
curl --data "{\"RoundNumber":\"3\"}" http://rubycommander1.cruisecontrol.c9.io/command