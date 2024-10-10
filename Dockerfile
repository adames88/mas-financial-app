# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install main dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install crewai and langchain-openai separately to resolve conflicts
RUN pip install --no-cache-dir -r crewai_requirements.txt

# Expose Streamlit's default port
EXPOSE 8501

# Run the Streamlit app when the container launches
CMD ["streamlit", "run", "app.py"]
