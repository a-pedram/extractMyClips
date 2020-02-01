# extractMyClips
A bash script to extract your clipping(Highlights, notes, ...) from your Kindle ebook reader.

Usage: extractMyClips.sh bookTitle clippingFile.txt

The purpose of this small script is to extrcat all your clipping from a book on your kinddle ebook reader. There is a text file named "My Clippings.txt" in kindle device which is where notes and highlights are saved. To use this script you should pass the title of the book as its first parameter and provide the file as the second one.

## Example
./extractMyClips.sh "Sapiens: A Brief History" /home/mehdi/Dropbox/My\ Clippings.txt  > sapiens.txt
<br> The above command save all your clips from a book which has "Sapiens: A Brief History" in its title into a file named sapiens.txt
