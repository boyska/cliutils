#USAGE: translate hello en it
translate(){ 
  curl -s "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2%7C$3" |\
  sed 's/{"responseData": {"translatedText":"\([^"]*\)"}, .*}/\1\n/'; 
}
