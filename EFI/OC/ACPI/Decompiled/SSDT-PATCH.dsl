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

    // CPU PLUG

    External (_PR_.PR00, ProcessorObj)

    If (_OSI ("Darwin"))
    {
        Scope (\_PR_.PR00)
        {
            Method (DTGP, 5, NotSerialized)
            {
                If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
                {
                    If ((Arg1 == One))
                    {
                        If ((Arg2 == Zero))
                        {
                            Arg4 = Buffer (One)
                                {
                                    0x03
                                }
                            Return (One)
                        }
                        If ((Arg2 == One))
                        {
                            Return (One)
                        }
                    }
                }
                Arg4 = Buffer (One)
                    {
                        0x00
                    }
                Return (Zero)
            }
            Method (_DSM, 4, NotSerialized)
            {
                Local0 = Package (0x02)
                    {
                        "plugin-type", 
                        One
                    }
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
    }
}