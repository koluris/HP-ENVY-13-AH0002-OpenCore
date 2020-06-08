DefinitionBlock ("", "SSDT", 2, "HPENVY", "_I2CX", 0x00000000)
{
    External (_SB_.PCI0.I2C0, DeviceObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C0.XSTA, MethodObj)
    External (_SB_.PCI0.I2C1.XSTA, MethodObj)
    
    Scope (\_SB.PCI0.I2C0)
    {
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x00)
            }
            Return (XSTA ())
        }
    }
    
    Scope (\_SB.PCI0.I2C1)
    {
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x00)
            }
            Return (XSTA ()) 
        }
    }
}