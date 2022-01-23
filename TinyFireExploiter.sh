echo "Enter the AWS bucket name"
read bucket
echo ""; echo ""; echo "";
echo "\e[1;33m [+]Testing for object listing[+] \e[0m" ; echo ""; echo "";
aws s3 ls s3://$bucket --no-sign-request  --recursive ; echo ""; echo ""; echo "";
echo "[+]Testing for uploading object in bucket[+]  \e[0m" ; echo ""; echo "";
aws s3 cp testing.txt s3://$bucket ; echo ""; echo "";
echo "\e[1;33m [+]Testing for direct access to the file if uploaded[+]  \e[0m" ; echo ""; echo "";
curl https://$bucket.s3.amazonaws.com/testing.txt  ; echo ""; echo ""; echo "\e[1;31m If you find the word Testing above then its directly accessible \e[0m"; echo ""; echo "";
echo "\e[1;33m [+]Testing for file access by enabling permissions[+]  \e[0m" ; echo ""; echo "";
aws s3 cp testing.txt s3://$bucket --acl public-read --no-sign-request ; echo ""; echo "";
curl https://$bucket.s3.amazonaws.com/testing.txt ; echo ""; echo ""; echo "\e[1;31m If you find the word Testing above then its accessible after enabling its permissions \e[0m"; echo ""; echo "";
echo "\e[1;33m [+]Testing to check the bucket owner[+] \e[0m" ; echo ""; echo "";
aws s3api get-bucket-acl --bucket $bucket
echo "Done"
