
# Sample GLB Models and Heatmap Images for BytEdge FramEdge AI

## Required GLB Files (Place in ./models/ directory):
1. **package_model.glb** - Main 3D package model for visualization
2. **mesh_preview.glb** - Meshed model for mesh generation preview

## Required Heatmap Images (Place in ./heatmaps/ directory):
1. **corner.jpeg** - Corner impact stress heatmap
2. **edge.jpg** - Edge impact stress heatmap  
3. **face_front.jpeg** - Front face impact heatmap
4. **face_back.jpeg** - Back face impact heatmap
5. **face_side.jpeg** - Side face impact heatmap
6. **face_top.jpeg** - Top face impact heatmap

## Optional Files:
- **vibration_heatmap.gif** - Animated vibration stress visualization
- **transport_stress.jpeg** - Live data transport stress visualization

## File Requirements:
- GLB files: 3D models compatible with web viewers
- Image files: JPEG/JPG format, recommended 800x600 resolution
- File sizes: GLB < 50MB each, Images < 5MB each

## Notes:
The application will display placeholders if actual files are not present.
For production deployment, replace placeholders with actual 3D models and stress visualizations.
