# Brief Ideas Archive

A static Jekyll-based archive of **The Journal of Brief Ideas** - a research journal for publishing brief scientific ideas in 200 words or less.

## About The Journal of Brief Ideas

The Journal of Brief Ideas was a research journal composed entirely of 'brief ideas'. The goal was to provide a place for short ideas to be described - in 200 words or less - for these ideas to be archived, searchable and citable.

**Current Status**: The journal is currently in stasis and archived for now. However, we are looking for technical help to restart. If you think you could help, see the [GitHub issue](https://github.com/openjournals/brief-ideas/issues/219) for more information.

## Live Site

The archived site is deployed at: [https://beta.briefideas.org](https://beta.briefideas.org)


## Development

### Prerequisites

- Ruby 2.7+
- Jekyll 4.0+
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR-USERNAME/brief-journal-archive.git
   cd brief-journal-archive
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Run locally**
   ```bash
   bundle exec jekyll serve
   ```

4. **View the site**
   Open [http://localhost:4000](http://localhost:4000) in your browser

### Building for Production

```bash
bundle exec jekyll build
```

The generated site will be in the `_site` directory.

## GitHub Pages Deployment

This site is configured for GitHub Pages deployment:

1. **Push to main branch**
   ```bash
   git add .
   git commit -m "Update content"
   git push origin main
   ```

2. **GitHub Pages builds automatically**
   - No need to commit the `_site` directory
   - GitHub Pages runs `jekyll build` on push
   - Site deploys to your configured domain

## License

This project is open source. See the original [Brief Ideas repository](https://github.com/openjournals/brief-ideas) for licensing information.

## Support

For technical questions about this archive:
- Open an issue on this repository
- Check the [original Brief Ideas GitHub](https://github.com/openjournals/brief-ideas)

For questions about the Journal of Brief Ideas project:
- See the [GitHub issue for restarting the project](https://github.com/openjournals/brief-ideas/issues/219)
- Contact the editors via the [contact page](https://beta.briefideas.org/contact)

---

**Note**: This is a static archive of the original Journal of Brief Ideas. The original dynamic site was built with Ruby on Rails, but this version uses Jekyll for easier maintenance. 