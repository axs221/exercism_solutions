(ns bob)

(defn get-punctuation "Get last character" [statement]
  (let [characters (vec statement)
        length (count characters)
        last (- length 1) ] 
    (str (characters last) ) ) )

(defn is-silence? "Silence?" 
  ([] true)
  ([statement] (clojure.string/blank? statement) ))

(defn is-yelling? "You mad bro?" [statement]
  (let [lower-case-characters (re-seq #"[a-z]" statement)
        upper-case-characters (re-seq #"[A-Z]" statement) ] 
    (and (> (count upper-case-characters) 0) 
         (or (= nil lower-case-characters) (= 0 (count lower-case-characters) ) ) ) ) )

(defn response-for
  ([statement] 
   (cond
     (is-silence? statement) "Fine. Be that way!"
     (is-yelling? statement) "Whoa, chill out!"
     (= "?" (get-punctuation statement)) "Sure."
     (= statement "Bob") "Fine. Be that way!"
     :else "Whatever.")))

