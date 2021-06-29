weather=$(curl -s wttr.in/Gent?format="%C+%t")
if [ $(echo $weather | wc -c) -gt 30 ]; then
   weather="!ERROR"
fi

echo $weather

