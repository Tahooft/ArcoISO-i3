# Mermaid markdown

# TB LR .. (Top-Bottom Left-Tight ..)

```mermaid
   flowchart TB
    A[Start] -->|Get money| Bar1(Go shopping)
    Bar1 --> C{Let me think}
        C -->|One| D[Laptop]
            D --> G{Tryout} 
                G --> H[Windows]
                G --> I[Linux]
                G --> J[Mac]
        C -->|Two| E[iPhone]
        C -->|Three| F[fa:fa-car Car]

```