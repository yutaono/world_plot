mongoose = require("mongoose")

Schema = mongoose.Schema

UserSchema = new Schema(
    user_id: String
    created: Date
)

mongoose.model "User", UserSchema

uri = process.env.MONGOHQ_URL or "mongodb://localhost/world_plot_db"
mongoose.connect uri

module.exports.User = mongoose.model "User"