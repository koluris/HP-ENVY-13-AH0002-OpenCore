DefinitionBlock ("", "SSDT", 2, "HPENVY", "_PNLF", 0x00000000)
{
    If (_OSI ("Darwin"))
    {
        Scope (_SB)
        {
            Device (PNLF)
            {
                Name (_ADR, Zero)
                Name (_HID, EisaId ("APP0002"))
                Name (_CID, "backlight")
                Name (_UID, 0x10)
                Name (_STA, 0x0B)
            }
        }        
    }
}