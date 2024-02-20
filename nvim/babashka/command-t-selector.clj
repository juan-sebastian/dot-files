(require '[babashka.process :refer [shell]])
(require '[babashka.fs :as fs])
(require '[cheshire.core :as json])
(require '[clojure.string :as str])


(defn -watchman-available? []
  (let [cwd (str (fs/cwd))
        is-being-watched? (fn [roots] (some #(str/starts-with? cwd %) roots))]
    (some-> (shell {:out :string} "watchman watch-list")
            (#(when (zero? (:exit %1)) (:out %1)))
            (json/parse-string true)
            :roots
            (is-being-watched?))))

(defn -ripgrep-available? []
  (some-> (shell {:out :string} "rg --version")
          (:exit)
          (zero?)))

(defn -git-available? []
  (some-> (shell {:out :string} "git status")
          (:exit)
          (zero?)))

(comment
  (-watchman-available?)
  (-ripgrep-available?)
  (-git-available?))

(print (cond
        (-watchman-available?) "CommandTWatchman"
        (-ripgrep-available?)  "CommandTRipgrep"
        (-git-available?)      "CommandTGit"
        :else                  "CommandT"))
