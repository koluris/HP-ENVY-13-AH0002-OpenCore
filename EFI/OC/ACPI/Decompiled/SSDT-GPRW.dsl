DefinitionBlock ("", "SSDT", 2, "HPENVY", "_GPRW", 0x00000000)
{
    External(XPRW, MethodObj)
    
    Method (GPRW, 2)
    {
        If (_OSI ("Darwin"))
        {
            If ((0x6D == Arg0))
            {
                Return (Package ()
                {
                    0x6D,
                    Zero
                })
            }
        }
        Return (XPRW (Arg0, Arg1))
    }
}