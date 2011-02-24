getpw(){
  PWFILE=passwords.gpg
gpg -d $PWFILE | grep -i $@
}
