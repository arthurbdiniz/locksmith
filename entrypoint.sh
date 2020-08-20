#!/bin/bash
set -e
# made by dinizin
# Remove a potentially pre-existing server.pid for Rails.
rm -f /tmp/pids/server.pid

function_postgres_ready() {
ruby << END
  require 'pg'
  puts 'Version of libpg: ' + PG.library_version.to_s
  begin
    con = PG.connect( dbname: "$POSTGRES_DB", 
                user: "$POSTGRES_USER", 
                host: "$POSTGRES_HOST", 
                password: "$POSTGRES_PASSWORD")
  rescue PG::Error => e
    puts e.message
    exit -1
  ensure
    con.close if con
    exit 0
  end
END
}

until function_postgres_ready; do
  >&2 echo "POSTGRES IS UNAVAILABLE, SLEEP"
  sleep 1
done

echo "POSTGRES IS UP, CONTINUE"

echo "CHECKING DATABASE"


if bundle exec rake db:exists; then
  echo "DATABASE ALREADY EXISTS"
  echo "RUNNING MIGRATIONS"
  rails db:migrate
else
  echo "CREATING DATABASE"
  rails db:setup
fi


echo "INITING SERVER"
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"