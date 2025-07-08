# MKDocs 
Documentation based on this tutorial: [How To Create STUNNING Code Documentation With MkDocs Material Theme](https://www.youtube.com/watch?v=Q-YA_dA8C20)

For full MKDocs documentation visit [mkdocs.org](https://www.mkdocs.org).

## About
We are using MKdocs to create this documentation page, here's the necessary steps:

## How to Edit
1. Open a new terminal `Terminal -> New Terminal` on the `KendirStudios-DeveloperDocumentation` directory
2. Call serve command:
    - Windows: 
        <pre><code>python -m mkdocs serve</code></pre>
    - Mac
        <pre><code>mkdocs serve</code></pre>
3. Open the project link, it can be found at the end of the serve command's response:

    INFO    -  Building documentation...

    INFO    -  Cleaning site directory

    INFO    -  Documentation built in 0.48 seconds

    INFO    -  [18:43:38] Watching paths for changes: 'docs', 'mkdocs.yml'

    INFO    -  [18:43:38] Serving on <tagname style="background-color:grey;">http://127.0.0.1:8000/</tagname>
4. Edit `.md` files inside the `docs` and the mkdocs.yml files as necessary.
5. After saving the files, the local page will update accordingly.

## How to update github pages
1. `Commit` wanted changes to the `main` branch. 
    <p style = "font-size:15px;"> The github pages will handle updating when the commit is pushed.</p>