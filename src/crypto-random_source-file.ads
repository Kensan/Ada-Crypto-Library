with Interfaces.C_Streams;
with Ada.Strings.Unbounded;

package Crypto.Random_Source.File is
   package Rnd renames Crypto.Random_Source;

   type Random_Source_File is new Rnd.Random_Source with private;
   
   procedure Finalize(This : in out  Random_Source_File);
   
   procedure Initialize(This : in out Random_Source_File);
   procedure Initialize(This : in out Random_Source_File;
			File_Path : in String);

   procedure Read(This : in Random_Source_File; B : out Byte);
   procedure Read(This : in Random_Source_File; Byte_Array : out Bytes);
   procedure Read(This : in Random_Source_File; B : out B_Block128);
   
   procedure Read(This : in Random_Source_File; W : out Word);
   procedure Read(This : in Random_Source_File; Word_Array : out Words);
   
   procedure Read(This : in Random_Source_File; D : out DWord);
   procedure Read(This : in Random_Source_File; DWord_Array : out DWords);
private
   type Random_Source_File is new Rnd.Random_Source with
      record
	 Source_Path : Ada.Strings.Unbounded.Unbounded_String;
	 Source_File : Interfaces.C_Streams.Files;
      end record;
end Crypto.Random_Source.File;