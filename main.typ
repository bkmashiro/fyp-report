#import "@preview/grape-suite:2.0.0": seminar-paper, german-dates
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/gentle-clues:1.2.0": *

#show: codly-init.with()

#codly(languages: codly-languages)

#set text(lang: "en")
#set page(paper: "a4")
#show: seminar-paper.project.with(
  title: "SnapSphere",
  subtitle: "Immersive Photo Experience",
  text-font: "Atkinson Hyperlegible",
  math-font: "STIX Two Math",

  university: [
    Dr. Sinead O'Neill \
    #link("Sinead.ONeill\@setu.ie")[
      Sinead.ONeill\@setu.ie
    ] \
    South East Technological University
  ],
  faculty: [School of Science],
  institute: [Department of Computing and Maths],
  docent: [],
  seminar: [],

  submit-to: [Supervisor],
  submit-by: [Author],

  // semester: german-dates.semester(datetime.today()),
  semester: "Final Year Project Report",

  author: "Yuzhe Shi",
  email: [
    #link("20108862\@mail.wit.ie")[
      20108862\@mail.wit.ie
    ]
  ],
  address: [
    South East Technological University
  ],
  show-declaration-of-independent-work: false,
)

#align(center + horizon)[
  Yuzhe Shi \
  #link("mailto:20108862@mail.wit.ie")

  #v(2em)

  This project is a part of my final year project in \ South East Technological University.

  #v(2em)

  This project is open source and available on GitHub:

  #block()[
    #align(left)[
      - Frontend: #link("https://github.com/bkmashiro/fyp-next")
      - Backend: #link("https://github.com/bkmashiro/fyp-backend")
      - Demo App: #link("https://github.com/bkmashiro/fyp-next-unity")
      - Landing Page: #link("https://fl.yuzhes.com")
      - Production Demo: #link("https://fyp.yuzhes.com")
      - Report: #link("https://github.com/bkmashiro/fyp-report")
    ]
  ]

  #v(4em)
  TL;DR:

  The most interesting part:
  #block()[
    #align(left)[

      - Invisible watermarking (@invisible-watermarking)
      - Blockchain-based copyright protection (@blockchain-based-copyright-protection)
      - Fast full-database image search (@image-similarity-search)
      - Zero-knowledge proof for photo ownership (@zkp)
    ]
  ]
]

#pagebreak()
#heading(outlined: false, numbering: none, [Statement of Original Authorship])

I hereby declare that this proposal, entitled _SnapSphere - Immersive photo experience - Final Year Project Report_, is the result of my own independent work, and all sources of information and assistance have been fully acknowledged. I confirm that, to the best of my knowledge, this work has not been previously submitted to any other academic institution for a degree or diploma, either in part or in whole.

Any external contributions or collaborative input have been cited appropriately, and all necessary permissions for the use of copyrighted materials have been obtained.

I understand the implications of academic integrity policies and am aware that any breach of these policies may result in academic penalties.

#v(1cm)

#table(
  columns: (auto, auto, auto, auto),
  stroke: white,
  inset: 0cm,

  strong([Signature (Seal):]) + h(0.5cm),
  repeat("." + hide("'")),
  h(0.5cm) + strong([Date:]) + h(0.5cm),
  // repeat("."+hide("'")),
  datetime.today().display("[month repr:short].[day], [year]")
)


#pagebreak()
= Introduction
== Project Overview

This project consists of a *mobile app* and *a web management interface* and a *backend service*. The mobile app allows users to capture and view photos, send comments and likes in Augmented Reality (AR). The web management interface allows administrators to manage the scenes and the photos. The backend service provides a RESTful and websocket API for the mobile app and the web management interface to interact with each other.

The system provides users with an immersive augmented reality experience, allowing them to enter a virtual AR world where they can load and explore various scenes. Within these scenes, users can view and interact with 3D elements, create and place new AR content, and leave comments to share their thoughts. The web interface complements this experience by enabling users to discover other people's creations, manage their own scenes, and engage with the broader community. This creates a dynamic ecosystem where users can both experience and contribute to the AR environment, fostering creative expression and social interaction.

#figure(caption: "Conceptual diagram of the system")[
  #image("images/demo/demo.png", width: 70%)
]

The project implements a comprehensive security framework that combines machine learning, blockchain, invisible watermarking, and zero-knowledge proofs to create a robust system for data security and privacy protection. This multi-layered approach ensures tamper-proof ownership records, efficient copyright protection, and privacy-preserving verification while maintaining user data confidentiality.


#align(bottom)[
  #align(center)[
    #text(gray, size: 9pt)[
      _Note that the content covered in the Proposal has been moved to @sem1-proposal _ 
    ]
  ]
]

= Technology Stack and Tools

== Mobile App Development

=== Core Technologies
- Unity 6.0@unity-doc
  - A game engine that makes it easy to create 3D and AR applications
  - Provides tools for building apps for both iOS and Android
  - Handles complex graphics and physics calculations

#figure(caption: "Unity Editor - App UI")[
  #image("images/unity-editor/image-20250423203925840.png", width: 50%)
]

#figure(caption: "Unity Editor - Hierarchy")[
  #image("images/unity-editor/image-20250423203939608.png", width: 40%)
]

#pagebreak()

- AR Foundation@ar-foundation
  - Unity's framework for building AR applications
  - Works with both ARCore (Android) and ARKit (iOS)
  - Manages camera, tracking, and AR features

- C\# Programming Language@c-sharp
  - The main programming language used in Unity
  - Easy to learn and use
  - Good for game and app development

- Android/iOS Platform Support
  - ARCore@google-arcore-doc for Android devices
  - ARKit@ar-kit for iOS devices
  - Ensures AR works on both major mobile platforms

=== Key Features
- Cross-platform AR capabilities
  - Same code works on both Android and iOS
  - Consistent AR experience across devices
  - Easy to maintain and update

- Cloud anchor integration
  - Lets multiple users see AR content in the same place
  - Works with Google's ARCore
  - Makes shared AR experiences possible

- Spatial content management
  - Organizes AR objects in 3D space
  - Handles object placement and movement
  - Manages interactions between objects

- Real-time user interactions
  - Instant response to user actions
  - Smooth animations and transitions
  - Natural user experience

=== Development Tools
- Unity Editor
  - Visual tool for building AR scenes
  - Built-in debugging tools

- Visual Studio Code
  - Text editor

== Frontend Development

=== Core Technologies
- Nuxt.js 3@nuxt-js
  - A framework for building modern web applications
  - Makes Vue.js development easier
  - Handles routing and server-side rendering

#pagebreak()

- TypeScript@typescript
  - Adds type checking to JavaScript, better safety

- Tailwind CSS@tailwind-css
  - A utility-first CSS framework
  - Makes styling faster and easier
  - Responsive design made simple

- Vue 3 with Composition API@vue-js
  - Better code organization
  - More flexible

=== Key Features
- Server-side rendering (SSR)
  - Render in the server, then send to the client, better performance
  - Good for Search Engine Optimization (SEO)
  - Faster initial page load

- Responsive design
  - Works on all screen sizes
  - Mobile-friendly
  - Consistent experience

- View transitions
  - Smooth page transitions
  - Modern feel

=== Development Tools
- VSCode@vscode
  - Popular code editor
  - Great TypeScript support
  - Helpful extensions

- Chrome DevTools@chrome-devtools
  - Debug web applications
  - Check performance
  - Test responsive design

- ESLint@eslint
  - Finds code problems
  - Enforces coding style
  - Helps maintain code quality

- Prettier@prettier
  - Automatically formats code
  - Consistent code style
  - Saves time on formatting

== Backend Development

=== Core Technologies
- NestJS@nest-js
  - A framework for building server applications
  - Uses TypeScript
  - Quick and robust

- TypeScript
  - Type safety
  - Better code organization

- PostgreSQL@postgresql
  - Powerful database
  - Reliable and fast
  - Support spatial data (PostGIS@postgis)

- Redis@redis
  - Fast in-memory database

==== Cloud Services
- Cloudflare@cloudflare
  - Protects against attacks
  - Speeds up content delivery (Content Delivery Network, CDN)
  - Manages DNS

- AWS@aws
  - Stores media files
  - Provides PostgreSQL as a service

- Google Cloud@google-cloud
  - Provides geospatial services
  - Handles location data

- Hedera Hashgraph@hedera-hashgraph
  - Blockchain platform

=== Key Features
- RESTful API
  - Standard way to communicate

- WebSocket support
  - Real-time communication
  - Good for chat and notifications (actively send messages)

- Optimized database design
  - Fast queries
  - Better performance using indexed and cached data

=== Development Tools
- VSCode
- Postman@postman
  - Tests API endpoints
  - Good for debugging

- pgAdmin@pgadmin
  - Manages PostgreSQL database
  - Visual interface
  - Export database schema diagram

== Development Infrastructure

=== Version Control
- Git@git
  - Tracks code changes
  - Helps with collaboration
  - Keeps history of changes

- GitHub@github
  - Hosts Git repositories
  - Good for team work
  - Many helpful features

=== CI/CD Pipeline
- GitHub Actions
  - Automates testing and deployment
  - Runs on code changes on main branch

- Automated testing
  - Checks code quality

- Deployment automation
  - Deploys code automatically (frontend and backend)

- Environment management
  - Handles different environments (development, production)
  - Keeps settings organized

- Vercel@vercel
  - Deploys frontend
  - Good performance
  - Free plan

- Heroku@heroku
  - Deploys backend
  - Free with limited resources

=== Monitoring and Analytics
- Performance monitoring
  - Tracks app speed
  - Finds slow parts
  - Helps improve performance

- Error tracking
  - Finds and reports errors
  - Helps fix problems
  - Improves reliability

- Usage analytics
  - Shows how users use the app
  - Helps make improvements
  - Guides development

#pagebreak()

- Security auditing
  - Checks for security problems
  - Helps keep data safe
  - Important for user trust

=== Codegen

The project implements a code generation workflow to ensure type safety and consistency between the backend and frontend. This process involves several key components:

