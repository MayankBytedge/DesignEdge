#!/bin/bash

# BytEdge FramEdge AI Deployment Script

echo "🚀 Starting BytEdge FramEdge AI deployment..."

# ASCII Art Header
echo "
╔══════════════════════════════════════╗
║        BytEdge Technologies          ║
║     FramEdge AI Smart Designer       ║
╚══════════════════════════════════════╝
"

# Check prerequisites
echo "🔍 Checking prerequisites..."

if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "📥 Download: https://docs.docker.com/get-docker/"
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    echo "📥 Download: https://docs.docker.com/compose/install/"
    exit 1
fi

echo "✅ Prerequisites check completed"

# Create directory structure
echo "📁 Setting up directory structure..."
mkdir -p data uploads logs models heatmaps

# Check configuration
if [ ! -f .env_byteedge ]; then
    echo "⚠️  Environment file not found. Creating from template..."
    cp .env_byteedge .env
    echo "📝 Please edit .env file with your configuration:"
    echo "   🔑 Set your GEMINI_API_KEY"
    echo "   📁 Ensure GLB models are in ./models/"
    echo "   🎨 Ensure heatmap images are in ./heatmaps/"
    read -p "Press Enter after configuration is complete..."
else
    cp .env_byteedge .env
fi

# Build and deploy
echo "🔨 Building BytEdge FramEdge AI..."
docker-compose -f docker-compose_byteedge.yml build --no-cache

echo "🚀 Starting BytEdge FramEdge AI..."
docker-compose -f docker-compose_byteedge.yml up -d

# Wait for startup
echo "⏳ Waiting for application startup..."
sleep 15

# Health check
echo "🩺 Performing health check..."
if curl -f http://localhost:8501/_stcore/health &> /dev/null; then
    echo "
    ✅ BytEdge FramEdge AI is running successfully!

    🌐 Access the application:
       URL: http://localhost:8501

    📊 Features Available:
       • AI-Powered Design Analysis
       • 3D GLB Model Visualization  
       • FramEdge Smart Recommendations
       • Live Transport Simulation
       • Advanced FEA Analysis

    💡 Need Help?
       • View logs: docker-compose -f docker-compose_byteedge.yml logs -f
       • Stop app:  docker-compose -f docker-compose_byteedge.yml down
       • Restart:   docker-compose -f docker-compose_byteedge.yml restart
    "
else
    echo "❌ Application startup failed. Checking logs..."
    docker-compose -f docker-compose_byteedge.yml logs
    echo "
    🔧 Troubleshooting:
       • Check if port 8501 is available
       • Verify .env configuration
       • Ensure GLB/image files are present
       • Check Docker resource allocation
    "
fi

echo "© 2025 BytEdge Technologies - All Rights Reserved"
