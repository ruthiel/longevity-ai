# 🚀 Longevity AI - Your AI-Powered Health & Longevity Coach

An intelligent conversational AI application designed to provide evidence-based guidance on longevity, healthspan optimization, and wellness. Built with advanced RAG (Retrieval Augmented Generation) technology and powered by expert knowledge from leading longevity researchers.

## ✨ Features

### 🧠 **Intelligent Conversation**

- **Context-Aware Chat**: Maintains conversation history for natural, flowing discussions
- **Expert Knowledge**: Trained on content from Dr. Peter Attia, Dr. Gabrielle Lyon, and other longevity experts
- **Personalized Responses**: Adapts answers based on conversation context and user needs

### 📚 **Comprehensive Knowledge Base**

- **Book Summaries**: Key insights from "Outlive", "Forever Strong", and other longevity books
- **Web Articles**: Curated content from trusted health and longevity websites
- **Semantic Chunking**: Intelligent document splitting that preserves logical structure
- **Rich Metadata**: Detailed source tracking and content categorization

### 🎯 **Core Expertise Areas**

- **Exercise & Training**: VO2 max, Zone 2 training, strength protocols, stability work
- **Nutrition Science**: Evidence-based dietary strategies for metabolic health
- **Sleep Optimization**: Protocols for improving sleep quality and duration
- **Stress Management**: Techniques for mental health and resilience
- **Disease Prevention**: Focus on the "Four Horsemen" of chronic disease
- **Biomarkers**: Understanding key health metrics and their significance

### 🛡️ **Safety & Ethics**

- **Medical Disclaimers**: Clear boundaries on medical advice
- **Evidence-Based**: Only recommendations supported by research
- **European Units**: Metric system for all measurements
- **Professional Standards**: Balanced, realistic health guidance

## 🛠️ Technologies Used

- **Python**: Core application development
- **LangChain**: RAG pipeline and document processing
- **OpenAI GPT-4**: Advanced language model for responses
- **Gradio**: Interactive web interface
- **Supabase + pgvector**: Vector database for semantic search
- **Markdown Processing**: Intelligent content parsing and chunking

## 📁 Project Structure

```
longevity-ai/
├── config/
│   ├── system_message.txt      # AI personality and guidelines
│   └── web_sources.json        # Curated web content sources
├── downloads/
│   └── books/                  # Book summaries in markdown format
├── src/
│   ├── document_loaders.py     # Content loading utilities
│   └── vector_store_setup.py   # Database initialization
├── app.py                      # Main Gradio application
├── requirements.txt            # Python dependencies
└── README.md                   # This file
```

## 🚀 Quick Start

### Prerequisites

- Docker and Docker Compose installed
- Git
- OpenAI API key
- Supabase account (for vector database)

### Installation

**1. Clone and Start (2 commands!)**
```bash
# Clone and enter the project
git clone https://github.com/ruthiel/longevity-ai.git
cd longevity-ai

# Start the application
docker-compose up --build
```

**2. Configure environment variables**

Create a `.env` file in the root directory:
```env
OPENAI_API_KEY=your_openai_api_key
SUPABASE_URL_API=your_supabase_url
SUPABASE_KEY=your_supabase_anon_key
```

**3. Set up Supabase database**

In your Supabase SQL Editor, run:
```sql
-- Enable vector extension
create extension vector;

-- Create documents table
create table longevity_knowledge (
  id bigserial primary key,
  content text,
  embedding vector(1536),
  source text,
  metadata jsonb
);

-- Create index for faster similarity search
create index on longevity_knowledge 
using ivfflat (embedding vector_cosine_ops)
with (lists = 100);
```

**4. Access the application**

Open your browser and go to: **http://localhost:8888**

## 📖 Knowledge Sources

Our knowledge base includes carefully curated content from:

### 📚 **Books**

- "Outlive" by Dr. Peter Attia - Comprehensive longevity framework
- "Forever Strong" by Dr. Gabrielle Lyon - Muscle-centric health approach
- Additional longevity and health optimization books

### 🌐 **Web Content**

- Expert websites and research institutions
- Peer-reviewed articles and studies
- Trusted health and longevity publications

## 💡 Usage Examples

### Basic Health Questions

```
User: "How can I improve my sleep quality?"
AI: "Great question! Sleep is one of the fundamental pillars of longevity 😴

Quality sleep optimization involves several key strategies:
• Sleep hygiene protocols 🌙
• Temperature regulation (16-19°C optimal)
• Light exposure management
• Stress reduction techniques

[Detailed evidence-based recommendations follow...]"
```

### Follow-up Context

```
User: "What supplements help with that?"
AI: "For sleep optimization specifically, here are evidence-backed supplements:
• Magnesium glycinate (200-400mg before bed)
• Melatonin (0.5-3mg, 30-60 minutes before sleep)
• L-theanine (100-200mg for relaxation)

[Context-aware response continues...]"
```

## 🔧 Advanced Features

### **Intelligent Document Processing**

- **Semantic Chunking**: Preserves logical document structure
- **Metadata Enrichment**: Tracks source, author, section, and processing details
- **Context-Aware Retrieval**: Uses conversation history for better search results

### **Conversation Management**

- **Memory Limitation**: Configurable history length to manage token usage
- **Context Continuity**: References previous topics naturally
- **Source Attribution**: Transparent about information sources

## 🔮 Roadmap

### **Near Term**

- [ ] Enhanced source citation display
- [ ] User preference customization
- [ ] Mobile-responsive interface improvements
- [ ] Additional expert content integration

### **Future Enhancements**

- [ ] Personal health data integration
- [ ] Custom protocol generation
- [ ] Multi-language support
- [ ] API endpoints for third-party integration
- [ ] Advanced analytics and insights

## 🤝 Contributing

We welcome contributions to improve Longevity AI! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Content Contributions**

- High-quality, evidence-based health content
- Expert interviews and summaries
- Research paper summaries
- Protocol documentation

## 🛠️ Stop the Application

```bash
docker-compose down
```

## ⚖️ Disclaimer

**Important**: This application provides educational information only and is not intended as medical advice. Always consult with qualified healthcare professionals before making any health-related decisions or changes to your lifestyle.

## 🙏 Acknowledgments

Special thanks to:

- **Dr. Peter Attia** - For groundbreaking longevity research and protocols
- **Dr. Gabrielle Lyon** - For muscle-centric health insights
- **LangChain Community** - For excellent RAG framework tools
- **OpenAI** - For advanced language model capabilities
- **Supabase Team** - For vector database infrastructure

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📧 Contact

**Ruthiel Trevisan** - [@ruthiel](https://github.com/ruthiel)

Project Link: [https://github.com/ruthiel/longevity-ai](https://github.com/ruthiel/longevity-ai)

---

**🌟 Star this repository if you find it helpful! 🌟**

*Building the future of personalized longevity guidance, one conversation at a time.*