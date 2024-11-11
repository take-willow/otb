origin :
	rm -f otb.exe
	mkdir -p build
	(cd build; cmake ../src; make)
	cp build/otb.exe .

clean :
	rm -fr build/*

cleanall:
	rm -fr build/* 
	rm -f src/*.i90 src/*.i src/*genmod*
