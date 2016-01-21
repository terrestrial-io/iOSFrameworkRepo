
echo Current Framework Version is "$(git tag)" 
echo Enter new version number
read input_variable
echo "You entered: $input_variable" 

cd /iOSFrameworkRepo
git add -A
git commit -m "Build version $input_variable"
git tag $input_variable
git push --all