1. OpenAPI Documentation Generation
  - NestJS backend automatically generates OpenAPI (Swagger) documentation
  - API endpoints are documented with TypeScript decorators
  - Request/response schemas are automatically inferred
  - Documentation is available at `/api/docs` endpoint, a json file is generated for client code generation

2. Client Code Generation
  - OpenAPI specification is used to generate TypeScript client code, using \@hey-api/openapi-ts@hey-api-openapi-ts
  - Generated code includes:
    - Type-safe API client
    - Request/response interfaces
    - Validation schemas
    - Error handling types

3. Nuxt Integration
  - Generated client code is automatically injected into Nuxt
  - API client is available through Nuxt's global context (automatically injected)
  - TypeScript support for full type safety
  - Automatic error handling and response typing

This approach provides several benefits:
- Ensures API contract consistency
- Reduces manual coding errors
- Improves development efficiency
- Enables better IDE support (type safety)

#pagebreak()


= System Design

== Overall Architecture

=== Core Technologies
- Backend Framework: NestJS
- Database: PostgreSQL with PostGIS
- ORM: TypeORM@typeorm
- Authentication: JWT + Passport
- Blockchain: Hedera Hashgraph
- File Storage: AWS S3@s3

=== System Architecture
- Modular Design
- Dependency Injection
- Middleware Pipeline
- Security Architecture
- Deployment Architecture

== Module Breakdown

=== Core Modules
- AppModule: Application entry point
- AuthModule: Authentication and authorization
- UserModule: User management
- RoleModule: Role-based access control

=== Geographic Modules
- GeoObjectModule: Geographic object management, provides a base Create, Read, Update, Delete (CRUD) interface for all geographic objects
- GeoImageModule: Geographic image management, provides a extension function of GeoObjectModule for image objects
- CloudAnchorModule: AR cloud anchor management, including Cloud Anchor creation, expire time (ET/TTL) management, state tracking, etc.

=== Content Management
- SceneModule: Scene management, manages a group of GeoObjects as a scene
- StoryboardModule: Storyboard management
- LabelModule: Content labeling, provides the functionality to add labels to scenes or query scenes by labels

=== Consensus Modules
- ConsensusModule: Distributed consensus, provides the basic functionality of Hedera Hashgraph Blockchain manipulations
- ImageCopyrightModule: Copyright management, based on the consensus module, provides the functionality to create or query image copyright information

#pagebreak()

=== Utility Modules
- FileModule: File management, a adapter-pattern-designed module that provides a unified interface for file operations, currently supports local file system and AWS S3
- StatisticsModule: Analytics, provides the functionality to collect and analyze system data
- ZkModule: Zero-knowledge proofs, provides a interface of an external zero knowledge proof service

#figure(
  caption: [System architecture#footnote([#link("https://github.com/bkmashiro/fyp-report/blob/main/images/diagrams/modules.svg")])],
)[
  #image("images/diagrams/modules.png", width: 100%)
]

== Database Design

=== Database schema

#figure(caption: "Database schema")[
  #image("images/db/schema.png", width: 90%)
]

#pagebreak()

=== Core Tables

==== Cloud Anchor Table
```sql
CREATE TABLE IF NOT EXISTS public.cloud_anchor
(
    id serial NOT NULL,
    "cloudAnchorId" character varying COLLATE pg_catalog."default" NOT NULL,
    anchor geometry NOT NULL,
    altitude double precision NOT NULL DEFAULT '0'::double precision,
    CONSTRAINT "PK_d02bf38fbcf9b99243290c6705f" PRIMARY KEY (id)
);
```

==== Geo Object Table
```sql
CREATE TABLE IF NOT EXISTS public.geo_object
(
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp without time zone NOT NULL DEFAULT now(),
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    "position" geometry NOT NULL,
    orientation double precision[] NOT NULL DEFAULT '{0,0,0,1}'::double precision[],
    scale double precision[] NOT NULL DEFAULT '{1,1,1}'::double precision[],
    anchor geometry NOT NULL DEFAULT st_geomfromtext('POINT(0 0)'::text, 4326),
    metadata text COLLATE pg_catalog."default",
    "sceneId" uuid,
    text text COLLATE pg_catalog."default",
    type character varying COLLATE pg_catalog."default" NOT NULL,
    oss_file_id character varying COLLATE pg_catalog."default",
    altitude double precision NOT NULL DEFAULT '0'::double precision,
    anchor_latitude double precision NOT NULL DEFAULT '0'::double precision,
    "relPosition" geometry NOT NULL,
    "relAltitude" double precision NOT NULL DEFAULT '0'::double precision,
    "relOrientation" double precision[] NOT NULL DEFAULT '{0,0,0,1}'::double precision[],
    "cloudAnchorId" integer,
    CONSTRAINT "PK_8e888d4c5652cc76865762e44fb" PRIMARY KEY (id),
    CONSTRAINT "UQ_e1f3af9fe8ca8527f2cd3b04f78" UNIQUE (oss_file_id)
);
```

==== Scene Table
```sql
CREATE TABLE IF NOT EXISTS public.scene
(
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp without time zone NOT NULL DEFAULT now(),
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    "position" geometry NOT NULL,
    orientation double precision[] NOT NULL DEFAULT '{0,0,0,1}'::double precision[],
    scale double precision[] NOT NULL DEFAULT '{1,1,1}'::double precision[],
    altitude double precision NOT NULL DEFAULT '0'::double precision,
    "creatorId" integer,
    name character varying COLLATE pg_catalog."default" NOT NULL DEFAULT 'untitled'::character varying,
    description character varying COLLATE pg_catalog."default" NOT NULL DEFAULT 'No description provided'::character varying,
    CONSTRAINT "PK_680b182e0d3bd68553f944295f4" PRIMARY KEY (id)
);
```

==== User Table
```sql
CREATE TABLE IF NOT EXISTS public."user"
(
    id serial NOT NULL,
    username character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id)
);
```

==== Role Table
```sql
CREATE TABLE IF NOT EXISTS public.role
(
    id serial NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    "userId" integer,
    CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY (id)
);
```

==== Scene Managers User Table
```sql
CREATE TABLE IF NOT EXISTS public.scene_managers_user
(
    "sceneId" uuid NOT NULL,
    "userId" integer NOT NULL,
    CONSTRAINT "PK_4f7ad96966b4111e05841edf938" PRIMARY KEY ("sceneId", "userId")
);
```

==== Scene Labels Label Table
```sql
CREATE TABLE IF NOT EXISTS public.scene_labels_label
(
    "sceneId" uuid NOT NULL,
    "labelId" uuid NOT NULL,
    CONSTRAINT "PK_df95847ac1415d50fd81b90b568" PRIMARY KEY ("sceneId", "labelId")
);
```

==== Label Table
```sql
CREATE TABLE IF NOT EXISTS public.label
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default",
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT "PK_5692ac5348861d3776eb5843672" PRIMARY KEY (id),
    CONSTRAINT "UQ_972f95f212512a35e838562ea30" UNIQUE (name)
);
```

==== File Table
```sql
CREATE TABLE IF NOT EXISTS public.file
(
    key character varying COLLATE pg_catalog."default" NOT NULL,
    "originalName" character varying COLLATE pg_catalog."default" NOT NULL,
    size integer NOT NULL,
    "mimeType" character varying COLLATE pg_catalog."default" NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp without time zone NOT NULL DEFAULT now(),
    "deletedAt" timestamp without time zone,
    CONSTRAINT "PK_e4a453ce0a609a5f94c66afb6ca" PRIMARY KEY (key)
);
```

==== Image Copyright Table
```sql
CREATE TABLE IF NOT EXISTS public.image_copyright
(
    "createdAt" timestamp without time zone NOT NULL DEFAULT now(),
    "updatedAt" timestamp without time zone NOT NULL DEFAULT now(),
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    "userId" character varying COLLATE pg_catalog."default" NOT NULL,
    status image_copyright_status_enum NOT NULL DEFAULT 'pending'::image_copyright_status_enum,
    "transactionHash" character varying COLLATE pg_catalog."default",
    "blockchainInfo" json,
    "geoImageId" uuid,
    "imageHash" bit(64) NOT NULL,
    message character varying COLLATE pg_catalog."default",
    "messagePrefix" character varying(8) COLLATE pg_catalog."default",
    CONSTRAINT "PK_d10f2e5d0f87bad5df843dee258" PRIMARY KEY (id)
);
```

=== Foreign Key Constraints

```sql
ALTER TABLE IF EXISTS public.geo_object
    ADD CONSTRAINT "FK_0543e1e184417cc6845d1a4c8fe" FOREIGN KEY ("cloudAnchorId")
    REFERENCES public.cloud_anchor (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public.geo_object
    ADD CONSTRAINT "FK_3fbb7d2d54ddf4167f623c5b428" FOREIGN KEY ("sceneId")
    REFERENCES public.scene (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public.geo_object
    ADD CONSTRAINT "FK_e1f3af9fe8ca8527f2cd3b04f78" FOREIGN KEY (oss_file_id)
    REFERENCES public.file (key) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public.scene
    ADD CONSTRAINT "FK_6f050bf6fb5415311d0c7e888cb" FOREIGN KEY ("creatorId")
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public.role
    ADD CONSTRAINT "FK_3e02d32dd4707c91433de0390ea" FOREIGN KEY ("userId")
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public.scene_managers_user
    ADD CONSTRAINT "FK_325064f9bfbbbedaa975cb054ba" FOREIGN KEY ("sceneId")
    REFERENCES public.scene (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE IF EXISTS public.scene_managers_user
    ADD CONSTRAINT "FK_4da77eb5c0f9a6c7f78cd73191f" FOREIGN KEY ("userId")
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE IF EXISTS public.scene_labels_label
    ADD CONSTRAINT "FK_18597e747df9f6b6ef788e335fa" FOREIGN KEY ("labelId")
    REFERENCES public.label (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE IF EXISTS public.scene_labels_label
    ADD CONSTRAINT "FK_b78bf773912eb343d75fbed6c0e" FOREIGN KEY ("sceneId")
    REFERENCES public.scene (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE;

ALTER TABLE IF EXISTS public.image_copyright
    ADD CONSTRAINT "FK_90d5d6b183e25fed552dbab4c2e" FOREIGN KEY ("geoImageId")
    REFERENCES public.geo_object (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
```

