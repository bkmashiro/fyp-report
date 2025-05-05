#import "@preview/touying:0.6.1": *
#import themes.university: *

#import "@preview/numbly:0.1.0": numbly

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [SnapSphere],
    subtitle: [Immersive Photo Experience],
    author: [Yuzhe Shi],
    date: datetime.today(),
    institution: [South East Technological University],
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

= Before Everything
== Overview
This slides will mainly focus on:
- Core Technologies
- System Design

This slides will not cover:
- Implementation details (too much, see report)
- User manual



= Introduction

== What is SnapSphere?

SnapSphere is a application that allows users to capture and view photos in an immersive environment, with a strong emphasis on user privacy and copyright protection.
// The app ensures that all captured content remains under the user's control, with clear ownership rights and privacy settings.

An AR gallery + A collection of copyright / privacy protection methods
#footnote("I'm going to quickly cover the UI part (AR gallery) and explain what's happening behind the scene (technical part)")
.

In short words:

- Put medias at anywhere in the real world
- with a *sharable, interactive, persistent* experience

== Why?
=== User Experience

Traditional photo experiences are *not awsome enough*.

- No interaction
- No direct link to the real world

=== AR Limitations

Traditional AR using GPS#footnote("accuracy: ~4.9m") to locate AR space, which is not accurate enough for indoor use.

#pagebreak()
#[
  // #set text(fill: rgb("ffcbc45e"))

  #set page(
    background: rotate(
      24deg,
      repeat()[
        #repeat()[#text(18pt, fill: rgb("ffcbc45e"))[
            #stack(
              for idx in range(1, 7) {
                [
                  #v(1em)

                  #text(18pt, fill: rgb("#ffcbc45e"))[
                    I am
                  ]
                  #v(1em)
                  #text(18pt, fill: rgb("ffcbc45e"))[
                    watermark
                  ]
                ]
              }
            )
          ]
        ]
      ],
    ),
  )

  === Digital Media Misappropriation

  Digital medias are easily misappropriated, and it's hard to prove ownership.

  Visiable watermark is easy to remove, and interfere with the user experience.
]



== Concerns
=== Claim Copyright (Block Chain)
- Undeniable, Untamperable, Unique
  - Create a permanent proof of ownership

=== Copyright Protection
- Fast query (Perceptual hash)
  - We can query the original media and owner by the hash
- Leak trace (Identifier embedding)
  - We can trace the leak back to the original media, even the user who leaked it
- Zero trust by design
  - This can be done without backend (without centralized authority)

=== Experience (Blind waterMark)
- No visiable watermark

=== Privacy (Zero-knowledge proof)
- Best-effort on-device processing
  - No need to upload media/personal info to the cloud when create copyright claim
  - Copyright verification can be done offline, without uploading media / revealing personal info


= Core Technologies
== Cloud Anchor

Cloud Anchor is a reference point connecting real world and AR space.

#figure(caption: [Create an anchor using environment features])[
  #image("../images/impl/cloud-anchor-part-1.png", width: 70%)
]

#pagebreak()
=== Create / Resolve Anchor
An anchor needs local environmental features to be created / resolved.

#grid(columns: 2)[
  #figure(caption: [SIFT#footnote("Scale-invariant feature transform, @OpenCV")])[
    #image("images/impl/sift.png", width: 60%)
  ]
][
  #figure(caption: [SLAM#footnote("Simultaneous localization and mapping, @OpenCV")])[
    #image("images/impl/slam.png", width: 80%)
  ]
]

#matrix-slide[
  #figure(caption: [ICP#footnote("Iterative closest point, @École polytechnique")])[
    #image("images/impl/icp.png", width: 70%)
  ]

][
  #align(left)[
    In this way, a local environment feature can be extracted, shared, and matched across different devices.

    Device can compare the local feature with the shared one, and estimate the relative pose to the anchor.

    The relative pose to the anchor is used later in positioning contents in AR.
  ]
]


// === Demo

#matrix-slide[
  #align(left)[
    To create/load a scene, an anchor must be created or resolved.

    This provides a semi-persistent reference point connecting the media to the real world.

    Accuracy is centimeter-level.
  ]
][
  #figure(caption: "Create an anchor")[
    #image("images/anchor.png", width: 70%)
  ]
]

