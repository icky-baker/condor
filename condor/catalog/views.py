from catalog.models import Author, Book, BookInstance, Genre
from django.shortcuts import render
from django.views import generic
from django.views.generic import ListView


def index(request):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.count()

    num_instances_available = BookInstance.objects.filter(status__exact="a").count()

    num_authors = Author.objects.count()

    context = {
        "num_books": num_books,
        "num_instances": num_instances,
        "num_instances_available": num_instances_available,
        "num_authors": num_authors,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, "index.html", context=context)


class BookListView(generic.ListView):
    model = Book
    paginate_by = 3


class BookDetailView(generic.DetailView):
    model = Book


class AuthorListView(generic.ListView):
    model = Author
    paginate_by = 5


class AuthorDetailView(generic.DetailView):
    model = Author
