# seqs=(c001 c002 c003)
gpu_id=0
for seq in ${@:2:3}
do
    CUDA_VISIBLE_DEVICES=${gpu_id} python detect2img.py --name ${seq} --weights yolov5x.pt --conf 0.1 --agnostic --save-conf --img-size 640 --classes 2 5 7 --exist-ok --cfg_file $1&
    gpu_id=$(($gpu_id+1))
done
wait

# seqs=(c004 c005)
gpu_id=0
for seq in ${@:4}
do
    CUDA_VISIBLE_DEVICES=${gpu_id} python detect2img.py --name ${seq} --weights yolov5x.pt --conf 0.1 --agnostic --save-conf --img-size 640 --classes 2 5 7 --exist-ok --cfg_file $1&
    gpu_id=$(($gpu_id+1))
done
wait

