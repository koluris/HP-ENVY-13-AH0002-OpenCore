DefinitionBlock ("", "SSDT", 2, "HPENVY", "_BRTFIX", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0.KBD0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0.XQ1C, MethodObj)
    External (_SB_.PCI0.LPCB.EC0.XQ1D, MethodObj)
    
    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Method (_Q1C, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD0, 0x0206)
                Notify (KBD0, 0x0286)
            }
            Else
            {
                XQ1C ()
            }
        }
        
        Method (_Q1D, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD0, 0x0205)
                Notify (KBD0, 0x0285)
            }
            Else
            {
                XQ1D ()
            }
        }
    }
}