# Don't set prefix, umake does.
PACKAGE_BRAND = gostai
URBI_ENV = $(UMAKE_URBI_ENV)
URBI_HOST = i686-pc-linux-gnu
branddir = ${prefix}/${PACKAGE_BRAND}
hostdir = ${branddir}/core/${URBI_HOST}
envdir = ${branddir}/core/${URBI_HOST}/$(URBI_ENV)
builddir = $(UMAKE_BUILD_DIR)
#${branddir}/core/${URBI_HOST}/$(URBI_ENV)

# The basename (no extension) of the library we should link against.
# This default value is for backward compatibility: find the
# (hopefully) unique lib here.
LIBNAME = $(UMAKE_LIBNAME)

# SDK flags.
SDK_CFLAGS =  -pthread
SDK_CXXFLAGS =  -pthread -I/usr/local/include -pthread
SDK_LDFLAGS = -L${envdir}
SDK_LIBS =  

# CPP.
CPP = gcc -E
URBI_KERNEL_PATH = /usr/local

# Upper case.
URBI_ENV_CPPFLAGS = -DURBI_ENV_$(shell echo "$(URBI_ENV)" | tr 'a-z' 'A-Z')

CPPFLAGS =  -I$(prefix)/include			\
           -I$(URBI_KERNEL_PATH)/gostai/kernel/include		\
	   $(URBI_ENV_CPPFLAGS)
ALL_CPPFLAGS = $(PRE_CPPFLAGS) $(CPPFLAGS) $(EXTRA_CPPFLAGS)

# C.
CC = gcc
CFLAGS = -g -O2 $(SDK_CFLAGS)

# C++.
WARNING_CXXFLAGS =  -Wno-deprecated -Wall -W -Woverloaded-virtual -Wformat -Werror
CXXFLAGS = $(WARNING_CXXFLAGS) -g -O2 $(SDK_CXXFLAGS)
CXX = g++

# Ld.
LD = gcc
LIBS = $(SDK_LIBS)
LDFLAGS =  -L/usr/local/lib -R/usr/local/lib $(SDK_LDFLAGS)


# Libtool.
LIBTOOL = $(hostdir)/libtool
HOBJECTS = $(OBJECTS:.o=.$(URBI_HOST).o)
LTOBJECTS = $(HOBJECTS:.o=.lo)
OUTBIN = nothing
OUTLIB = nothing2

# Commands to compile and link.  Inspired from Automake's.
COMPILE = $(CC) $(ALL_CPPFLAGS) $(CFLAGS)
LTCOMPILE = $(LIBTOOL) --tag=C --mode=compile $(COMPILE)
CXXCOMPILE = $(CXX) $(ALL_CPPFLAGS) $(CXXFLAGS)
LTCXXCOMPILE = $(LIBTOOL) --tag=CXX --mode=compile $(CXXCOMPILE)
CXXLINK = $(LIBTOOL) --tag=CXX --mode=link \
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) -o $@

# We use GNU Make pattern rules so that we can provide extra
# dependencies.  Before changing something, read the doc.
#
#    Suffix rules cannot have any prerequisites of their own.  If they
#    have any, they are treated as normal files with funny names, not as
#    suffix rules.  Thus, the rule:
#
#      .c.o: foo.h
#              $(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
#
#    tells how to make the file `.c.o' from the prerequisite file `foo.h',
#    and is not at all like the pattern rule:
#
#      %.o: %.c foo.h
#              $(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
#
#    which tells how to make `.o' files from `.c' files, and makes all `.o'
#    files using this pattern rule also depend on `foo.h'.
$(builddir)/%.$(URBI_HOST).lo: %.c $(HEADERS)
	$(LTCOMPILE) -c -o $@ $<

$(builddir)/%.$(URBI_HOST).lo: %.cc $(HEADERS)
	$(LTCXXCOMPILE) -c -o $@ $<

$(builddir)/%.$(URBI_HOST).lo: %.cpp $(HEADERS)
	$(LTCXXCOMPILE) -c -o $@ $<

# UObject target.
$(OUTLIB): $(LTOBJECTS) $(ARGUMENT_LIBS)
	$(CXXLINK) $(LTOBJECTS) $(ARGUMENT_LIBS) $(LIBS)

# The command to generate the library.
#
# We pass -whole-archive because there are global objects to be
# created that are not called by the main compilation units.  In that
# case the linker does not add these objects files in the result, and
# the final executable does not have the global objects contructed.
UMAKE_LINK = umake-link
LINK =						\
$(UMAKE_LINK) --libtool='$(LIBTOOL)'		\
	      --env='$(URBI_ENV)'		\
	      --host='$(URBI_HOST)'		\
	      --
$(OUTBIN): $(LTOBJECTS) $(ARGUMENT_LIBS)
	$(LINK) \
	    $(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ \
	    $(ARGUMENT_LIBS) $(LIBS) $(LTOBJECTS) \
	    $(envdir)/$(LIBNAME).la \
	    $(EXTRA_LDFLAGS)

clean:
	$(RM) *.lo *.o