=== Indexes

```sql
CREATE INDEX IF NOT EXISTS "UQ_e1f3af9fe8ca8527f2cd3b04f78"
    ON public.geo_object(oss_file_id);

CREATE INDEX IF NOT EXISTS "IDX_325064f9bfbbbedaa975cb054b"
    ON public.scene_managers_user("sceneId");

CREATE INDEX IF NOT EXISTS "IDX_4da77eb5c0f9a6c7f78cd73191"
    ON public.scene_managers_user("userId");

CREATE INDEX IF NOT EXISTS "IDX_18597e747df9f6b6ef788e335f"
    ON public.scene_labels_label("labelId");

CREATE INDEX IF NOT EXISTS "IDX_b78bf773912eb343d75fbed6c0"
    ON public.scene_labels_label("sceneId");
```

#pagebreak()

=== Database Features
- PostGIS for geospatial data
- Spatial indexing
- Data integrity constraints
- Performance optimization
- Regular maintenance

==== Spatial Data Types
- Point (geometry, SRID: 4326)
- LineString (geometry, SRID: 4326)
- Polygon (geometry, SRID: 4326)
- MultiPoint (geometry, SRID: 4326)
- MultiLineString (geometry, SRID: 4326)
- MultiPolygon (geometry, SRID: 4326)

==== Spatial Query

PostgreSQL with PostGIS provides several powerful functions for spatial queries, particularly for point-based searches. Here are some commonly used functions with examples:

=== Point-in-Rectangle Search

The `ST_Contains` function checks if a geometry is completely contained within another geometry. For rectangular searches:

```sql
-- Find all points within a rectangular area
SELECT *
FROM geo_object
WHERE ST_Contains(
    ST_MakeEnvelope(
        min_lon, min_lat,  -- bottom-left corner
        max_lon, max_lat,  -- top-right corner
        4326               -- SRID for WGS84
    ),
    position
);
```

=== Radius Search

The `ST_DWithin` function finds all geometries within a specified distance of another geometry:

```sql
-- Find all points within 1000 meters of a given point
SELECT *
FROM geo_object
WHERE ST_DWithin(
    position::geography,  -- Cast to geography for meter-based distance
    ST_SetSRID(ST_MakePoint(lon, lat), 4326)::geography,
    1000  -- Distance in meters
);
```

=== K-Nearest Neighbors

The `ST_Distance` function combined with `ORDER BY` and `LIMIT` can find the k-nearest points:

```sql
-- Find 10 nearest points to a given location
SELECT *
FROM geo_object
ORDER BY ST_Distance(
    position::geography,
    ST_SetSRID(ST_MakePoint(lon, lat), 4326)::geography
)
LIMIT 10;
```

=== Spatial Indexing

For better performance, spatial indexes should be created:

```sql
-- Create a spatial index on the position column
CREATE INDEX idx_geo_object_position ON geo_object USING GIST (position);

-- Create a spatial index on the anchor column
CREATE INDEX idx_geo_object_anchor ON geo_object USING GIST (anchor);
```

These spatial queries are essential for location-based features in the application, such as finding nearby AR content or filtering scenes by geographic area.

== Key Technologies and Implementation
== AR Object <ar-object>

AR Object is a 3D object that can be placed in the real world. It can be a photo, a video, a 3D model, or a interactive object, etc.

In the system database design, AR Object table is a STI (Single Table Inheritance) table, which means it has only one column for the object type, and the rest of the columns are inherited from the superclass.

The following shows the base schema of the AR Object table:

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  [*Field*], [*Type*], [*Description*],
  [id], [uuid], [Object identifier],
  [type], [varchar], [Object type identifier],
  [anchor], [Point (geometry, SRID: 4326)], [Geographic anchor position],
  [anchor_latitude], [float (default: 0)], [Anchor latitude],
  [metadata], [text (nullable)], [Metadata information],
  [cloudAnchor], [CloudAnchor (many-to-one)], [Cloud anchor association],
  [relPosition], [Point (geometry, SRID: 4326)], [Relative position],
  [relAltitude], [float (default: 0)], [Relative altitude],
  [relOrientation], [float[] (default: [0, 0, 0, 1])], [Relative orientation],
  [createdAt], [Date (auto-generated)], [Creation time],
  [updatedAt], [Date (auto-updated)], [Update time],
  [scene], [Scene (many-to-one)], [Scene association],
)

This is the inheritance schema of the subclass `SpatialImage` table:

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  [*Field*], [*Type*], [*Description*],
  [type], [constant("SpatialImage")], [Object type identifier],
  [ossFile], [File (one-to-one)], [OSS file],
)

This is the inheritance schema of the subclass `SpatialComment` table:

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  [*Field*], [*Type*], [*Description*],
  [type], [constant("SpatialComment")], [Object type identifier],
  [content], [text], [Comment content],
)

`spatial_image` and `spatial_comment` are the only two subclasses of `spatial_object`, they're being stored in the `spatial_object` table, and the `type` field is used to identify the object type. This is used to simplify the database design of derived classes. #footnote("Note that when type number is large, a STI is not a best practice.")

== Cloud Anchor <cloud-anchor>

In AR, an anchor is a fixed point in space used to keep virtual objects in a consistent location in the real world. A Cloud Anchor is an anchor that is hosted in the cloud, making it accessible across devices.

A Google Cloud Anchor is a feature provided by ARCore, Google's platform for building AR experiences. Cloud Anchors allow AR content to be shared across devices by enabling users to place and anchor virtual objects in the same real-world location, even on different devices or at different times. @google-cloud-anchor

A Cloud Anchor captures *local environmental features* (such as depth and color information) to mark an absolute position in space. Unlike GPS-based positioning, it does not rely on latitude and longitude coordinates. Instead, it uses the unique visual characteristics of the surrounding environment to establish precise spatial references. This approach enables *highly accurate positioning* with an error margin of less than 10 centimeters.

The process works by:
+ *Scanning* the immediate environment to extract distinctive visual features
+ Creating *a unique fingerprint* of the local space using these features
+ *Storing* this fingerprint in the cloud along with the anchor's position
+ Allowing other devices to *match* these features to locate the same position

#figure(caption: "A device hosting an anchor")[
  #image("images/diagrams/cloudanchor-seq.svg", width: 100%)
]


This feature-based approach offers several advantages:
- Works in GPS-denied environments (indoors, urban canyons)
- Provides sub-meter accuracy
- Enables persistent AR experiences across multiple sessions
- Supports multi-user experiences in the same physical space

#figure(caption: "A device hosting an anchor")[
  #image("images/impl/cloud-anchor-part-1.png", width: 70%)
]

#figure(caption: "Another device locating the same anchor")[
  #image("images/impl/cloud-anchor-part-2.png", width: 70%)
]

== Positioning

The system's prior positioning method is *relative positioning*, which is a more accurate and reliable approach for indoor AR applications, when it's unavailable, the system will fall back to absolute positioning using Global Positioning System (GPS).

=== Scene Graph

In the application, virtual objects are organized in a *hierarchical structure* known as a *scene graph*. This tree-like organization provides several key benefits:

+ *Hierarchical Organization*
  - Each object maintains its position relative to its parent
  - Objects can be grouped together by making them children of a common parent
  - When a parent moves, all its children maintain their relative positions
  - Moving a group only cause one edit to the root element of the group

+ *Root Anchor Requirement*
  - The root of the scene graph must be an Anchor
  - This establishes the connection between virtual content and the real world
  - It's children objects are positioned relative to this root anchor

+ *Grouping Benefits*
  - Related objects can be moved together as a unit
  - Complex arrangements can be created and manipulated easily
  - Hierarchical organization simplifies scene management

#pagebreak()

=== Relative Positioning

Relative positioning is the preferred approach in this project for several key reasons:

1. *Precision in Indoor Environments*
  - Achieves decimeter-level accuracy indoors
  - Significantly outperforms GPS-based positioning which can have errors of tens of meters
  - Particularly important for AR applications requiring precise spatial alignment

2. *Enhanced Sharing Capabilities*
  - As discussed in the Cloud Anchor section, enables seamless sharing of AR experiences
  - Multiple users can interact with the same virtual content in the same physical space
  - Maintains spatial consistency across different devices and sessions

3. *Coordinate System Design*
  - Uses Cloud Anchor as the origin point (0,0,0) of the coordinate system
  - Establishes a local reference frame that's independent of global coordinates
  - Enables precise relative measurements between virtual objects

4. *Implementation Benefits*
  - Reduces dependency on external positioning systems
  - Provides more stable and reliable positioning in indoor environments
  - Supports complex multi-user interactions with minimal latency

This approach aligns perfectly with the project's requirements for high-precision indoor AR experiences and collaborative features.

In 3D computer graphics, a rotation and position of an object is represented by a $4 times 4$ matrix:
$
  mat(
    bold(R), bold(t);
    bold(0)^T, bold(1)
  )
$
where $bold(R)$ is a $3 times 3$ rotation matrix, $bold(t)$ is a $3 times 1$ translation vector, and $bold(0)^T$ is a $1 times 3$ zero vector.

We want a relative transform:
$
  bold(T)_text("relative")
  = bold(T)_text("origin")^(-1) dot bold(T)_text("target")
  = mat(
    bold(R)_text("origin")^T, -bold(R)_text("origin")^T dot bold(t)_text("origin");
    bold(0)^T, bold(1);
  )
  dot bold(T)_text("target")
$

That is:
$
  bold(text("Position"))_text("relative")
  = bold(R)_text("origin")^T dot (bold(t)_text("target") - bold(t)_text("origin"))
$
$
  bold(text("Rotation"))_text("relative")
  = bold(R)_text("origin")^T dot bold(R)_text("target")
$

C\# code to convert a target transform to a local transform relative to an origin transform:

```cs
public (Vector3, Quaternion) ConvertToLocalTransform(Transform target, Transform origin)
  {
    var localPos = Quaternion.Inverse(origin.rotation) * (target.position - origin.position);
    var localRot = Quaternion.Inverse(origin.rotation) * target.rotation;

    return (localPos, localRot);
  }
```

=== Absolute Positioning Fallback