#matrix-slide[
  #align(left)[
    Capture media / load existing media.
  ]
][
  #figure(caption: [Portrait a waste bin])[
    #image("images/portrait.png", width: 70%)
  ]
]

#matrix-slide[
  #align(left)[
    Someone else leave their comment in the same scene.
  ]
][
  #figure(caption: [Scene is shared])[
    #image("images/waste-bin-2.png", width: 70%)
  ]
]


#pagebreak()

== Scene Hierarchy

The scene is a tree structure, with the anchor as the root.

Each node can contain a media or be a container for other nodes.

- Load a scene
  - Resolve anchors in the scene
    - Once an anchor is resolved, load the children objects recursively, transform is relative to parent.

== Invisible Watermarking

Use invisible watermarking to embed copyright/tracking information into the media. Extraction does not require the original media.

#figure(caption: [invisible watermarking])[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    stack(
      image("../images/p-hash/cat.jpg", width: 100%),
      "",
      align(center)[Original],
    ),
    stack(
      image("../images/p-hash/cat_embed.png", width: 100%),
      "",
      align(center)[Embedded],
    ),
    stack(
      image("../images/p-hash/residual.png", width: 100%),
      "",
      align(center)[Residual],
    ),
  )
]

=== Method // Steganography

1. Convert RGB to YUV, focus on Y channel
2. Apply Discrete Wavelet Transform for multi-resolution analysis
3. Process 4×4 blocks with Discrete Cosine Transform
4. Embed data using Singular Value Decomposition (modify the first two singular values)
5. Reconstruct image with inverse transforms

== Perceptual Hashing

Perceptual hashing is a technique to hash an image into a fixed-length vector. Similar images have similar hash values.

#figure()[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    stack(
      image("../images/p-hash/cat.jpg", width: 70%),
      "",
      align(center)[p-hash: 070f0f0d1f05#text(blue, "ce06")],
    ),
    stack(
      image("../images/p-hash/cat_embed_edit.png", width: 70%),
      "",
      align(center)[p-hash: 070f0f0d1f05#text(red, "8c8e")],
    ),
  )
]

== Similarity Search

#pagebreak()

Hamming distance is used to measure the similarity between two p-hash values.

$
  text("Hamming distance") = sum(
    bold(x)_i xor bold(y)_i
  )
$


IVFFlat is used to accelerate the search k-nearest neighbors.

In this way, we can find the most similar images in database to a given image.

== Blockchain-based Copyright Protection


The blockchain-based copyright protection system combines perceptual hashing with author identity to create a tamper-proof record of image ownership.

Key benefits:
- Undeniable ownership proof
- Tamper-proof records
- Decentralized verification
- Privacy protection

#pagebreak()

#figure(caption: [Image ownership query])[
  #image("images/impl/block-chain-verify.png", width: 50%)
]

== Zero-knowledge proof

Zero-knowledge proofs (ZKPs) allow proving a statement without revealing any additional information.

- Prove ownership without revealing content
- Verify without exposing identity
- Maintain privacy while ensuring authenticity

#pagebreak()

#figure(caption: [Zero-knowledge proof process])[
  #image("images/impl/zk.png", width: 60%)
]

- Prover create `Keccak256` hash of the artwork and a identifier, submit to server
- A ZKP#footnote("Explainations see report.") is created and uploaded to blockchain
- Verifier can verify the proof locally

= System Design
== Mobile App

Developed with Unity 6.0, C\#, AR Foundation.

#figure(caption: [Unity Development Environment])[
  #image("images/unity.png", width: 60%)
]

== Backend

Nest.js(on top of Express.js) as framework.

Integrate with Hedera Hashgraph (blockchain), PostgreSQL (database), Redis (cache), S3 (storage).

#figure(caption: [Backend Modules])[
  #image("images/modules-simp.png", width: 100%)
]

== Frontend

Frontend stack:
- Nuxt.js as the framework
- Vue 3 with Composition API
- TypeScript for type safety
- Tailwind CSS for styling
- Pinia for state management
- Vue Router for navigation
- Axios for HTTP requests

Development tools:
- OpenAPI Codegen for API client generation
- Prettier for code formatting
- Vite for build tooling

== DevOps

CI/CD pipeline with Github Actions.

Vercel for frontend deployment.

Heroku for backend deployment.

Cloudflare for CDN.

== Conclusion

- Shareable, interactive, persistent AR experience
- Decentralized, tamper-proof, privacy-preserving copyright protection

