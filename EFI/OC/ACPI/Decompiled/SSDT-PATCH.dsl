DefinitionBlock ("", "SSDT", 2, "HPENVY", "_PATCH", 0x00000000)
{
    // EC
    
    External (_SB_.PCI0.LPCB, DeviceObj)

    If (_OSI ("Darwin"))
    {
        Scope (_SB.PCI0.LPCB)
        {
            Device (EC)
            {
                Name (_HID, "EC000000")
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }
            }
        }
    }

    // USBX

    If (_OSI ("Darwin"))
    {
        Scope (_SB)
        {
            Device (USBX)
            {
                Name (_ADR, Zero)
                Method (_DSM, 4, NotSerialized)
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                            0x03
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
                    })
                }
            }
        }
    }

    // PNLF

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