# PDF Viewer
<div id="pdf-container">Loading PDF viewer…</div>

<script>
(function(){
  const params = new URLSearchParams(location.search);
  const file = params.get('file');
  const container = document.getElementById('pdf-container');
  if (!file) {
    container.innerHTML = '<p>No PDF specified. Return to the list and choose a PDF.</p>';
    return;
  }
  // Basic sanitization: allow only safe characters and require 'assets/' in path
  if (!/^[A-Za-z0-9_\-./]+$/.test(file) || !file.includes('assets/')) {
    container.innerHTML = '<p>Invalid PDF path.</p>';
    return;
  }
  // When deployed MkDocs places this page at /pdf-viewer/, and assets are at /assets/...
  // Use a relative path that resolves from /pdf-viewer/ to /assets/ -> "../" + file
  const src = '../' + file;
  const iframe = document.createElement('iframe');
  iframe.src = src;
  iframe.width = '100%';
  iframe.height = '800';
  iframe.style.border = 'none';
  container.innerHTML = '';
  container.appendChild(iframe);
  const link = document.createElement('p');
  link.innerHTML = '<a href="' + src + '" target="_blank" rel="noopener">Open or download the PDF in a new tab</a>';
  container.appendChild(link);
})();
</script>
