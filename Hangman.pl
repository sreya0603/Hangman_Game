#!/usr/bin/perl

$again=1;
while($again==1){
$again=0;
@list_of_words = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");


$selected_word=$list_of_words[rand @list_of_words ];
$size = length($selected_word);
@player_correct_guesses = ();
$game_over= 0;
$num_of_tries = 0;
@all_guess=();
$w=0;


for ($i=0; $i < $size; $i++) {
     $player_correct_guesses[$i] = '_';}
     
print "@player_correct_guesses ";
&hangmanDisplay($num_of_tries);


while (!$game_over) {
                
              
                print "\n\nEnter a letter: ";
                $guessed_char = <STDIN>;
                chomp($guessed_char);
                $w=&print_guess($guessed_char,@all_guess);
                $lettercheck=&if_Letter_present($selected_word,$guessed_char,@player_correct_guesses);
                $game_over= &checkWin(@player_correct_guesses);
                print "@player_correct_guesses ";
                &hangmanDisplay($num_of_tries);
               
                if($num_of_tries>5){
                    print "you have lost the game! \n";
                    print "the word is: $selected_word \n";
                    $game_over=1;}
                }
                print "\n\ndo you like to play again: enter 1 if yes:";
                $again = <STDIN>;
                }
sub print_guess
{   ($guessed_char,@all_guess) = @_;
     for ($i=0;$i<6;$i++){
          if($all_guess[$i] eq $guessed_char){
          printf "already guessed\n";
          print "guessed letters are @all_guess \n";
             return 1;
                }
          }
      push @all_guess,$guessed_char;
      print "guessed letters are @all_guess \n";
      return 0;
      }             
sub if_Letter_present{
$left=6-$num_of_tries;
my $chopletter;
     ($selected_word, $guessed_char,@player_correct_guesses) = @_;
      $Index = index($selected_word, $guessed_char);

        if ($Index !=-1) {
        
           for (my $i=0; $i < length($selected_word); $i++) {
           $chopletter = substr($selected_word, $i, 1);
           
           if ( $chopletter eq $guessed_char) {
                $player_correct_guesses [$i] = $guessed_char;}
           
           }
           print "correct guess!\n";
           return 1;
           }
           else{
              print "Wrong guess!you are left with $left body parts!\n";
              $num_of_tries++;
              return 0;}
           }
         


sub checkWin{
    (@player_correct_guesses) = @_;
    
    for (my $i=0; $i< $size; $i++) {
        
        if ($player_correct_guesses[$i] eq "_") {
            return 0;
        }
    }
    print "you have won the game! \n";
    return 1;
}



sub hangmanDisplay
{

print "\n\n";
if($num_of_tries==0){
        print "   _____\n";
        print "  |     |\n";}
elsif($num_of_tries==1){
        print "   _____\n";
        print "  |     |\n";
        print "  |     o\n";}
elsif($num_of_tries==2){
        print "   _____\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |     |\n";}
elsif($num_of_tries==3){
        print "   _____\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|\n";}
elsif($num_of_tries==4){    
        print "   _____\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";}
elsif($num_of_tries==5){    
        print "   _____\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |    /\n";}
elsif($num_of_tries==6){    
        print "   _____\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |    / \\\n";}

for ($i=0; $i < 6-$num_of_tries; $i++){
        print "  |\n";
}
        print "__|_____\n";
        
       
}
























        

     
