fill credentials on aws_credentials.


docker image build -t python38_img . && docker run -d --name sam_py python38_img
docker image build -t python38_img . && docker start sam_py

After its already installed...
docker exec -it sam_py bash