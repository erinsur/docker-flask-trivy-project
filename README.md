# Dockerized Flask App with DevSecOps Pipeline

This project demonstrates a complete DevSecOps workflow by containerizing a simple Python Flask web application, scanning it for security vulnerabilities with Trivy, and simulating an automated CI/CD security gate.

## Key Features

* **Containerization:** The application is fully containerized using Docker for portability and consistent deployment.
* **Vulnerability Scanning:** Integrated Trivy to scan the Docker image for known CVEs in both OS packages and Python dependencies.
* **Automated Security Gate:** Includes a simple shell script (`build_and_scan.sh`) to simulate a CI/CD pipeline that automatically builds the image and fails the build if high-severity vulnerabilities are detected.
* **Vulnerability Remediation:** The project demonstrates the process of identifying, patching (by upgrading dependencies), and verifying the fix for discovered vulnerabilities.

## Technology Stack

* **Backend:** Python, Flask
* **Containerization:** Docker
* **Security:** Trivy
* **Automation:** Bash Scripting

## Setup and Usage

### Prerequisites

* Docker installed and running.
* Trivy installed.

### Running the Application

1.  **Build the Docker Image:**
    ```bash
    docker build -t my-flask-app .
    ```

2.  **Run the Container:**
    ```bash
    docker run -p 5001:5000 my-flask-app
    ```
3.  Access the application in your browser at `http://localhost:5001`.

    > **Note:** If port `5001` is already in use on your machine, you can map any other available port to the container's port `5000`. For example, to use port 8080 on your machine, you would run: `docker run -p 8080:5000 my-flask-app`

### Running the Security Scan Pipeline

This script automates the build and scan process, acting as a security gate.

1.  **Make the script executable (only needs to be done once):**
    ```bash
    chmod +x build_and_scan.sh
    ```

2.  **Run the pipeline:**
    ```bash
    ./build_and_scan.sh
    ```
    The script will build the image and then scan it. If HIGH or CRITICAL severity vulnerabilities are found, the script will exit with an error code, simulating a failed build.

## The DevSecOps Workflow Demonstrated

This project showcases a fundamental DevSecOps loop:

1.  **Build:** A developer commits code, and a Docker image is built.
2.  **Scan:** The image is automatically scanned for vulnerabilities before it can be deployed.
3.  **Identify:** The Trivy report identifies specific CVEs, the affected packages, and the versions required to fix them.
4.  **Remediate:** A developer fixes the issue (e.g., by updating the `requirements.txt` or the `Dockerfile`) and commits the change.
5.  **Verify:** The pipeline runs again, and the new scan confirms that the high-severity vulnerabilities have been resolved, allowing the build to pass.
