
# User specific aliases and functions
alias lxp="ssh -XAY shall@lxplus.cern.ch"
alias lxp5="ssh -XAY shall@lxplus5.cern.ch"
alias lxp6="ssh -XAY shall@lxplus6.cern.ch"
alias lx5="ssh -XAY sch11@lx05.hep.ph.ic.ac.uk"
alias lx6="ssh -XAY sch11@lx06.hep.ph.ic.ac.uk"
alias sifi="ssh -XAY root@pclbscifi01"
alias pdg="firefox http://pdglive.lbl.gov/listings1.brl?quickin=Y"
alias vv4="cd /vols/lhcbdisk04/shall"
alias print="lp -d lp4345 -o sides=two-sided-long-edge "
alias vin="vim"
alias vi="vim"
alias bdt="python /afs/cern.ch/work/s/shall/public/bdt/bdtRun.py"
alias bible="evince /home/hep/sch11/scripts/lhcbdetector.pdf"
alias pyroot="echo 'from ROOT import TTree, TFile, TH1F, TCanvas' && python"
alias spb="SetupProject Bender && ~/scripts/draw.py bender"
alias sdv="SetupProject DaVinci && ~/scripts/draw.py monalisa"
alias spg="SetupProject Ganga && ~/scripts/draw.py gengar"
alias spu="SetupProject Urania && ~/scripts/draw.py uranus"
alias draw="/home/hep/sch11/scripts/draw.py"
alias ws="cd /afs/cern.ch/work/s/shall"
alias SetupLatex="PATH=$PATH:/afs/cern.ch/sw/XML/texlive/latest/bin/x86_64-linux/ && export PATH"
alias variables='root -l variables.C\(\"TMVA.root\",\"Method_BDT/BDT\"\)'
alias sroot=". /afs/cern.ch/sw/lcg/external/gcc/4.3.2/x86_64-slc5/setup.sh && . /afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.05/x86_64-slc5-gcc43-opt/root/bin/thisroot.sh"

# paths
LX4="sch11@lx04.hep.ph.ic.ac.uk"
LX5="sch11@lx05.hep.ph.ic.ac.uk"
LX6="sch11@lx06.hep.ph.ic.ac.uk"
LX4V="sch11@lx04.hep.ph.ic.ac.uk:/vols/lhcbdisk04/shall"
LX5V="sch11@lx05.hep.ph.ic.ac.uk:/vols/lhcbdisk04/shall"
LX6V="sch11@lx06.hep.ph.ic.ac.uk:/vols/lhcbdisk04/shall"
LXP="shall@lxplus5.cern.ch"
LXPW="shall@lxplus5.cern.ch:/afs/cern.ch/work/s/shall"
WS="/afs/cern.ch/work/s/shall"

alias mountAfs='sshfs shall@lxplus.cern.ch:/afs/cern.ch/work/s/shall ~/work/afs/'

DLHCB="https://svn.cern.ch/reps/lhcbdocs"
DICL="svn+ssh://svn.cern.ch/reps/lhcbimperial/Users"

PYTHONPATH=${PYTHONPATH}:~/src/GangaUtils
PYTHONPATH=${PYTHONPATH}:/afs/cern.ch/user/s/shall/scripts

