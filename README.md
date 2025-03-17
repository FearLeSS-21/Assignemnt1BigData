
# Assignemnt1BigData
=======
# Data Processing Pipeline using Docker

## 1. Dockerfile Setup
The Dockerfile is configured to:
- Use **Ubuntu** as the base image.
- Install required Python packages: `python3`, `pip`, `pandas`, `numpy`, `seaborn`, `matplotlib`, `scikit-learn`, and `scipy`.
- Create a directory inside the container at `/home/doc-bd-a1/`.
- Copy the dataset from the local machine to the container.
- Open a Bash shell upon container startup.

## 2. How to Build & Run the Container

### **Step 1: Build the Docker Image**
Run the following command in the terminal:
```bash
cd bd-a1

docker build -t bd-a1-image .
```

### **Step 2: Run the Container**
```bash
docker run -it --name bd-a1-container bd-a1-image
```
This starts the container with an interactive shell.

## 3. How to Execute the Pipeline

### **Step 1: Inside the container, navigate to the working directory**
```bash
cd /home/doc-bd-a1
```

### **Step 2: Run the pipeline using the dataset path**
```bash
python3 load.py <dataset-path>
```
This triggers the sequential execution of:
- `load.py` → Reads dataset
- `dpre.py` → Data cleaning, transformation, reduction, and discretization
- `eda.py` → Generates insights as text files
- `vis.py` → Saves visualization as `vis.png`
- `model.py` → Performs K-means clustering and saves cluster records count

## 4. How to Retrieve Results

After executing the pipeline, run the following command on your **local machine** (outside the container):

```bash
bash final.sh
```
This script will:
- Copy the results from the container to `bd-a1/service-result/` on your local machine.
- Stop the container.

### **Output Files in `bd-a1/service-result/`**
- `res_dpre.csv` → Processed dataset after data cleaning & transformation
- `eda-in-1.txt`, `eda-in-2.txt`, `eda-in-3.txt` → Text insights from EDA
- `vis.png` → Data visualization
- `k.txt` → K-means clustering result

## 5. Bonus: Push Docker Image & Code to GitHub

### **Push Docker Image to Docker Hub**
```bash
docker tag bd-a1-image <your-dockerhub-username>/bd-a1-image
docker login
docker push <your-dockerhub-username>/bd-a1-image
```

### **Push Project Files to GitHub**
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <your-github-repo-url>
git push -u origin main
```

---
This completes the Docker-based data processing pipeline setup and execution. 🚀
>>>>>>> 3c0056b (Initial commit)
