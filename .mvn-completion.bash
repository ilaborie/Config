# Bash Maven2 completion
#

_mvn()
{
  local cmds cur colonprefixes

      cmds="clean validate compile test package \
                  verify install deploy test-compile site generate-sources \
                  install:install-file
                  process-sources generate-resources process-resources \
                  eclipse:eclipse eclipse:add-maven-repo eclipse:clean \
                  -DartifactId= -DgroupId= -Dmaven.test.skip=true \
                  -Declipse.workspace= -DarchetypeArtifactId= \
				  -DdownloadSources=true -DdownloadJavadocs=true \
                  -Dwtpversion=2.0 -DskipTests \
                  dependency:tree dependency:analyze \
                  hibernate3:hbm2ddl \
                  archetype:generate \
                  archetype:create-from-project \
                  tomcat:run tomcat:run-war tomcat:deploy"
           COMPREPLY=()
           cur=${COMP_WORDS[COMP_CWORD]}
                            # Work-around bash_completion issue where bash interprets a colon as a separator.
  # Work-around borrowed from the darcs work-around for the same issue.
  colonprefixes=${cur%"${cur##*:}"}
                                COMPREPLY=( $(compgen -W '$cmds'  -- $cur))
            local i=${#COMPREPLY[*]}
            while [ $((--i)) -ge 0 ]; do
            COMPREPLY[$i]=${COMPREPLY[$i]#"$colonprefixes"} 
        done
   
   return 0
   } &&
   complete -F _mvn mvn

