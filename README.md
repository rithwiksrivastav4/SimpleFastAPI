# Running this application

* Get the code
```
git clone https://github.com/dummyrepos/SimpleFastAPI.git
```
* Now create a virtual environment and activate (local machines)
```
# windows
python -m venv .venv
.venv/scripts/activate
```
* INstall dependencies
```
pip install -r requirements.txt
```
* Run the application
```
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```