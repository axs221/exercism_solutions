(ns hello-world)

(defn hello 
  ([] "Hello, World!")
  ([args] (reduce str ["Hello, " args "!"])))