While the relative positioning system provides excellent indoor performance, we also implement an absolute positioning fallback using GPS coordinates. This system uses latitude, longitude, and altitude to determine an object's position in the real world.

However, GPS-based positioning has several limitations:

- Varying accuracy across different devices (typically 4.9 meters@gps-gov)
- Signal interference from buildings, trees, and other obstacles
- Multi-path effects in indoor environments causing signal reflections @multipath-propagation
- Atmospheric conditions affecting signal propagation
- Limited vertical accuracy for altitude measurements

These factors make GPS positioning *less reliable* for precise indoor AR applications, especially in urban environments or buildings with dense structures. The system always tries to use relative positioning first, and then falls back to absolute positioning if the relative positioning is not available. If both are not available, the system will use inertial navigation system, all features are unavailable at this point.

== Scene Management

A *Scene* is a collection of AR objects (@ar-object), which provides access control and scene management.

When a user loads a scene, the system will retrieve all the cloud anchors that related to the scene, and ask the user to scan the environment to find at least one anchor. Once the anchor is found, the system will use the anchor to position the AR objects.

== Invisible Watermarking <invisible-watermarking>
_This feature has a demo at #link("https://github.com/bkmashiro/watermark")_

The invisible watermarking system implements a robust digital watermarking algorithm that embeds information into images *without visible artifacts* (i.e. the watermark is almost invisible to human eyes). The process consists of two main phases: *embedding* and *extraction*.

=== Embedding Process

The embedding process takes an input image and watermark information (which can be an image, string, or bitstream#footnote("Eventually they are processed as bitstream")) and follows these steps:

1. Color Space Conversion
  - Convert RGB to YUV color space
  - Only modify the Y (luminance) channel as human eyes are more sensitive to brightness changes

2. Multi-resolution Analysis
  - Apply Discrete Wavelet Transform (DWT)#footnote("DWT decomposes an image into different frequency bands, providing multi-resolution analysis") to each channel
  - Extract low-frequency (ca) and high-frequency (hvd) components
  - Focus on low-frequency components for better stability against common image processing operations

  #figure(caption: "DWT decomposition")[
    #image("images/impl/dwt.png", width: 70%)
  ]

3. Block-based Processing
  - Divide the low-frequency component (LL) into 4×4 pixel blocks
  - Apply Discrete Cosine Transform (DCT)#footnote("DCT transforms a image from spatial domain to frequency domain, which focus the energy in the top-left corner, if we modify the coefficients in frequencies that not sensitive to human eyes, the image quality is not affected") to each block
  - Most image information concentrates in the top-left corner

4. Security and Embedding
  - Generate pseudo-random sequence using password_img
  - Shuffle DCT blocks using the sequence for security
  - Apply Singular Value Decomposition (SVD)#footnote("SVD decomposes a matrix into three matrices(U, Sigma, V), which is a powerful tool for image processing, the Sigma matrix is a diagonal matrix, that is very robust to noise and modify Sigma affects little to the image quality") to each block
  - Modify singular values (s[0], s[1]) to embed 1-bit information

5. Reconstruction
  - Apply inverse SVD
  - Apply inverse DCT
  - Merge blocks
  - Apply inverse DWT
  - Convert back to RGB color space


#figure(caption: "Embedding process")[
  #image("images/diagrams/watermarking.svg", width: 100%)
]


#figure(caption: [Embedding has no visible effect (hidden information: `ilovecat`)])[
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    stack(
      image("images/p-hash/cat.jpg", width: 100%),
      "",
      align(center)[Original],
    ),
    stack(
      image("images/p-hash/cat_embed.png", width: 100%),
      "",
      align(center)[Embedded],
    ),
    stack(
      image("images/p-hash/residual.png", width: 100%),
      "",
      align(center)[Residual],
    ),
  )
]

#pagebreak()

=== Extraction Process

The extraction process can recover the watermark without requiring the original image:

1. Preprocessing
  - Apply DWT and DCT to the input image
  - Use the same password_img to generate the shuffling sequence

2. Information Recovery
  - Apply SVD to each block
  - Extract singular values s[0] and s[1]
  - Decode the embedded bit (0 or 1)

3. Optional Enhancement
  - If extract_with_kmeans is enabled, use 1D k-means clustering to automatically determine the extraction threshold

4. Final Output
  - Reconstruct the bitstream
  - Convert to image or string format

=== Technical Considerations

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  [*Technique*], [*Purpose*], [*Reason*],
  [DWT],
  [Multi-resolution analysis],
  [High-frequency components are unstable; embedding in low-frequency provides better stability],

  [DCT],
  [Energy concentration],
  [Most image information is in the top-left corner; modifying coefficients minimally affects quality],

  [SVD], [Stability], [Singular values are stable; modifications don't cause significant block distortion],
  [Shuffling], [Security], [Prevents direct analysis of embedding regions],
)


== Blockchain-based Copyright Protection <blockchain-based-copyright-protection>

=== On-chain Evidence <on-chain-evidence>

The blockchain-based copyright protection system combines perceptual hashing with author identity to create a tamper-proof record of image ownership. Here's how it works:

#figure(caption: "Blockchain-based copyright protection process")[
  #image("images/diagrams/blockchain-copyright-v1.svg", width: 100%)
]

1. Image Fingerprinting
  - Generate perceptual hash of the image
  - Concatenate with author's public key
  - Hash the combined data to create a unique *identifier*

2. Blockchain Storage
  - Store the hash on the blockchain
  - Include timestamp and metadata
  - Create immutable ownership record

3. Verification (challenge) Process
  - Anyone can verify image ownership
  - Challenge the system with the combination of image hash and author's public key
  - The system will verify the ownership record on the blockchain and tell `true` or `false`

The system provides several key benefits:

#pagebreak()

+ Privacy Protection
  - Original image not stored on chain
  - Cannot directly infer the author's identity from the blockchain records
  - Only hash values are public

+ Tamper Resistance
  - Immutable ownership records
  - Timestamp verification
  - Cryptographic proof of authenticity

+ Efficient Verification
  - Cached quick ownership checks

+ Decentralized Storage
  - Ownership records stored on blockchain
  - Independent of backend infrastructure
  - Permanent and immutable records
  - Trustless verification possible

This approach ensures that while the ownership information is publicly verifiable, the actual content and author details remain private until explicitly shared.

=== Embedded Identifier Extraction Enhancement

If the image is *embedded* with the *identifier* (mentioned in @on-chain-evidence, Image Fingerprinting, step 3)#footnote([Due to space and query efficiency consideration, only the first 64 bits of the identifier are embedded.]), the system will extract the identifier from the image.

Mentioned in the @invisible-watermarking section#footnote([This is combining the @invisible-watermarking and the primitive way of @blockchain-based-copyright-protection.]), the embedding identifier can be extracted from the image, even if the image is edited slightly (including compression, rotation, cropping, etc.).

Then the system will query the blockchain to find and verify the ownership record of the image.

== Image Similarity Search <image-similarity-search>
=== Perceptual Hashing

Perceptual hashing is a technique that hashes an image into a fixed-length fingerprint. It is a type of hash function that is designed to be robust to common image processing operations, such as compression, rotation, and scaling. @p-hash

Image perceptual hashing has been proposed to identify or authenticate image contents in a robust way against distortions caused by compression, noise, common signal processing and geometrical modifications, while still holding a good discriminability for different ones in sense of human perception. A method called "Block Mean Value Based Image Perceptual Hashing" is used to generate the hash value. @block-mean-value-based-image-perceptual-hashing

#figure(caption: "Similar images have similar perceptual hash values")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    stack(
      image("images/p-hash/cat.jpg", width: 100%),
      "",
      align(center)[p-hash: 070f0f0d1f05#text(blue, "ce06")],
    ),
    stack(
      image("images/p-hash/cat_embed_edit.png", width: 100%),
      "",
      align(center)[p-hash: 070f0f0d1f05#text(red, "8c8e")#footnote("Fun fact:The hidden information can still be extracted if the image is edited")],
    ),
  )
]

=== Image Similarity Search
A 64-bit hash value is generated for each image, which is used to represent the image.

For two images, the Hamming distance between their hash values is calculated. The smaller the Hamming distance, the more similar the two images are.

$
  text("Hamming distance") = sum(
    bold(x)_i xor bold(y)_i
  )
$

Here is the PostgreSQL query to calculate the Hamming distance of a given image hash with all the images in the database:

```postgresql
SELECT
  *,
  (1 - (bit_count(imageCopyright.imageHash # B'${bitHash}')::float / 64)) as similarity
FROM
  image_copyright imageCopyright
WHERE
  bit_count(imageCopyright.imageHash # B'${bitHash}') <= :maxDistance
```

A 84% threshold is used to determine if two images are similar.
A 92% threshold is used to determine if a photo is a duplicate#footnote("There are small differences between same-sourced photos due to compression and other factors, so a 8% tolerance is applied").

== Blockchain-based Zero-Knowledge Proof for Photo Ownership <zkp>

#warning[
  The following sections require advanced knowledge in:
  - Mathematics (Finite Fields, Elliptic Curves)
  - Cryptography (Zero-Knowledge Proofs, Hash Functions)
  - Blockchain (Hedera)
  - Circuit Design (R1CS, Groth16)
]

=== Introduction to Zero-Knowledge Proofs

Zero-knowledge proofs (ZKPs)#footnote([A analogy story is shown in @magic-cave to illustrate the concept of ZKPs]) are cryptographic protocols that allow one party (the prover) to prove to another party (the verifier) that a statement is true without revealing any additional information#footnote([That is to say, in the scenario of photo ownership, the prover can prove to the verifier that they own a photo, *without revealing the photo content or the owner's identity*, but in the system, it's simplified, that the owner's address is revealed (actively informed to the verifier). In theory this can be improved using randomized `artistId`]). In the mean time, the verifier, even after having become convinced of the statement's truth, should nonetheless remain unable to prove the statement to further third parties.

For example:
- Traditional way: To prove you own a photo, you need to show the photo
  - Or using RSA for example, the photo is signed with the owner's private key, so the verifier can verify the ownership by using the owner's public key. But here the photo is revealed, and the owner's identity is exposed.
