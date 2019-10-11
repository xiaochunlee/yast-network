# Copyright (c) [2019] SUSE LLC
#
# All Rights Reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of version 2 of the GNU General Public License as published
# by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, contact SUSE LLC.
#
# To contact SUSE LLC about this file by physical or electronic mail, you may
# find current contact information at www.suse.com.

def probe_netcard
  [
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 3,
      "class_id"          => 2,
      "dev_name"          => "eth0",
      "dev_names"         => ["eth0"],
      "device"            => "NetXtreme BCM5717 Gigabit Ethernet PCIe",
      "device_id"         => 71_253,
      "driver"            => "tg3",
      "driver_module"     => "tg3",
      "drivers"           => [{ "active" => true, "modprobe" => true, "modules" => [["tg3", ""]] }],
      "modalias"          => "pci:v000014E4d00001655sv0000103Csd000018D2bc02sc00i00",
      "model"             => "Broadcom NetXtreme BCM5717 Gigabit Ethernet PCIe",
      "old_unique_key"    => "j+9w.VxmOd9xY0IF",
      "parent_unique_key" => "HnsE.Z9FAolZFS89",
      "resource"          => {
        "hwaddr" => [{ "addr" => "44:1e:a1:d3:10:9c" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 17 }],
        "link"   => [{ "state" => true }],
        "mem"    => [
          { "active" => true, "length" => 65_536, "start" => 4_008_640_512 },
          { "active" => true, "length" => 65_536, "start" => 4_008_574_976 },
          { "active" => true, "length" => 65_536, "start" => 4_008_509_440 },
          { "active" => false, "length" => 262_144, "start" => 4_007_657_472 }
        ]
      },
      "rev"               => "16",
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_890,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:03:00.0",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:1c.5/0000:03:00.0",
      "unique_key"        => "rBUF.VxmOd9xY0IF",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 3,
      "class_id"          => 2,
      "dev_name"          => "eth1",
      "dev_names"         => ["eth1"],
      "device"            => "NetXtreme BCM5717 Gigabit Ethernet PCIe",
      "device_id"         => 71_253,
      "driver"            => "tg3",
      "driver_module"     => "tg3",
      "drivers"           => [{ "active" => true, "modprobe" => true, "modules" => [["tg3", ""]] }],
      "func_id"           => 1,
      "modalias"          => "pci:v000014E4d00001655sv0000103Csd000018D2bc02sc00i00",
      "model"             => "Broadcom NetXtreme BCM5717 Gigabit Ethernet PCIe",
      "old_unique_key"    => "oR4z.VxmOd9xY0IF",
      "parent_unique_key" => "HnsE.Z9FAolZFS89",
      "resource"          => {
        "hwaddr" => [{ "addr" => "44:1e:a1:d3:10:9d" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 18 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 65_536, "start" => 4_008_443_904 },
          { "active" => true, "length" => 65_536, "start" => 4_008_378_368 },
          { "active" => true, "length" => 65_536, "start" => 4_008_312_832 },
          { "active" => false, "length" => 262_144, "start" => 4_007_919_616 }
        ]
      },
      "rev"               => "16",
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_890,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:03:00.1",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:1c.5/0000:03:00.1",
      "unique_key"        => "JNkJ.VxmOd9xY0IF",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth2",
      "dev_names"         => ["eth2"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [
        {
          "active"   => true,
          "modprobe" => true,
          "modules"  => [["bnx2x", ""]]
        }
      ],
      "fcoeoffload"       => false,
      "iscsioffload"      => false,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "8gfM.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:c0" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 16 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_194_304_000 },
          { "active" => true, "length" => 8_388_608, "start" => 4_185_915_392 },
          { "active" => true, "length" => 65_536, "start" => 4_185_849_856 },
          { "active" => false, "length" => 131_072, "start" => 4_008_706_048 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => false,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.0",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.0",
      "unique_key"        => "mY_N.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth3",
      "dev_names"         => ["eth3"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [{ "active" => true, "modprobe" => true,
        "modules" => [["bnx2x", ""]] }],
      "fcoeoffload"       => false,
      "func_id"           => 1,
      "iscsioffload"      => false,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "E6aP.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:c2" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 17 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_169_138_176 },
          { "active" => true, "length" => 8_388_608, "start" => 4_160_749_568 },
          { "active" => true, "length" => 65_536, "start" => 4_160_684_032 },
          { "active" => false, "length" => 131_072, "start" => 4_008_837_120 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => false,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.1",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.1",
      "unique_key"        => "DkES.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth4",
      "dev_names"         => ["eth4"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [{ "active" => true, "modprobe" => true,
        "modules" => [["bnx2x", ""]] }],
      "fcoeoffload"       => false,
      "func_id"           => 2,
      "iscsioffload"      => true,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "JYUS.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:c4" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 17 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_143_972_352 },
          { "active" => true, "length" => 8_388_608, "start" => 4_135_583_744 },
          { "active" => true, "length" => 65_536, "start" => 4_135_518_208 },
          { "active" => false, "length" => 131_072, "start" => 4_008_968_192 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => true,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.2",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.2",
      "unique_key"        => "gvUW.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth5",
      "dev_names"         => ["eth5"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [{ "active" => true, "modprobe" => true,
        "modules" => [["bnx2x", ""]] }],
      "fcoeoffload"       => false,
      "func_id"           => 3,
      "iscsioffload"      => true,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "P_OV.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:c6" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 18 }],
        "link"   => [{ "state" => true }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_118_806_528 },
          { "active" => true, "length" => 8_388_608, "start" => 4_110_417_920 },
          { "active" => true, "length" => 65_536, "start" => 4_110_352_384 },
          { "active" => false, "length" => 131_072, "start" => 4_009_099_264 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => true,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.3",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.3",
      "unique_key"        => "75la.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth6",
      "dev_names"         => ["eth6"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [{ "active" => true, "modprobe" => true,
        "modules" => [["bnx2x", ""]] }],
      "fcoeoffload"       => false,
      "func_id"           => 4,
      "iscsioffload"      => false,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "UQJY.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:c8" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 18 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_093_640_704 },
          { "active" => true, "length" => 8_388_608, "start" => 4_085_252_096 },
          { "active" => true, "length" => 65_536, "start" => 4_085_186_560 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => false,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.4",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.4",
      "unique_key"        => "aG+e.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth7",
      "dev_names"         => ["eth7"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [{ "active" => true, "modprobe" => true,
        "modules" => [["bnx2x", ""]] }],
      "fcoeoffload"       => false,
      "func_id"           => 5,
      "iscsioffload"      => false,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "p790.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:ca" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 19 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_068_474_880 },
          { "active" => true, "length" => 8_388_608, "start" => 4_060_086_272 },
          { "active" => true, "length" => 65_536, "start" => 4_060_020_736 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => false,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.5",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.5",
      "unique_key"        => "GjA8.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth8",
      "dev_names"         => ["eth8"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [{ "active" => true, "modprobe" => true,
        "modules" => [["bnx2x", ""]] }],
      "fcoeoffload"       => false,
      "func_id"           => 6,
      "iscsioffload"      => false,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "uZ33.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:cc" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 19 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_043_309_056 },
          { "active" => true, "length" => 8_388_608, "start" => 4_034_920_448 },
          { "active" => true, "length" => 65_536, "start" => 4_034_854_912 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => false,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.6",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.6",
      "unique_key"        => "juQC.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 5,
      "class_id"          => 2,
      "dev_name"          => "eth9",
      "dev_names"         => ["eth9"],
      "device"            => "NetXtreme II BCM57810 10 Gigabit Ethernet",
      "device_id"         => 71_310,
      "driver"            => "bnx2x",
      "driver_module"     => "bnx2x",
      "drivers"           => [{ "active" => true, "modprobe" => true,
        "modules" => [["bnx2x", ""]] }],
      "fcoeoffload"       => false,
      "func_id"           => 7,
      "iscsioffload"      => false,
      "modalias"          => "pci:v000014E4d0000168Esv0000103Csd00001932bc02sc00i00",
      "model"             => "Broadcom NetXtreme II BCM57810 10 Gigabit Ethernet",
      "old_unique_key"    => "_+z5.1_OOfATRXRB",
      "parent_unique_key" => "vSkL.OM50y4+2iR6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:10:18:0a:0b:ce" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 16 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 8_388_608, "start" => 4_018_143_232 },
          { "active" => true, "length" => 8_388_608, "start" => 4_009_754_624 },
          { "active" => true, "length" => 65_536, "start" => 4_009_689_088 }
        ]
      },
      "rev"               => "16",
      "storageonly"       => false,
      "sub_class_id"      => 0,
      "sub_device_id"     => 71_986,
      "sub_vendor"        => "Hewlett-Packard Company",
      "sub_vendor_id"     => 69_692,
      "sysfs_bus_id"      => "0000:05:00.7",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:01.0/0000:05:00.7",
      "unique_key"        => "A4hG.1_OOfATRXRB",
      "vendor"            => "Broadcom",
      "vendor_id"         => 70_884
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 8,
      "class_id"          => 2,
      "dev_name"          => "eth11",
      "dev_names"         => ["eth11"],
      "device"            => "1010/1020/1007/1741 10Gbps CNA",
      "device_id"         => 65_556,
      "driver"            => "bna",
      "driver_module"     => "bna",
      "drivers"           => [{ "active" => true, "modprobe" => true, "modules" => [["bna", ""]] }],
      "func_id"           => 2,
      "modalias"          => "pci:v00001657d00000014sv00001657sd00000015bc02sc00i00",
      "model"             => "Brocade 1010/1020/1007/1741 10Gbps CNA - LL",
      "old_unique_key"    => "1Ozf.gC1EdhbENI3",
      "parent_unique_key" => "z8Q3.P0pg_62_Ak6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:05:1e:8c:d5:14" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 16 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 262_144, "start" => 4_226_547_712 },
          { "active" => true, "length" => 16_384, "start" => 4_226_482_176 },
          { "active" => false, "length" => 2_097_152, "start" => 3_963_617_280 }
        ]
      },
      "rev"               => "1",
      "sub_class_id"      => 0,
      "sub_device"        => "1010/1020/1007/1741 10Gbps CNA - LL",
      "sub_device_id"     => 65_557,
      "sub_vendor"        => "Brocade Communications Systems, Inc.",
      "sub_vendor_id"     => 71_255,
      "sysfs_bus_id"      => "0000:08:00.2",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:1c.0/0000:08:00.2",
      "unique_key"        => "U8xK.gC1EdhbENI3",
      "vendor"            => "Brocade Communications Systems, Inc.",
      "vendor_id"         => 71_255
    },
    {
      "bus"               => "PCI",
      "bus_hwcfg"         => "pci",
      "bus_id"            => 8,
      "class_id"          => 2,
      "dev_name"          => "eth10",
      "dev_names"         => ["eth10"],
      "device"            => "1010/1020/1007/1741 10Gbps CNA",
      "device_id"         => 65_556,
      "driver"            => "bna",
      "driver_module"     => "bna",
      "drivers"           => [{ "active" => true, "modprobe" => true, "modules" => [["bna", ""]] }],
      "func_id"           => 3,
      "modalias"          => "pci:v00001657d00000014sv00001657sd00000015bc02sc00i00",
      "model"             => "Brocade 1010/1020/1007/1741 10Gbps CNA - LL",
      "old_unique_key"    => "pnS1.gC1EdhbENI3",
      "parent_unique_key" => "z8Q3.P0pg_62_Ak6",
      "resource"          => {
        "hwaddr" => [{ "addr" => "00:05:1e:8c:d5:15" }],
        "irq"    => [{ "count" => 0, "enabled" => true, "irq" => 16 }],
        "link"   => [{ "state" => false }],
        "mem"    => [
          { "active" => true, "length" => 262_144, "start" => 4_226_023_424 },
          { "active" => true, "length" => 16_384, "start" => 4_225_957_888 },
          { "active" => false, "length" => 2_097_152, "start" => 3_965_714_432 }
        ]
      },
      "rev"               => "1",
      "sub_class_id"      => 0,
      "sub_device"        => "1010/1020/1007/1741 10Gbps CNA - LL",
      "sub_device_id"     => 65_557,
      "sub_vendor"        => "Brocade Communications Systems, Inc.",
      "sub_vendor_id"     => 71_255,
      "sysfs_bus_id"      => "0000:08:00.3",
      "sysfs_id"          => "/devices/pci0000:00/0000:00:1c.0/0000:08:00.3",
      "unique_key"        => "1zgG.gC1EdhbENI3",
      "vendor"            => "Brocade Communications Systems, Inc.",
      "vendor_id"         => 71_255
    }
  ]
end
