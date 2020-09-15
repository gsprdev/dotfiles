for file in ~/.{path,bash_prompt,exports,aliases,functions,final}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