- Zero-knowledge way: You only need to provide a proof that verifies your ownership, without revealing the photo content and the owner's identity. The verifier is convinced, but cannot prove the statement to further third parties.

Summary:
- Prover does not reveal any information
- Verifier is convinced of the statement's truth
- Verifier cannot prove the statement to further third parties

=== Mathematical Foundations

==== Finite Fields and Elliptic Curves
- Using BN128 elliptic curve: $E: y^2 = x^3 + 3$
- Defined over finite field $F_p$, where $p$ is a large prime
- Points on the curve form a cyclic group $G$

==== Poseidon Hash Function
- Hash function based on permutation networks
- Input: two elements $(x, y) in F_p^2$
- Output: one element $h in F_p$
- Mathematical representation: $h = "Poseidon"(x, y)$

#pagebreak()

==== Groth16 Proof System
- Zero-knowledge proof system based on R1CS (Rank-1 Constraint System)
- Prover knows witness $w$ satisfying $A w times B w = C w$
- Where $A$, $B$, $C$ are constraint matrices, $times$ denotes element-wise multiplication

=== Circuit Design
==== Ownership Proof Circuit

Circom is a language to compile circuits, which is a group of addition and multiplication gates.@circom

```circom
template Ownership() {
    signal input sigHash;      // Signature hash
    signal input artHash;      // Artwork hash
    signal output commitment;  // Commitment value

    component hash = Poseidon(2);
    hash.inputs[0] <== sigHash;
    hash.inputs[1] <== artHash;

    commitment <== hash.out;
}
```

==== Circuit Constraints
- Input constraints: $"sigHash"$, $"artHash" in F_p$
- Output constraints: $"commitment" = "Poseidon"("sigHash", "artHash")$
- Witness#footnote([The witness is a set of values that satisfies the circuit constraints. Only when a proper witness is provided, a proof can be generated]): private inputs, internal variables

==== Comparison with RSA

The zero-knowledge proof system and RSA (Rivest-Shamir-Adleman) are both cryptographic systems, but they serve different purposes and have distinct characteristics:

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  [*Aspect*], [*Zero-Knowledge Proof*], [*RSA*],
  [Purpose], [Prove knowledge without revealing it], [Encryption and digital signatures],
  [Key Components], [Prover, Verifier, Witness], [Public key, Private key],
  [Security Basis], [Computational complexity of mathematical problems], [Integer factorization problem],
  [Privacy Level], [Complete privacy (zero-knowledge)], [Partial privacy (reveals some information)],
  [Verification Process], [Interactive or non-interactive proof verification], [Direct signature verification],
  [Use Case], [Proving ownership without revealing content], [Encrypting messages and signing documents],
)

Key differences in implementation:

+ *Privacy Level*
  - ZKP: Proves knowledge without revealing any information
  - RSA: Reveals some information during verification

+ *Verification Process*
  - ZKP: Requires complex proof generation and verification
  - RSA: Simple signature verification process

+ *Use Cases*
  - ZKP: Ideal for privacy-preserving verification
  - RSA: Better suited for traditional encryption and signing

+ *Implementation Complexity*
  - ZKP: Requires specialized circuit design
  - RSA: Standardized implementation available

==== Note

In the context of "Copyright Protection", it makes little sense to use ZKP to prove only the ownership of the artwork, without revealing the artwork content / owner's identity.

The idea here is to reveal little information (user's indenty hash or artwork signature) to the verifier, while ZK protects the full artwork content from being revealed.

===== Comparison with hash Only

Current Web3 platforms typically use direct hashing: storing artwork hash on-chain. This approach has privacy risks:
- Hash collisions (theoretical)
- Brute force attacks on small files
- Reverse matching for popular content

ZK-enhanced registration improves privacy by:
- Storing only hash and ZK proof on-chain
- Proving knowledge without revealing content
- Preventing content speculation
- Blocking reverse matching attempts
- Securing small/popular works

In short:

- Hash only: the third party cannot know the content, temporarily
- ZK-enhanced: without actively revealing the content, the third party cannot know anything about the content

=== System Architecture

// ==== Core Components
// - `ZkService`: Core zero-knowledge proof service
//   - Generates and verifies artwork ownership proofs
//   - Manages key pair generation and storage
//   - Handles file hash computation

// - `HederaService`: Blockchain service based on Hedera
//   - Stores proofs and metadata on-chain
//   - Provides on-chain data query functionality
//   - Supports multiple topic types (artwork, messages, etc.)

==== Data Flow

1. Artwork Registration Process:
  - User uploads artwork file
  - System computes artwork hash (Keccak256)
  - Generates user key pair
  - Signs artwork hash with private key
  - Generates zero-knowledge proof
  - Stores proof and metadata on-chain

2. Ownership Verification Process:
  - User provides artwork hash and claimed owner address
  - System queries related records from chain
  - Verifies zero-knowledge proof
  - Checks address match
  - Returns verification result

=== Security Analysis

==== Zero-Knowledge Property
- Proof $\pi$ does not reveal $"sigHash"$ and $"artHash"$
- Verifier only knows commitment value $"commitment"$
- Original data cannot be recovered from proof

==== Completeness
- Only correct $"sigHash"$ and $"artHash"$ can generate valid proof
- Forging proof is computationally infeasible
- Commitment value $"commitment"$ is bound to specific input pair

==== Practicality
- Fixed proof size, independent of input size
- Constant verification time, suitable for blockchain environment
- Can prove artwork ownership without revealing content

=== Implementation Details

==== Key Management
- Generate-and-dispose by the backend system, only the user will process the private and public keys
- User can generate key pairs on device, no need to transfer keys to the backend, which is more secure

==== On-chain Storage
- Only proofs and hash values stored
- No original artwork data stored

=== Performance Optimization

==== Proof Generation
- Using Groth16 proof system for faster generation
- Fixed proof size suitable for on-chain storage
- Support for batch verification

==== On-chain Queries
- Query performance optimized with indexes
- Support for time-range queries
- Caching of common query results

#pagebreak()

== Web Management Interface
=== Frontend Architecture
- Built with Nuxt.js 3 for optimal performance
- Server-side rendering (SSR) for fast initial load
- Automatic code splitting and lazy loading
- Progressive enhancement support

=== UI/UX Design
- Tailwind CSS for responsive design
- Animations between pages
- Mobile-first approach

=== Performance Optimization
- Image optimization with Nuxt Image
- Route-based code splitting
- Component lazy loading
- Caching strategies
- Bundle size optimization

=== State Management
- Pinia for state management
- Persistent storage (user sensitive data, e.g. private keys)
- Real-time updates
- Error handling

=== Development Tools
- TypeScript support
- ESLint configuration
- Prettier formatting

// == Data Flow Management
== Authentication System
=== JWT Authentication

==== Token Structure
- Header: Algorithm and token type
- Payload: User data
- Signature: HMAC SHA256 verification

==== Security Features
- Token expiration (exp)
- Issuer verification (iss)
- Audience validation (aud)
- Subject identification (sub)

==== Implementation
- Backend generates JWT upon successful login
- Frontend stores token in local storage
- Token included in Authorization header
- Automatic token refresh mechanism

==== Token Revocation
- Implement Redis-based token blacklist
- Store revoked tokens with expiration time
- Check blacklist during token validation
- Automatic cleanup of expired blacklist entries

==== Redis Implementation
- Use Redis SET data structure for blacklist
- Key format: "blacklist:token"
- Value: timestamp of revocation
- TTL set to match token expiration

==== Security Considerations
- Prevent reuse of revoked tokens
- Maintain blacklist size through TTL

=== Access Control with Nest-Access-Control

==== Resource-based Access Control and Attribute-based Access Control

The system implements a hybrid access control model combining Role-Based Access Control (RBAC) and Attribute-Based Access Control (ABAC) to manage user permissions and resource access. This model consists of four key components:

+ Role Definition
  - Predefined roles with hierarchical inheritance
  - Each role has specific permissions
  - Roles can be assigned to users

+ Permission Management
  - Fine-grained permission definitions
  - Resource-based access control
  - Action-based permission checks

+ Access Control Implementation
  - Decorator-based permission guards
  - Controller-level access control
  - Resource ownership validation

+ Dynamic Access Control
  - Context-aware permission checks
  - Runtime permission evaluation
  - Custom permission logic support

==== Permission Definition

The system defines permissions through a structured approach:

+ Permission Enums
  - Create permission enums for different actions
  - Define resource-specific permissions
  - Map permissions to roles

+ Resource Actions (`nest-access-control`@nest-access-control)
  - Read: View resource content
  - Create: Add new resources
  - Update: Modify existing resources
  - Delete: Remove resources

+ Permission Guards
  - Implement permission validation
  - Check role-based access
  - Handle unauthorized access

==== Resource Protection

Resources are protected through multiple layers:

+ Guard Implementation
  - Use `@UseGuards` decorator
  - Apply permission checks
  - Validate resource ownership

+ Access Control
  - Controller-level protection
  - Method-level restrictions
  - Resource-specific rules

+ Error Handling
  - Unauthorized access responses
  - Permission denied messages
  - Access violation logging

==== Dynamic Access Control

The system supports dynamic access control through:

+ Context-based Permissions
  - User context evaluation
  - Resource context consideration
  - Environment-based rules

+ Runtime Permission Checks
  - Dynamic permission evaluation
  - Conditional access rules
  - Custom permission logic

+ Access Control Extensions
  - Custom permission handlers
  - Extended validation rules
  - Flexible permission models

#pagebreak()

== Special Features
=== Interpage Animations
The system implements smooth page transitions using the View Transitions API@view-transitions-api, a new web standard that enables seamless animations between page states.

+ Implementation
  ```css
  /* Enable view transitions */
  @view-transition {
    navigation: auto;
  }

  /* Define transition styles */
  .page-transition {
    view-transition-name: page;
  }

  /* Customize animation */
  ::view-transition-old(page) {
    animation: fade-out 0.3s ease-out;
  }

  ::view-transition-new(page) {
    animation: fade-in 0.3s ease-in;
  }

  @keyframes fade-in {
    from { opacity: 0; }
    to { opacity: 1; }
  }

  @keyframes fade-out {
    from { opacity: 1; }
    to { opacity: 0; }
  }
  ```

+ Benefits
  - Improved user experience
  - Consistent animations

#pagebreak()

= Unimplemented or Future Features
== Scripting

The system was planned to support Lua scripting for dynamic behavior adjustment in Unity, but this feature was not implemented due to the following reasons:

+ Implementation Complexity
  - Runtime behavior modification

+ Development Effort
  - Security considerations
  - Performance optimization

+ Alternative Solutions
  - Predefined behavior patterns
  - Configuration-based adjustments

This feature remains as a potential future enhancement for more flexible behavior customization.

== Offline Mode

The offline mode feature was initially considered but ultimately not implemented due to the following reasons:

+ High Implementation Cost
  - Complex synchronization logic
  - Local data storage management
  - Conflict resolution mechanisms

+ Limited Business Value
  - Most operations require real-time data
  - Network availability is generally good
  - Minimal user demand for offline functionality

+ Technical Challenges
  - Data consistency maintenance

Given these factors, the development team decided to focus resources on core features that provide more immediate value to users.

#pagebreak()

= Development Process
== Methodology

The project adopted an Agile development methodology, specifically Scrum, to ensure efficient and flexible development. The team followed a structured approach with two-week sprint cycles, allowing for regular feedback and adaptation. Daily stand-up meetings were conducted to track progress and address any blockers, while sprint reviews and retrospectives provided opportunities for continuous improvement.

Development practices were centered around quality and collaboration. The team implemented test-driven development (TDD) to ensure code reliability, while continuous integration helped maintain a stable codebase. Code reviews were mandatory for all pull requests, and complex features often involved pair programming sessions to share knowledge and improve code quality.

Project management was streamlined using modern tools. GitHub Projects served as the primary task tracking system, while Jira was used for more detailed issue management. Regular stakeholder meetings ensured alignment with project goals, and comprehensive progress tracking helped maintain transparency throughout the development process.

== Version Control

The project's version control strategy was built around Git and GitHub, providing a robust foundation for collaborative development. The branching strategy followed a modified Git Flow approach, with main and develop branches serving as the primary integration points. Feature branches were created for new development work, while release branches helped manage versioning and deployment cycles.

The development workflow emphasized quality and collaboration. Every code change required a pull request review, ensuring that multiple team members reviewed and approved changes. Automated testing and code quality checks were integrated into the workflow, while documentation updates were treated as an integral part of the development process.

#pagebreak()

= Deployment
== Mobile Application Deployment

The mobile application deployment process was streamlined using Unity's comprehensive build system. Unity Cloud Build was utilized to automate the build process, generating platform-specific builds for both iOS#footnote("the iOS app is not available in AppStore due to Apple's policy") and Android. This automation significantly reduced the time required for deployment while ensuring consistent build quality.

== Web Deployment

The web application was deployed on Vercel, taking advantage of its modern deployment infrastructure. The platform's seamless GitHub integration enabled automatic deployments, with preview deployments for pull requests allowing for easy testing of new features. The edge network optimization provided by Vercel ensured fast content delivery worldwide.

Performance optimization was a key focus of the web deployment strategy. Automatic HTTPS implementation and global CDN distribution helped maintain security and speed. Serverless functions were utilized for dynamic content, while integrated analytics provided valuable insights into user behavior and application performance.

#figure(caption: "Web application deployment using Vercel")[
  #image("images/cicd/vercel.png", width: 100%)
]

