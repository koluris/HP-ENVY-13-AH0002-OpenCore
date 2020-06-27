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

    // DMAC

    If (_OSI ("Darwin"))
    {
        Scope (_SB.PCI0.LPCB)
        {
            Device (DMAC)
            {
                Name (_HID, EisaId ("PNP0200"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0000,
                        0x0000,
                        0x01,
                        0x20,
                        )
                    IO (Decode16,
                        0x0081,
                        0x0081,
                        0x01,
                        0x11,
                        )
                    IO (Decode16,
                        0x0093,
                        0x0093,
                        0x01,
                        0x0D,
                        )
                    IO (Decode16,
                        0x00C0,
                        0x00C0,
                        0x01,
                        0x20,
                        )
                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                        {4}
                })
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
        Scope (_PR.PR00)
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
                    Local0 = Package (0x04)
                        {
                            "kUSBSleepPortCurrentLimit", 
                            0x0BB8, 
                            "kUSBWakePortCurrentLimit", 
                            0x0BB8
                        }
                    \_PR.PR00.DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
            }
        }
    }
}