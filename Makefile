graft_pypi:
	python -m build
	twine upload --repository-url http://10.128.29.82:8080/ dist/*

pypi: dist
	twine upload dist/*

dist:
	-rm dist/*
	pip install build
	python3 -m build --sdist

test:
	python3 -m unittest discover --start-directory python_bindings/tests --pattern "*_test*.py"

clean:
	rm -rf *.egg-info build dist tmp var tests/__pycache__ hnswlib.cpython*.so

.PHONY: dist