== Backend Deployment

The backend infrastructure was built on Heroku with AWS integration, creating a robust and scalable deployment environment. Heroku dynos provided the application hosting platform, while AWS RDS PostgreSQL handled database operations. Redis was implemented for caching, and AWS S3 was used for file storage, creating a comprehensive cloud infrastructure.

The deployment pipeline was automated using GitHub Actions, ensuring consistent and reliable deployments. Automated testing was integrated into the pipeline, while database migrations were handled through a systematic approach. Environment configuration was managed through secure environment variables, maintaining separation between development and production environments.

Monitoring and observability were critical components of the backend deployment strategy. Application performance monitoring tools provided real-time insights into system health, while error tracking systems helped identify and resolve issues quickly. Log aggregation and resource utilization metrics enabled proactive system management and capacity planning.

#figure(caption: "Backend deployment using Heroku")[
  #image("images/cicd/heroku.png", width: 100%)
]

== Database

The database was deployed on AWS RDS PostgreSQL, taking advantage of its modern deployment infrastructure. The platform provides a web interface for managing the database.

#figure(caption: "Database deployment using AWS RDS")[
  #image("images/cicd/aws.png", width: 100%)
]

#pagebreak()

= User Manual
== Mobile App Usage

=== Scanning and Hosting Cloud Anchors

Cloud anchors serve as the foundation of the positioning system and are essential for initiating the application.

==== Scanning a Cloud Anchor
The scanning process automatically activates when a cloud anchor is detected nearby. As users navigate their surroundings, the application reconstructs a 3D map of the environment. Once sufficient environmental details are captured, the anchor is automatically resolved.

==== Hosting a Cloud Anchor

#figure(caption: "Host a cloud anchor")[
  #image("images/unity-app/host-anchor.png", width: 40%)
]

To host a new cloud anchor, users should:
+ Select the "Anchor" tool
+ Tap on the screen to designate the desired anchor location

A quality indicator will then appear, displaying color-coded bars:
- Green: Optimal quality
- Yellow: Acceptable quality
- Red: Poor quality

For successful hosting, users should:
+ Move around the target point in a 180-degree arc
+ Continue until the overall quality reaches an acceptable level
+ The anchor will be hosted automatically once quality requirements are met

=== Viewing

Once the anchor is resolved, the app will automatically load the scene related to the anchor.

=== Create a 3D object

To take a photo or leave a comment, users should:
+ Switch to the desired mode using the mode selector:
  - Camera mode: For capturing photos
  - Comment mode: For leaving text comments


In camera mode:
+ Tap the center of the screen to capture a photo
+ The photo will appear as a 3D object in the scene

In comment mode:
+ Tap the center of the screen to open the keyboard
+ Type your comment
+ Tap the arrow button to send
+ The comment will appear as a 3D text object in the scene

#figure(caption: "Taking a photo and leaving a comment")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    stack(
      image("images/unity-app/spatial-image.png", width: 100%),
      "",
      align(center)[Camera Mode],
    ),
    stack(
      image("images/unity-app/spatial-comment.png", width: 100%),
      "",
      align(center)[Comment Mode],
    ),
  )
]


=== Edit a 3D object

To edit a 3D object, users should:
+ Select the object by tapping on it
+ Choose the desired operation mode from the side panel:
  - Translation: Move the object in 3D space
  - Rotation: Rotate the object around its axes
  - Scale: Resize the object proportionally


#figure(caption: "Edit a 3D object")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    stack(
      image("images/unity-app/edit-position.png", width: 100%),

      "",
      align(center)[Translate],
    ),
    stack(
      image("images/unity-app/edit-rotation.png", width: 100%),
      "",
      align(center)[Rotate],
    ),
  )
]

The selected object will be highlighted, and users can:
+ Drag to move/rotate/scale the object
+ Drag the arcball to rotate the object
+ Drag the scale handle to resize the object

== User Panel Guide
=== Login/Register
#figure(caption: "Login/Register interface")[
  #image("images/web-app-demo/register.png", width: 50%)
  #image("images/web-app-demo/login.png", width: 50%)
]

Users can register or login to the system using their username and password. The registration process requires:
+ A unique username
+ A secure password

=== User Profile
#figure(caption: "User profile")[
  #image("images/web-app-demo/user-profile.png", width: 70%)
]

Users can view their profile information, including:
+ Username
+ Email
+ Profile picture
+ Scenes (created and managed by the user)

=== Scene Management

#figure(caption: "Scene Management Interface")[
  #image("images/web-app-demo/scene-management.png", width: 70%)
]

The scene management interface provides users with comprehensive control over their virtual scenes. Key features include:

+ Scene Creation: Users can create new scenes with customizable names and descriptions
+ Scene Editing: Existing scenes can be modified to update their properties
+ Scene Deletion: Unwanted scenes can be removed from the system
+ Label Management: Each scene supports multiple descriptive labels for better organization

A global map view is integrated below the scene list, displaying the geographic distribution of all scenes across the platform.

#figure(caption: "Scene Details View")[
  #image("images/web-app-demo/scene-detail.png", width: 70%)
]

The scene detail view offers an in-depth look at each scene's properties and contents:

+ Basic Information: Scene name and detailed description
+ Geographic Data: Location-specific details and coordinates
+ Label Management: Interactive panel for viewing and modifying scene labels
+ Spatial Visualization: An integrated map view displaying all geo-referenced objects within the scene

This comprehensive interface enables users to effectively manage and interact with their virtual scenes while maintaining spatial context through the integrated mapping system.

=== Cloud Anchor Management

#figure(caption: "Cloud Anchor Management Interface")[
  #image("images/web-app-demo/cloud-anchor-management.png", width: 70%)
]

The cloud anchor management interface allows users to:
+ View all available cloud anchors in the system in map view
+ View the details of a specific cloud anchor
+ Delete a cloud anchor
+ View paginated list of cloud anchors


#figure(caption: "Cloud Anchor Details View")[
  #image("images/web-app-demo/cloud-anchor-detail.png", width: 70%)
]

The cloud anchor details view provides comprehensive information about a specific cloud anchor:

+ Basic Information: Anchor name and description
+ Geographic Data: Location-specific details and coordinates
+ Object Associated: List of objects associated with the anchor, including a link to the object details

=== Photo Management

#figure(caption: "Photo Management Interface")[
  #image("images/web-app-demo/album.png", width: 70%)
]

The photo management interface allows users to:
+ View the details of a specific photo
+ Delete a photo
+ View paginated list of photos


#figure(caption: "Photo Details View")[
  #image("images/web-app-demo/image-detail.png", width: 45%)
]

#pagebreak()

The photo details view provides comprehensive information about a specific photo:

