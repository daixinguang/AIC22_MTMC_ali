MCMT_CONFIG_FILE="aic_S01.yml"
#### Run Detector.####
cd detector/
python gen_images_aic_dxg.py ${MCMT_CONFIG_FILE}

cd yolov5/
bash gen_det_dxg.sh ${MCMT_CONFIG_FILE} c001 c002 c003 c004 c005

cd ./reid_bidir/
python extract_image_feat.py "aic_reid1_S01.yml"
python extract_image_feat.py "aic_reid2_S01.yml"
python extract_image_feat.py "aic_reid3_S01.yml"
python merge_reid_feat_dxg.py ${MCMT_CONFIG_FILE}

#### MOT ####
cd ../tracker/MOTBaseline
sh run_aic.sh ${MCMT_CONFIG_FILE} c001 c002 c003 c004 c005

#### MCMVT ####
cd ../../reid_bidir/reid-matching/tools
python trajectory_fusion_dxg.py ${MCMT_CONFIG_FILE}
python sub_cluster_dxg.py ${MCMT_CONFIG_FILE}
python gen_res.py ${MCMT_CONFIG_FILE}
python interpolation.py ${MCMT_CONFIG_FILE}


