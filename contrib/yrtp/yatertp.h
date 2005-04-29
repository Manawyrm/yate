/**
 * yatertp.h
 * Yet Another RTP Stack
 * This file is part of the YATE Project http://YATE.null.ro
 *
 * Yet Another Telephony Engine - a fully featured software PBX and IVR
 * Copyright (C) 2004, 2005 Null Team
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#ifndef __YATERTP_H
#define __YATERTP_H

#include <yateclass.h>

#ifdef _WINDOWS
#ifdef LIBYRTP_EXPORTS
#define YRTP_API __declspec(dllexport)
#else
#define YRTP_API __declspec(dllimport)
#endif
#else
#define YRTP_API
#endif /* _WINDOWS */

namespace TelEngine {


}

#endif /* __YATERTP_H */

/* vi: set ts=8 sw=4 sts=4 noet: */