+ Basic Information: Photo name and description
+ Geographic Data: Location-specific details and coordinates
+ Parent Scene: Link to the parent scene
+ Creation Date: Date and time of photo creation
+ Copyright Information: Copyright information/blockchain information of the photo

In the Copyright Information section, users can download the blind-watermarked photo, which can be verified in the @verify-image-copyright.

=== Comment Management

#figure(caption: "Comment Management Interface")[
  #image("images/web-app-demo/comment-management.png", width: 110%)
]

The comment management interface allows users to:
+ View all comments in the system in map view
+ View the details of a specific comment
+ Delete a comment
+ View paginated list of comments


#figure(caption: "Comment Details View")[
  #image("images/web-app-demo/comment-detail.png", width: 45%)
]

The comment details view provides comprehensive information about a specific comment:

+ Basic Information: Comment name and description
+ Geographic Data: Location-specific details and coordinates
+ Creation Date: Date and time of comment creation

=== Label Management

#figure(caption: "Label Management Interface")[
  #image("images/web-app-demo/label-management.png", width: 70%)
]

The label management interface allows users to:
+ View the details of a specific label
+ View all scenes associated with a label
+ Search for a label
+ Add / Edit / Delete a label

#figure(caption: "Add / Edit form")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    stack(
      image("images/web-app-demo/create-label.png", width: 100%),
      "",
      align(center)[Create],
    ),
    stack(
      image("images/web-app-demo/edit-label.png", width: 100%),
      "",
      align(center)[Edit],
    ),
  )
]

=== Verify Image Copyright <verify-image-copyright>

#figure(caption: "Verify Image Copyright Interface")[
  #image("images/web-app-demo/verify-image-copyright.png", width: 100%)
]
#pagebreak()

The verify image copyright page provides two main functionalities for image verification and copyright protection:


#figure(caption: "Upload Image")[
  #image("images/web-app-demo/verify-image-copyright-2.png", width: 60%)
]

1. *Image Copyright Verification*
  - Upload an image and enter a user ID
  - System performs perceptual hashing to match against database
  - Searches for similar images and corresponding geoImages
  - Verifies if the image was created by the specified user
  - Returns both potential and exact matches

2. *Watermark Extraction*
  - Extracts embedded copyright information from the image
  - Searches database cache and blockchain for matching records
  - Note: Process may fail if image has been significantly altered

The system implements one-way verification for privacy protection:
- Can verify if an image belongs to a specific user ID
- Cannot query author information by image
- Blockchain data remains hashed and secure

#figure(caption: "Verify Image Copyright Successful Results")[
  #grid(
    columns: (2fr, 2fr),
    gutter: 1em,
  )[
    #image("images/web-app-demo/verify-image-copyright-result.png", width: 100%)
  ][
    #image("images/web-app-demo/verify-image-copyright-sus.png", width: 100%)
  ][
    Exact match
  ][
    Suspicious
  ]
]

#figure(caption: "Verify Image Copyright Failed Results")[
  #image("images/web-app-demo/verify-image-copyright-wrong.png", width: 50%)
]

#figure(caption: "Verify Image Copyright Blind Watermark")[
  #grid(
    columns: (2fr, 2fr),
    gutter: 1em,
  )[
    #align(horizon)[
      #image("images/web-app-demo/verify-image-copyright-broken-wm.png", width: 100%)
    ]
  ][
    #align(center)[
      #image("images/web-app-demo/verify-image-copyright-wm.png", width: 100%)
    ]
  ][
    Broken Watermark
  ][
    Extracted and Found
  ]
]

=== Zero-Knowledge Proof

The zero-knowledge copyright verification system enables users to create and verify copyright proofs in a privacy-preserving manner. The process involves several key components:

1. *Proof Generation*
  - User generates key pair locally (never leaves device)
  - Creates commitment from artwork hash and signature
  - Generates zero-knowledge proof using Groth16
  - Optionally stores proof and commitment on blockchain

#pagebreak()

2. *Verification Modes*
  - Blockchain-based verification:
    - Verifier computes artwork hash
    - Searches blockchain for matching commitment
    - Verifies zero-knowledge proof
    - Optionally checks owner address

  - Direct commitment verification:
    - Verifier provides commitment value
    - System verifies zero-knowledge proof
    - Optionally checks owner address

3. *Privacy Features*
  - Owner address verification is optional
  - Original artwork content remains private
  - Only commitment values are stored on-chain
  - Proof verification reveals no additional information

This implementation ensures that copyright verification can be performed without compromising the privacy of the artwork owner or revealing sensitive information about the artwork itself.


#figure(caption: "Zero-Knowledge Proof Key Pair")[
  #image("images/web-app-demo/zk-key-pair.png", width: 70%)
]

Click "Generate New Key Pair" to generate a new key pair.

Or click "Import Key Pair" to import an existing key pair#footnote([This allows users to generate a key pair offline by themselves.]).

Click "Download JSON" to download the key pair as a JSON file.

Click on Address / Public Key to copy the address / public key to the clipboard#footnote([It's recommended to not to share public key and address to anyone unless you intend to reveal your identity.]).

#figure(caption: "Zero-Knowledge Proof Interface")[
  #image("images/web-app-demo/zk-ui.png", width: 70%)
]

Click "Select Artwork File" to upload an artwork file.

#figure(caption: "Zero-Knowledge Proof Created")[
  #image("images/web-app-demo/zk-created-proof.png", width: 70%)
]

A proof is created with details as below:

- Owner Address: The address of the owner of the artwork
- Public Signal: The first public signal of the artwork
- Protocol: The protocol used to create the proof
- Curve: The curve used to create the proof

Click "Download Proof" to download the proof as a JSON file.

#figure(caption: "Zero-Knowledge Proof Blockchain Verification")[
  #image("images/web-app-demo/zk-trad-noown.png", width: 70%)
]

#figure(caption: "Zero-Knowledge Proof Blockchain Verification with Owner Address")[
  #image("images/web-app-demo/zk-b-own.png", width: 70%)
]

#figure(caption: "Zero-Knowledge Proof Broken Proof")[
  #image("images/web-app-demo/zk-broken-proof.png", width: 70%)
]

#figure(caption: "Zero-Knowledge Proof without Owner Verification")[
  #image("images/web-app-demo/zk-zk-noown-2.png", width: 70%)
]

#figure(caption: "Zero-Knowledge Proof with Owner Verification")[
  #image("images/web-app-demo/zk-zk-own-2.png", width: 70%)
]

#pagebreak()

= Conclusion
== Project Summary

The SnapSphere project represents a significant advancement in the field of immersive photo experiences, combining cutting-edge technologies to create a unique platform for digital content sharing and protection. The project successfully integrated augmented reality, blockchain technology, and advanced security features to deliver a comprehensive solution for modern digital content management.

Key achievements of the project include:

1. *Innovative Technology Integration*
  - Seamless AR experience with cloud anchors
  - Robust blockchain-based copyright protection
  - Advanced invisible watermarking system
  - Efficient image similarity search

2. *Security and Privacy*
  - Zero-knowledge proof implementation
  - Tamper-proof content protection
  - Privacy-preserving verification
  - Secure data management

3. *User Experience*
  - Intuitive AR interactions
  - Responsive web interface
  - Cross-platform compatibility
  - Real-time social features

The project demonstrates the potential of combining emerging technologies to create innovative solutions for digital content management and social interaction. The successful implementation of complex features like invisible watermarking and zero-knowledge proofs showcases the technical capabilities of the development team.

== Future Work

The project has laid a solid foundation for future development and enhancement. Several areas have been identified for potential improvement and expansion:

1. *Unimplemented Features*
  - Lua scripting support for dynamic behavior
  - Offline mode functionality
  - Enhanced AR interactions
  - Advanced content management tools

2. *UI/UX Improvements*
  - More intuitive AR controls
  - Enhanced visual feedback
  - Improved accessibility features
  - Customizable interface options

3. *Technical Enhancements*
  - Performance optimization
  - Scalability improvements
  - Advanced analytics
  - Machine learning integration

4. *Integration Opportunities*
  - Social media platform integration
  - Third-party login service support
  - Better cross-platform compatibility
  - API expansion

5. *Security and Privacy*
  - Enhanced encryption methods
  - Advanced privacy controls

These future developments will further enhance the platform's capabilities and user experience, making it an even more powerful tool for digital content creation and sharing.
#pagebreak()


= Appendix


== A Simple Example of Zero-Knowledge Proof

=== The Magic Cave Story@zero-knowledge-proofs <magic-cave>

#figure(caption: "The Magic Cave Story")[
  #grid(
    columns: 3,
    gutter: 1em,
    [ #image("images/ali-cave/330px-Zkip_alibaba1.png") ],
    [ #image("images/ali-cave/330px-Zkip_alibaba2.png") ],
    [ #image("images/ali-cave/330px-Zkip_alibaba3.png") ],
  )
]

Once upon a time, you, as Ali, discovered a magical cave with two paths:

- Path A (left)
- Path B (right)

At the heart of the cave, these paths converge at a mysterious door that can only be opened with a secret magic word.

=== The Challenge

Your friend Xiao Ming is skeptical about your knowledge of the secret word. To prove your knowledge without revealing the word itself, you devise a clever game:

1. *While Xiao Ming waits outside*, you enter the cave through either path
2. Xiao Ming then randomly requests you to exit through Path A or B
3. If you truly know the secret word, you can:
  - Unlock the door
  - Exit through whichever path Xiao Ming requests
4. If you don't know the word, you must:
  - Return through the same path you entered

#notify([
  The key to this being a "zero-knowledge" proof lies in Xiao Ming not knowing which path you initially entered through.

  If you were to let Xiao Ming see you enter through Path A and exit through Path B, he would gain a *fact* about your knowledge of the secret word.

  This would violate the *zero-knowledge* property, as Xiao Ming could then prove to others that you know the secret word by recording the process. (If he secretly recorded the process, he could then show it to others.)

  The beauty of the zero-knowledge proof is that Xiao Ming becomes convinced of your knowledge, but cannot convince others.
])

#pagebreak()

=== The Proof Process

By repeating this game multiple times (say, 20 times), Xiao Ming becomes increasingly convinced of your knowledge because:

