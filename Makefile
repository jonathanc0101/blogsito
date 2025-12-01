# ---------------------------------------
# Configuración
# ---------------------------------------
HUGO       = hugo
BUILD_DIR  = _build         # build de prueba (ignorado en git)
PUBLIC_DIR = public         # build real (worktree a gh-pages)

# ---------------------------------------
# Servidores
# ---------------------------------------

# Server mostrando drafts, sirviendo desde _build
serve-draft:
	$(HUGO) server -D -d $(BUILD_DIR)

# Server real (sin drafts), sirviendo desde _build
serve:
	$(HUGO) server -d $(BUILD_DIR)

# ---------------------------------------
# Builds
# ---------------------------------------

# Build de prueba: NO toca gh-pages
build:
	$(HUGO) --minify -d $(BUILD_DIR)

# Build real: genera en "public" (worktree a gh-pages)
build-real:
	$(HUGO) --minify

# ---------------------------------------
# Deploy manual a gh-pages
# ---------------------------------------

deploy: build-real
	cd $(PUBLIC_DIR) && \
	git add . && \
	git commit -m "Deploy $$(date +'%Y-%m-%d %H:%M:%S')" && \
	git push origin gh-pages

# ---------------------------------------
# Limpieza
# ---------------------------------------

clean:
	rm -rf $(BUILD_DIR)


# ---------------------------------------
# Uso: make convert file=brainrot 
# Funcionamiento: convierte brainrot.docx en markdown
# ---------------------------------------
convert:
	pandoc $(file).docx -t markdown -o $(file).md