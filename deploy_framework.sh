
xcodebuild -project Terrestrial.xcodeproj -scheme Terrestrial -sdk iphonesimulator -configuration 'Release' -destination 'platform=iOS Simulator,name=iPhone 6S,OS=latest' clean build

cd iOSFrameworkRepo

echo Current Framework Version is "$(git tag)" 
echo Enter new version number
read input_variable
echo "You entered: $input_variable" 

sed -i '' 's/\(s.version.*=.*\"\)\(.*\)\"/s.version          = \"$input_variable\"/1' Terrestrial.podspec

git add -A
git commit -m "Build version $input_variable"
git tag $input_variable
git push --all
git push --tags 

cd ..

git add -A
git commit -m "Released version $input_variable"
git push --all