- You consistently exit through the requested path
- The probability of guessing correctly every time is astronomically low
- The secret word itself remains a mystery to Xiao Ming

Most importantly, Xiao Ming cannot prove your knowledge to others. Since he never sees which path you initially enter through, any recording of the process could be easily faked by two people working together.

=== Demonstrating ZKP Properties

This enchanting story perfectly illustrates the three fundamental properties of zero-knowledge proofs:

#table(
  columns: (auto, auto),
  [Completeness], [If you know the word, you always succeed],
  [Soundness], [If you don't know the word, you'll likely fail eventually],
  [Zero-Knowledge], [Xiao Ming learns nothing about the word itself, just that you know it],
)





== Why using Incomplete Zero-Knowledge Proofs?
From a theoretical perspective of zero-knowledge proofs,we can use *only the commitment* to verify the proof. In fact, we can design a more "zero-knowledge" solution:

The commitment should essentially only contain:
- The output value of Poseidon (sigHash, artHash)

This value serves as the public input. In the circuit, we verify:
- The signer indeed knows the corresponding signature (sigHash)
- This signature is indeed for the specific artwork (artHash)
- The Poseidon hash of these two values equals the commitment

This design has the following advantages:
- More aligned with zero-knowledge principles, as we don't need to expose the owner's address at all
- Simpler verification process, only requiring proof validity check
- Better privacy, as external observers cannot determine who the owner is

However, the current implementation chooses to store pubKeyHash (i.e., owner's address) simultaneously, is due to the following practical considerations:
- Facilitates on-chain tracking and querying
- Supports explicit ownership verification
- Better integration with existing blockchain ecosystems

Therefore, this represents a trade-off between theoretical purity and practicality. From a pure zero-knowledge proof perspective - we could indeed complete the verification using only the commitment, but it's not practical here.

#pagebreak()
== Semester 1 Project Proposal <sem1-proposal>
=== Motivation and Background

The motivation behind this project stems from three key observations about the current state of digital media and social interaction:

+ Digital Media Evolution
  - Traditional photo sharing platforms lack spatial context and interactive experiences
  - Users desire more immersive ways to experience digital content
  - AR technology enables new forms of visual storytelling

+ Content Protection Needs
  - Growing concerns about digital content ownership
  - Increasing cases of unauthorized content usage
  - Need for robust copyright protection mechanisms

+ Social Interaction Enhancement
  - Limited ways to share experiences in digital spaces
  - Desire for more meaningful social connections
  - Potential of AR to create shared virtual spaces

The project addresses these challenges by combining several innovative technologies:

+ Augmented Reality Integration
  - Enables spatial photo viewing
  - Creates immersive social experiences
  - Bridges physical and digital worlds

+ Blockchain-based Protection
  - Ensures content ownership
  - Provides tamper-proof records
  - Enables trustless verification

+ Advanced Security Features
  - Invisible watermarking for content tracking
  - Zero-knowledge proofs for privacy
  - Perceptual hashing for content identification

This combination of technologies creates a unique platform that:
- Preserves the spatial context of photos
- Protects creators' rights
- Fosters meaningful social interactions
- Maintains user privacy and security

The project's background is rooted in the convergence of several technological trends:
- The rise of AR/VR technologies
- Growing adoption of blockchain solutions
- Increasing focus on digital privacy
- Evolution of social media platforms

These factors create an ideal environment for developing a platform that reimagines how we share, protect, and experience digital content in an increasingly connected world.

=== Objectives and Scope

The project aims to create an innovative platform that combines AR technology, blockchain, and social features to revolutionize how we experience and share digital content. The objectives are organized around three main user groups:

==== General Users

*Immersive Experience*
- Explore photos in AR/MR with spatial context
- View content from original capture perspectives
- Interact through spatial comments and replies

#figure(caption: [Conceptual diagram of AR/MR experience@google-arcore-doc])[
  #image("images/arcore/arcore_geospatial_overview.mp4_20241127_212923.146.png", width: 70%)
  #image("images/arcore/arcore_geospatial_creator.mp4_20241127_212905.124.png", width: 70%)
  #image("images/arcore/LaSagrada.png", width: 70%)
]

#pagebreak()

*Privacy and Discovery*
- On-device processing of private data
- Flexible privacy controls for data protection

==== Content Creators

*Creative Tools*
- Create interactive AR stories with photos and media
- Showcase artwork in immersive environments
- Build time-based narratives and sequences

#figure(caption: [Conceptual diagram of content creator@google-arcore-doc])[
  #image("images/arcore/arcore_geospatial_creator.mp4_20241127_212814.871.png", width: 70%)
]

*Content Protection*
- Secure copyright management through blockchain
- Decentralized ownership verification
- Tamper-proof content records

==== Technical Scope

*Core Features*
- AR/MR content viewing and interaction
- Blockchain-based ownership management
- Privacy-preserving technology
- Real-time social features

*Technical Limitations*
- Device compatibility requirements
- Privacy implementation complexity
- External service dependencies
- Limited offline functionality

=== Feasibility Study

The feasibility study for SnapSphere was conducted to evaluate the project's viability across three key dimensions: market potential, technical requirements, and operational sustainability.

Market analysis revealed a growing demand for immersive AR experiences and interactive social media platforms, particularly among younger demographics. The project's unique combination of AR technology, blockchain-based content protection, and social features positions it well in the market. User research indicated strong interest in novel ways to experience and share content, with particular emphasis on privacy and content ownership.

From a technical perspective, the project leverages well-established technologies including AR Foundation, blockchain, and zero-knowledge proofs. The core technologies have been proven in production environments, and the development team possesses the necessary expertise in these areas. Key technical challenges such as device sensor calibration, privacy-preserving architecture, and cross-platform compatibility were identified and addressed through careful planning and implementation.

Operational viability was assessed through a comprehensive evaluation of user experience, technical infrastructure, and resource requirements. The study confirmed that the project can be implemented with existing resources while maintaining high standards of performance and reliability. The combination of cloud services, modern development tools, and robust security measures ensures a sustainable operational model.

The study concluded that SnapSphere is technically feasible and commercially viable, with a clear path to implementation and a strong value proposition for users. The project's innovative approach to digital content sharing and protection addresses current market needs while leveraging proven technologies and best practices.

=== Requirements Analysis

==== Functional Requirements

===== User Authentication
- JWT-based authentication system
- Role-based access control
- Token revocation mechanism
- Secure key management

===== Content Creation
- Cloud anchor management
- Spatial positioning system
- Scene-based organization

===== Web Content Management
- Scene and content administration
- User management interface
- Content moderation tools
- Analytics dashboard

===== Backend Review and Analytics
- Content verification system
- Usage statistics tracking
- Performance monitoring
- Security audit logging

===== Non-Functional Requirements

===== Response Time
- Real-time AR content loading
- Fast image similarity search
- Efficient blockchain transactions
- Low-latency social interactions

===== Data Consistency
- Blockchain-based ownership records
- Synchronized AR content
- Reliable data backup

===== Privacy Protection
- Zero-knowledge proof implementation
- Invisible watermarking
- Privacy-preserving content discovery
- Secure data storage

===== Security Requirements
- Tamper-proof content protection
- Secure key management
- Access control enforcement
- Vulnerability prevention

===== Scalability Requirements
- Distributed content delivery
- Load balancing
- Resource optimization
- Performance monitoring

===== Usability Requirements
- Intuitive AR interactions
- Clear content organization
- Responsive web interface
- Cross-platform compatibility

=== Risk Management
==== Technical Challenges

===== AR Framework Selection
*Initial Challenges*
- Limited open-source AR solutions
- The8thwall's closed-source nature
- AR.js implementation difficulties
- Cross-platform compatibility issues

*Solution*
- Selected Unity + AR Foundation after evaluating WebXR and The8thwall
- Leveraged Unity's robust AR development tools
- Utilized AR Foundation's cross-platform capabilities
- AR Foundation is a cross-platform framework by nature

#figure(caption: [Maker based positioning in AR.js])[
  #image("images/legacy/image_positioning.png", width: 50%)
]

Marker Tracking displays content when a marker is detected by the camera. While stable, markers are limited in shape, color and size. Common applications include augmented books, flyers and advertising.@ar-js

Marker Tracking is attempted to be used in the project, but it's requiring a pre-defined marker image, which is not suitable for the project.

Location Based AR uses real-world coordinates to display AR content on user devices. Users can move around outdoors and see AR content anchored to real locations, with content scaling based on distance. Applications include tourist guides, city exploration, point-of-interest discovery, and educational experiences like treasure hunts and situated art. @ar-js

Location Based AR is not applicable to the project, due to the low accuracy of the location.

Eventually, it's possible to use Cloud Anchor positioning in this project, explained in @cloud-anchor.

===== Algorithm Implementation
*Complex Requirements*
- Zero-knowledge proof integration
- External software dependencies
  - The watermarking module depends on a python executable.
- Mathematical complexity
  - In the mobile app development, complex 3D environment interactions require extensive knowledge of linear algebra and computer graphics
- Performance optimization
  - The watermarking module is a performance bottleneck
*Solution*
- Modular design approach
- Python-based watermarking
- Optimized proof generation
- Efficient verification process

===== Development and Debugging
*Development Challenges*
- Long Unity compilation times (\~3 minutes)
  - Unity build is full package compilation by default
- Limited debugging capabilities
  - Hard to debug across devices
- Mobile deployment complexity
- Performance monitoring
- Requirement of Secure contexts
  - Some AR features in Browser are not available in non-secure contexts (non-HTTPS)

*Solution*
- Optimized build process (Incremental Build)
- Enhanced logging system (Logcat@logcat)
- Performance profiling#footnote([It turns out that the performance is good enough, so I didn't do anything about it.])
- Use HTTPS proxy, e.g. `ngrok`@ngrok

==== Risk Mitigation Strategies

===== Technical Risk Management
- Regular technology evaluation
- Backup solution planning
- Performance optimization
- Cross-platform testing

===== Development Process
- Modular architecture
- Continuous integration
- Automated testing
- Performance monitoring

===== Quality Assurance
- Comprehensive testing
- User feedback collection
- Performance benchmarking
- Security auditing


#pagebreak()

#bibliography("bib.yml")
