if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x KUBECONFIG ~/.kube/config
set -x PATH $PATH /usr/local/cuda/bin

set -x PATH $PATH ~/.local/bin
set -x LANG C.UTF-8
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH /opt/android-sdk/tools
set --universal FZF_DEFAULT_COMMAND 'fd'

set PATH $PATH /usr/local/cuda/bin
# set LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda/lib64 /usr/lib/x86_64-linux-gnu
set LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda/targets/x86_64-linux/lib
set GPGPU_COMPILER_EXPORT /home/huaweil/compiler_a/x86_64_Linux_release

set P4USER huaweil
set P4PORT p4proxy-zj:2006
set P4CLIENT swrootlinux
set P4ROOT /home/huaweil
set VECTOR_LICENSE_FILE 1683@indc-lic-01:1787@sc-lic-25

set PATH $PATH ~/go/bin

source /home/huaweil/anaconda3/etc/fish/conf.d/conda.fish
