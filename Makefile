################################################################################
#
# Intel PRO/1000 Linux driver
# Copyright(c) 1999 - 2006 Intel Corporation.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2, as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Linux NICS <linux.nics@intel.com>
# e1000-devel Mailing List <e1000-devel@lists.sourceforge.net>
# Intel Corporation, 5200 N.E. Elam Young Parkway, Hillsboro, OR 97124-6497
#
################################################################################

#
# Makefile for the Intel(R) PRO/1000 ethernet driver
#
ifneq ($(KERNELRELEASE),)

obj-m += e1000_dev.o
e1000_dev-objs := e1000_main.o e1000_hw.o e1000_ethtool.o e1000_param.o

else

KERNELDIR?=/lib/modules/`uname -r`/build
PWD:=`pwd`

default: 
	echo $(KERNELDIR)
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	rm *.o *.ko *.mod.c modules.order Module.symvers
endif
