spec TestOK observes eTestSuccessful, eTestFailed {
  start state Init {
    entry {
      goto watchEvents;
    }
  }

  state watchEvents {
    on eTestSuccessful do {

    }

    on eTestFailed do {
      assert true, "Test failed";
    }
  }
}
