git pull --rebase

rd/s/q public
hugo
scp -r ./public/* root@81.69.253.202:/www/wwwroot/hugo/public/

git add . 
git commit -m "发布文章" 
git push