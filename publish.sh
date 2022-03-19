# cd C:\\Users\\18329\\Desktop\\hugo # 你自己Hugo路径
# echo "cd project folder success"
rm -rf ./public # 当前目录里已经生成的静态文件删除
echo "清理完成"
# hugo 不会帮忙删，不删的话老有上次的残余
hugo # 生成静态文件
scp -r ./public/* root@81.69.253.202:/www/wwwroot/hugo/public/
echo "文件传输完成"
git add . 
echo "added"
git commit -m "init" 
echo "commited"
git push
echo "推送到github成功"

