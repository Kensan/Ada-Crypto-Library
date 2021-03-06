with Test.Suite_Blockciphers;
with Test.Suite_Oneway_Blockciphers;
with AUnit.Run;
with Crypto.Types.Random_Source.File;
with Crypto.Types.Random;
with AUnit.Reporter.Text;

procedure Test.Symmetric_Ciphers is

   procedure Run_BC  is new AUnit.Run.Test_Runner(Test.Suite_Blockciphers.Suite);
   procedure Run_OBC is new AUnit.Run.Test_Runner(Test.Suite_Oneway_Blockciphers.Suite);
   
   Reporter : AUnit.Reporter.Text.Text_Reporter;
   
   use Crypto.Types.Random_Source.File;
   Dev_U_Rand : Random_Source_File;
begin
   Dev_U_Rand.Initialize("/dev/urandom");
   Crypto.Types.Random.Set(Dev_U_Rand);
   Run_BC(Reporter);
   Run_OBC(Reporter);
end Test.Symmetric_Ciphers;
