defmodule NockPoly do
  @moduledoc """
  Representations of polynomial functors in Elixir, and of Nock
  as a polynomial functor.
  """

  require Noun
  require Nock
  require Logger

  use TypedStruct

  defmodule Term do
    @moduledoc """

    I represent a term of any type which can be generated by the
    application of finitary polynomial functors -- in particular
    all finite products and coproducts.  I am a form of S-expression
    chosen to correspond to the application of polynomial functors --
    such an application produces a dependent pair of a position
    (which is effectively a constructor together with any of its
    parameters, in the context of datatypes) and a function type
    out of a type of directions (which makes the direction-type the
    index type of the fields of a record, in the context of data
    types).

    That the function from the directions is implemented as a list
    rather than a function forces each direction-type to be finite,
    which in turn means that these terms can only represent types
    generated by _finitary_ polynomial functors.

    This type is parameterized on the type of its constructor so
    that different contexts may choose different representations of
    position-types.

    The generic polynomial term itself may be viewed as the initial
    algebra of a polynomial functor.  Specifically, for a given constructor
    type `ctor`, the position-type of that functor is `ctor x Nat`, and
    for each position `(c, n)`, the direction-type is `Fin n` (finite sets
    of size `n`).  (In particular it is itself manifestly finitary.)
    We call this functor `termf` below.
    """

    @typedoc "Functor which generates a generic polynomial term parameterized on a constructor type."
    @type termf(ctor, x) :: {ctor, [x]}

    @typedoc "Type of algebras of `termf`."
    @type termalg(ctor, x) :: (termf(ctor, x) -> x)

    # A functor which generates _open_ terms -- that is, terms
    # which may contain variables drawn from a type parameter.
    @typedoc "Functor which generates open terms:  terms of `t` potentially containing variables."
    @type termfv(ctor, v, x) :: v | termf(ctor, x)

    # `tv(ctor, v)` is the initial algebra of `termfv(ctor, v)`, which is
    # guaranteed to have one because it is polynomial.  It comprises open terms
    # terms like those of `t` but potentially containing variables drawn from
    # type `v`.
    #
    # Viewed as a type constructor, `tv(ctor)` is the free monad of `termf`.
    @typedoc "A generic open polynomial term parameterized on constructor and variable types."
    @type tv(ctor, v) :: termfv(ctor, v, tv(ctor, v))

    # This is the initial algebra of `termf`, which is guaranteed to have
    # one because it is polynomial.  (Its catamorphism is defined below.)
    # It can be equivalently generated (and that is what we do here, to minimize
    # the number of explicitly-recursive types) by applying the free monad to
    # the initial object (i.e. the empty type).
    #
    # Because this is an "open" term with variable type `none()` -- that is,
    # no variables -- it is the type of _closed_ terms.
    @typedoc "A generic polynomial term parameterized on a constructor type."
    @type t(ctor) :: tv(ctor, none())

    @typedoc "An open natural polynomial term with variables of type `v`."
    @type nat_tv(v) :: tv(non_neg_integer(), v)

    @typedoc "An open polynomial term with Elixir atom constructors and variables of type `v`."
    @type atom_tv(v) :: tv(atom(), v)

    @typedoc "An open polynomial term with Nock atom constructors and variables of type `v`."
    @type nock_atom_tv(v) :: tv(Noun.noun_atom(), v)

    @typedoc "An open polynomial term with Nock noun constructors and variables of type `v`."
    @type nock_noun_tv(v) :: tv(Noun.t(), v)

    @typedoc "A generic polynomial term with natural-number constructors."
    @type nat_term :: t(non_neg_integer())

    @typedoc "A generic polynomial term with Elixir atom constructors."
    @type atom_term :: t(atom())

    @typedoc "A generic polynomial term with Nock atom constructors."
    @type nock_atom_term :: t(Noun.noun_atom())

    @typedoc "A generic polynomial term with Nock noun constructors."
    @type nock_noun_term :: t(Noun.t())

    @doc """
    I am the catamorphism (fold) -- the universal morphism out of
    an initial algebra -- for `NockPoly.Term.t`.

    `cata(term, algebra)` recursively folds the term by applying the given
    algebra function to each constructor along with the list of results from
    folding its children.

    The algebra should be a function of type `(ctor, [r]) -> r`,
    where `ctor` is the constructor type and `r` is an arbitrary result type.
    """
    @spec cata(t(ctor), termalg(ctor, r)) :: r when ctor: term, r: term
    def cata({ctor, children}, algebra) do
      results = Enum.map(children, &cata(&1, algebra))
      algebra.(ctor, results)
    end

    @doc """
    I return the maximum depth of the term as a natural number.

    Depth is 1 for a term with no children.
    """
    @spec depth(t(any)) :: non_neg_integer()
    def depth(term) do
      cata(term, fn _ctor, depths ->
        1 + Enum.max([0 | depths])
      end)
    end

    @doc """
    I return the total number of constructors in the term.
    """
    @spec size(t(any)) :: non_neg_integer()
    def size(term) do
      cata(term, fn _ctor, sizes ->
        1 + Enum.sum(sizes)
      end)
    end
  end
end
