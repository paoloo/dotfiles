function conda_prompt() {
	CONDAENV=`echo $CONDA_DEFAULT_ENV | sed 's/base//'`
	if [[ "${CONDAENV}" == "base" || "${CONDAENV}" == "" ]]
	then
		echo ""
	else
		LSYM=$(echo -e "\xee\x82\xb3")
		RSYM=$(echo -e "\xee\x82\xb1")
		echo "$LSYM $CONDA_DEFAULT_ENV $RSYM"
	fi
}

alias condals='for dir in `ls $HOME/miniconda3/envs`; do echo $dir; done'
