# AI-Powered Longevity Knowledge Assistant

[![Project Status](https://img.shields.io/badge/Status-Developing-yellow)](https://github.com/your-username/ai-longevity-coach)
![Python](https://img.shields.io/badge/Python-3.x-blueviolet)
![Langchain](https://img.shields.io/badge/Langchain-Latest-orange)
![OpenAI](https://img.shields.io/badge/OpenAI-API-lightgrey)
![Supabase](https://img.shields.io/badge/Supabase-VectorDB-green)

## Overview

The AI-Powered Longevity Knowledge Assistant is an intelligent application designed to provide users with evidence-based information and insights on how to live a longer and healthier life. By leveraging the power of Artificial Intelligence and a carefully curated knowledge base, this application acts as a personalized guide to longevity.

At its core, the application utilizes the **Retrieval Augmented Generation (RAG)** framework. This sophisticated approach allows the system to answer user queries by first retrieving relevant information from a vast knowledge base and then using a Large Language Model (LLM) to generate comprehensive and contextually appropriate responses. This ensures that the information provided is not only informative but also grounded in credible sources.

The knowledge base is constructed from a diverse range of authoritative materials covering various aspects of longevity, including:

* **Exercise Science:** Optimal training methodologies, the benefits of different types of physical activity, and their impact on lifespan and healthspan.
* **Sleep Hygiene:** Strategies for achieving high-quality sleep and its crucial role in physical and cognitive longevity.
* **Nutritional Science:** Evidence-backed dietary recommendations, the impact of macronutrients and micronutrients, and optimal eating patterns for healthy aging.
* **Supplementation Analysis:** Objective assessments of the efficacy and safety of various dietary supplements relevant to longevity.
* **Stress Management Techniques:** Proven methods for reducing and managing stress and its detrimental effects on long-term health.
* **Emerging Longevity Research:** Incorporating insights from the latest scientific studies and expert opinions in the field of aging.

The application aims to empower users with easily understandable and trustworthy information, enabling them to make informed decisions about their lifestyle and health choices to maximize their potential for a longer and healthier life.

## Table of Contents

* [Overview](#overview)
* [Technologies Used](#technologies-used)
* [Installation](#installation)
* [Data Sources](#data-sources)
* [How It Works](#how-it-works)
* [Future Enhancements](#future-enhancements)
* [Contributing](#contributing)
* [Acknowledgments](#acknowledgments)

## Technologies Used

* **Python:** The primary programming language for building the application's logic and integrating various components.
* **Langchain:** A powerful framework for developing applications powered by Large Language Models, facilitating the implementation of the RAG pipeline.
* **OpenAI:** Provides access to state-of-the-art Large Language Models (LLMs) used for generating intelligent and coherent responses.
* **Supabase:** A scalable open-source alternative to Firebase, serving as the vector database to store and efficiently query embeddings of the knowledge base. The `pgvector` extension is utilized for vector similarity search.
* **Document Loaders (Langchain):** Tools for ingesting data from various sources, such as web pages and potentially local files.
* **Text Splitters (Langchain):** Algorithms for dividing large text documents into smaller, semantically meaningful chunks for embedding.
* **Embeddings Models (OpenAI/Langchain):** Models used to create numerical vector representations (embeddings) of text data, enabling semantic search and retrieval.
* **`supabase`:** The official Python client library for interacting with the Supabase backend.
* **`python-dotenv`:** A library for managing sensitive configuration information (like API keys) using a `.env` file.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/ai-longevity-coach.git](https://github.com/your-username/ai-longevity-coach.git)
    cd ai-longevity-coach
    ```

2.  **Set up a virtual environment (recommended):**
    ```bash
    python -m venv venv
    source venv/bin/activate  # On macOS/Linux
    venv\Scripts\activate  # On Windows
    ```

3.  **Install the required Python packages:**
    ```bash
    pip install -r requirements.txt
    ```
    *(You may need to create the `requirements.txt` file first by running `pip freeze > requirements.txt` after installing the core dependencies.)*

4.  **Configure environment variables:**
    * Create a `.env` file in the root directory of the project.
    * Add your OpenAI API key and Supabase project credentials to the `.env` file:
        ```dotenv
        OPENAI_API_KEY="YOUR_OPENAI_API_KEY"
        SUPABASE_URL_API="YOUR_SUPABASE_URL"
        SUPABASE_KEY="YOUR_SUPABASE_ANON_KEY"
        ```
        * Replace the placeholder values with your actual API keys and Supabase project details. You can find your Supabase Project URL and anon key in your Supabase dashboard under Settings -> API.

5.  **Enable the `pgvector` extension in your Supabase project:**
    * Navigate to your Supabase project's SQL Editor.
    * Execute the following SQL command:
        ```sql
        create extension vector;
        ```

6.  **Create the necessary table in Supabase:**
    * Use the SQL Editor to create a table (e.g., `longevity_knowledge`) to store the text chunks and their embeddings. Ensure it includes a `vector` column with the appropriate dimensions for your chosen embedding model.
        ```sql
        create table longevity_knowledge (
            id bigserial primary key,
            content text,
            embedding vector(1536), -- Adjust dimension as needed
            source text,
            metadata jsonb
        );
        ```

## Data Sources

The application's knowledge base is built upon information extracted from various credible sources, including:

* **Podcasts:** Transcripts and summaries from leading health and longevity podcasts (e.g., The Peter Attia Drive, Huberman Lab Podcast, Zoe Science & Nutrition).
* **Articles:** Peer-reviewed scientific articles and reputable health publications focusing on longevity research.
* **Book Excerpts:** Key insights and information from authoritative books on longevity, exercise, nutrition, sleep, and stress management (e.g., "Outlive" by Peter Attia, works by Gabrielle Lyon).
* **Website Content:** Information from the official websites of renowned longevity experts and research institutions.

Efforts are made to ensure that all data sources are scientifically sound and legally accessible.

## How It Works

1.  **Data Ingestion:** Relevant content from the identified sources is loaded into the system using Langchain's document loaders.
2.  **Text Chunking:** Large pieces of text are divided into smaller, semantically coherent chunks using Langchain's text splitters.
3.  **Embedding Generation:** Each text chunk is converted into a high-dimensional vector embedding using OpenAI's embedding models. These embeddings capture the semantic meaning of the text.
4.  **Vector Storage:** The text chunks and their corresponding embeddings are stored in the Supabase vector database. Metadata about the source of each chunk is also stored.
5.  **User Query:** When a user asks a question related to longevity, their query is also converted into an embedding vector using the same embedding model.
6.  **Retrieval:** The system performs a similarity search in the Supabase vector database to find the text chunks whose embeddings are most semantically similar to the user's query embedding.
7.  **Response Generation:** The retrieved text chunks, along with the user's query, are passed to the OpenAI LLM. The LLM uses this context to generate a comprehensive and informative answer.

## Future Enhancements

* **User Data Integration:** Allow users to input personal health data to further personalize recommendations.
* **Multi-Modality Support:** Incorporate information from images, videos, and other media.
* **Fine-tuning the LLM:** Potentially fine-tune the base LLM on the specific domain of longevity for improved accuracy and style.
* **User Interface Development:** Build a user-friendly web or mobile interface for easier interaction.
* **Source Citation:** Provide citations to the specific sources used to generate each answer.
* **More Sophisticated Retrieval Strategies:** Explore advanced retrieval techniques to improve the relevance of retrieved information.

## Acknowledgments

* The developers of Langchain for providing a powerful framework for building LLM applications.
* OpenAI for their advanced language models and embedding services.
* The Supabase team for their excellent open-source backend platform and vector database capabilities.
* The experts and creators of the valuable content that forms the knowledge base of this application.