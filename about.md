---
layout: page
title: About 
permalink: /about/
---

<img src="https://media.giphy.com/media/ODy29v7YAJrck/giphy.gif" width="180" height="100" />

|---|---|
| First name  | Karthikeyan |
| Last name  | Rathore |
| E-Mail Address | karthikerathore (at) gmail (dot) com.          |
| Master degree (2024 - present) | Artificial Intelligence at [BTU-Cottbus](https://www.b-tu.de/).   <br>  |
| Bachelor degree (2019 - 2023) | Computer Science |
| Social Links | [linkedIn](https://www.linkedin.com/in/karthikeyan-rathore/) / [github](https://github.com/karthikeyanrathore/) / [youtube](https://www.youtube.com/@karthikeyanrathore1486) |

<html>
  <body>
    short summary git-graph:
    <pre class="mermaid">
    %%{init: { 'logLevel': 'debug', 'theme': 'base','themeVariables': {'commitLabelFontSize': '14px', 'gitBranchLabel0': '#ffffff', 'gitBranchLabel1':'#ffffff'}, 'gitGraph': {'showBranches': true, 'showCommitLabel':true,'mainBranchName': 'Academic'}} }%%
    gitGraph
        commit id: "class 10th"
        commit id: "class 11th"
        commit id: "class 12th"
        commit id: "Bachelor's degree"
        branch career
        checkout career
        commit id: "software developer - intern"
        commit id: "software developer - Full Time"
        commit id: "Research Assistant"
        checkout Academic
        merge career
        commit id: "Master's degree"
    </pre>


    <script type="module">
      import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
      mermaid.initialize({ startOnLoad: true });
    </script>
  </body>
</html>
