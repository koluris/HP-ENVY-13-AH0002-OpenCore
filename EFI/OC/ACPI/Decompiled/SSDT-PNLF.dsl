DefinitionBlock ("", "SSDT", 2, "HPENVY", "_PNLF", 0x00000000)
{
    If (_OSI ("Darwin"))
    {
        Scope(_SB)
        {
            Device(PNLF)
            {
                Name (_ADR, Zero)
                Name (_HID, EisaId ("APP0002"))
                Name (_CID, "backlight")
                Name (_UID, 16)
                
                Method (_BCL, 0, NotSerialized)
                {
                    Return (Package (0x13)
                    {
                        1388, 
                        252, 
                        0, 
                        24, 
                        39, 
                        58, 
                        82, 
                        113, 
                        150, 
                        196, 
                        252, 
                        320, 
                        403, 
                        502, 
                        622, 
                        766, 
                        938, 
                        1144, 
                        1388
                    })
                }
                
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0B)
                }
            }
        }        
    }
}