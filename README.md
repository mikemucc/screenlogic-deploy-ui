# screenlogic-deploy-ui

## Usage

This deploy script attempt to simplify the deployment of the ScreenLogic Frontend and API on your network. They only work on a linux machine, and will fail on a Mac or Windows Machine, as the docker net=host switch doesn't work properly on these platforms.

### Deploy

Modify `deploy-screenlogic.sh`. Specifically, edit the environment variable `SERVER_ADDRESS` to be the IP address or FQDN of the machine this will run on. Remember, this will become a website that you can access with a web browser.

If you are trying to run on a Mac, you will need to figure out the IP address and Port that your ScreenLogic interface is running on. You can probably use your router to find it. Once you have that data, you can modify the `SL_IP_ADDRESS` and `SL_PORT` values in the script.

### Access

Once Deployed, you should be able to access it at `SERVER_ADDRESS` on port 9001 (9001 = P00l, get it?). This can be modified in the `docker-compose.yml` file if ports 9001 and 9002 are taken.
