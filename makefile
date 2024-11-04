MSG = "update"

commit-public:
	cd public && \
	git add . && \
	git commit -m "$(MSG)" || true && \
	git push

commit-blog:
	git add . && \
	git commit -m "$(MSG)" || true && \
	git push

gen:
	hugo

run: gen commit-public commit-blog