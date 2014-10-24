
.SILENT:

BUILDDIR = build
DATE = $(shell date "+%Y-%m-%d")

RESUME_INCLUDES = header.md \
 description.md \
 education.md \
 experience-business.md \
 experience-military.md

CV_INCLUDES = header.md \
 description.md \
 education.md \
 experience-business.md \
 experience-military.md \
 articles.md \
 awards.md \
 memberships.md \
 training.md

.PHONY: all
all: builddir cv resume

.PHONY: cv
cv: builddir cv-pdf cv-html cv-word

.PHONY: cv-pdf
cv-pdf: builddir
	echo "Creating cv-pdf"
	pandoc						\
	  --smart					\
	  --standalone					\
	  --no-tex-ligatures				\
	  --template=template.tex			\
	  -o $(BUILDDIR)/cv-joe-schafer-$(DATE).tex     \
	  ${CV_INCLUDES}

	rubber --into $(BUILDDIR) --warn all --pdf $(BUILDDIR)/cv-joe-schafer-$(DATE).tex

.PHONY: cv-html
cv-html: builddir
	echo "Creating cv-html"
.PHONY: cv-word
cv-word: builddir
	echo "Creating cv-word"

.PHONY: resume
resume: builddir resume-pdf resume-html resume-word

.PHONY: resume-pdf
resume-pdf: builddir
	echo "Creating resume-pdf"

.PHONY: resume-html
resume-html: builddir
	echo "Creating resume-html"

.PHONY: resume-word
resume-word: builddir
	echo "Creating resume-word"
	pandoc						\
	  --smart					\
	  --standalone					\
	  --no-tex-ligatures				\
	  -o $(BUILDDIR)/cv-joe-schafer-$(DATE).docx    \
	  ${CV_INCLUDES}

.PHONY: builddir
builddir:
	mkdir -p $(BUILDDIR)

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)
