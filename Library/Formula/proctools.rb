require 'formula'

class Proctools <Formula
  @version='0.4pre1'
  @url='http://downloads.sourceforge.net/project/proctools/proctools/0.4pre1/proctools-0.4pre1.tar.gz'
  @homepage='http://proctools.sourceforge.net/'
  @md5='714e4350749c680a7806635632d524b1'

  def patches
    base = "http://svn.macports.org/repository/macports/trunk/dports/sysutils/proctools/files"
    { :p0 => ["patch-pfind-Makefile.diff",
              "patch-pfind-pfind.c.diff",
              "patch-pgrep-Makefile.diff",
              "patch-pkill-Makefile.diff",
              "patch-proctools-fmt.c.diff",
              "patch-proctools-proctools.c.diff",
              "patch-proctools-proctools.h.diff",
             ].map { |file_name| "#{base}/#{file_name}" }
    }
  end
  
  def install
    system "/usr/bin/bsdmake"
    
    ["pgrep/pgrep", "pkill/pkill", "pfind/pfind"].each do |prog|
      bin.install prog
      man1.install prog + ".1"
    end
  end
end
