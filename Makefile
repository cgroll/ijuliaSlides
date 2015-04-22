# list of notebook names
SRC_DIR := $(HOME)/research/ijuliaSlides/src

DOCK_NAME := juliafinmetrix/jfinm_stable
DOCK_HOME := /home/jovyan
DOCK_MOUNT := $(DOCK_HOME)/mount

IT_NAME := iterators_comprehensions_and_map.ipynb
JL_FEAT_NAME := julia_features.ipynb

all: iterators features

INFO_TEXT := Makefile copies new version of notebook sources to directory ijuliaSlides/src/ and uses docker image to convert source files to html slides. html slides are then moved to ijuliaSlides/ directory. If there are problems with running make, check that ijuliaSlides/src subdirectory exists.

info:
	echo $(INFO_TEXT) \
	& echo \
	& echo

iterators:
	cp $(HOME)/research/ijuliaNb/julia/$(IT_NAME) src/
	docker run --rm -v $(SRC_DIR):$(DOCK_MOUNT) -w $(DOCK_MOUNT) $(DOCK_NAME) \
	  ipython nbconvert --to slides $(IT_NAME)
	mv src/$(basename $(IT_NAME)).slides.html .

features:
	cp $(HOME)/research/ijuliaNb/julia/$(JL_FEAT_NAME) src/
	docker run --rm -v $(SRC_DIR):$(DOCK_MOUNT) -w $(DOCK_MOUNT) $(DOCK_NAME) \
	  ipython nbconvert --to slides $(JL_FEAT_NAME)
	mv src/$(basename $(JL_FEAT_NAME)).slides.html .

