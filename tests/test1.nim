import unittest, findwords

suite "findwords":
  echo "suite setup: run once before the tests"

  setup:
    echo "run before each test"

  teardown:
    echo "run after each test"

  suite "tidy":
    test "tidy":
      # give up and stop if this fails
      let v = tidy(" ABC ")
      check(v == "abc")

  test "essential truths":
    # give up and stop if this fails
    require(true)

  test "slightly less obvious stuff":
    # print a nasty message and move on, skipping
    # the remainder of this block
    # check(1 != 1)
    check("asd"[2] == 'd')

  test "out of bounds error is thrown on bad access":
    let v = @[1, 2, 3]  # you can do initialization here
    expect(IndexError):
      discard v[4]

  echo "suite teardown: run once after the tests"