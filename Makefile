# ---------------------------------------
# Configuración
# ---------------------------------------
HUGO       = hugo
BUILD_DIR  = _build         # build de prueba (ignorado en git)
PUBLIC_DIR = public         # build real (worktree a gh-pages)

# ---------------------------------------
# Targets de servidor
# ---------------------------------------

# Server mostrando drafts
serve-draft:
	$(HUGO) server -D

# Server real (sin drafts)
serve:
	$(HUGO) server

# ---------------------------------------
# Targets de build
# ---------------------------------------

# Build de prueba: NO toca gh-pages
build:
	$(HUGO) --minify -d $(BUILD_DIR)

# Build real: genera en "public" (rama gh-pages)
build-real:
	$(HUGO) --minify

# ---------------------------------------
# Deploy manual a gh-pages (worktree)
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
