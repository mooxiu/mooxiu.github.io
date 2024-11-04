commit-public:
	cd public && \
	git add . && \
	git commit -m "update" || true && \
	git push

commit-blog:
	git add . && \
	git commit -m "update" && \
	git push

gen:
	hugo

run: gen commit-public commit-blog