if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x KUBECONFIG ~/.kube/config
set -x PATH $PATH /usr/local/cuda/bin

set -x PATH $PATH ~/.local/bin

set -x PATH $PATH ~/.cargo/bin
set --universal FZF_DEFAULT_COMMAND 'fd'

set PATH $PATH /usr/local/cuda/bin
set LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/cuda/lib64 /usr/lib/x86_64-linux-gnu
set GPGPU_COMPILER_EXPORT /home/huaweil/compiler_a/x86_64_Linux_release

set P4USER huaweil
set P4PORT p4proxy-zj:2006
set P4CLIENT swrootlinux
set P4ROOT /home/huaweil

source /home/huaweil/anaconda3/etc/fish/conf.d/conda.fish
