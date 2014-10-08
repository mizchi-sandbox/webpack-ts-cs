/// <reference path="foo.ts" />

module M {
  class A {
      p: Point;
      constructor(){
          this.p = {x: 1, y: 3};
      }
  }
}

export = M;
