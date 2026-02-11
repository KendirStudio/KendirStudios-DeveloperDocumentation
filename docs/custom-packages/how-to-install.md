# How to install
## 1. Install via Unity Package Manager
Open Unity.

Go to Window → Package Manager.

Click the ➕ (Add) button in the top-left corner.

Select “Add package from Git URL…”

Paste the desired package URL, for example:

```
URL Example
https://oauth2:TOKEN@gitlab.com/Kendir_Custom_Packages/custom-packages.git?path=/Packages/com.kendirstudios.package-name
```

Click Add.

Unity will fetch the package, verify it, and add it to your project.

## 2. Install by Editing the manifest.json File

You can also install packages directly by modifying Unity’s dependency list.

Go to your Unity project folder:

ProjectRoot/Packages/manifest.json

Open the file in your preferred text editor.

Inside the "dependencies" section, add a new entry for the package.
Example:
```
Entry Example
{
  "dependencies": {
    "com.kendirstudios.package-name": "https://oauth2:TOKEN@gitlab.com/Kendir_Custom_Packages/custom-packages.git?path=/Packages/com.kendirstudios.package-name",
    "com.unity.modules.ui": "1.0.0",
    "com.unity.modules.audio": "1.0.0"
  }
}
```

Save the file and return to Unity.

Unity will automatically refresh and install the package.

## Available Packages

You can find all available package URLs in the [Available Packages](../available-packages-urls/) section of this documentation.