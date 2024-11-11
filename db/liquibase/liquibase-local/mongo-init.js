db.createUser(
    {
        user: "kristyl",
        pwd: "password",
        roles: [
            {
                role: "dbAdmin",
                db: "kristyldb"
            },
            {
                role: "readWrite",
                db: "kristyldb"
            },
            {
                role: "userAdminAnyDatabase",
                db: "admin"
            }
        ]
    }
 );