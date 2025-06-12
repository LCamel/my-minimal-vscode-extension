Use `r.sh` to build/run the extension.

Or you can create a `.vscode/launch.json`:
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Run My Extension",
      "type": "extensionHost",
      "request": "launch",
      "args": [
        "--extensionDevelopmentPath=${workspaceFolder}"
      ]
    }
  ]
}
```